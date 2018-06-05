package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {

    private static final String DELETE = "DELETE FROM users WHERE username=?";
    private static final String FIND_ALL = "SELECT * FROM users ORDER BY username";
    private static final String FIND_NAME = "SELECT * FROM users WHERE username=?";

    public UserDAO() {
    }

    public List<User> findAll() {
        boolean i = false;
        List<User> Users = new ArrayList<>();
        try {
            Connection conn = DAOFactory.createConnection();
            PreparedStatement ps = conn.prepareStatement(FIND_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                try {
                    User sss = new User(rs.getString("username"), Integer.parseInt(rs.getString("password")), rs.getString("isadmin"));
                    Users.add(sss);
                }
                catch (Exception ex){ex.printStackTrace();}

            }
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return Users;
    }

    public boolean insertUser(User sss) {
        boolean i = false;
        try {
            Connection conn = DAOFactory.createConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO users VALUES (?, ?,?,b?)");
            ps.setString(1, sss.getName());
            ps.setString(2, sss.getPassword().toString());
            ps.setString(3, sss.getToken());
            ps.setString(4, sss.getIsAdmin());

            i = (ps.executeUpdate() != 0);
            conn.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }

    public boolean deleteUser(String name) {
        boolean i = false;
        try {
            Connection conn = DAOFactory.createConnection();
            PreparedStatement ps = conn.prepareStatement(DELETE);
            ps.setString(1, name);

            i = (ps.executeUpdate() != 0);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public User findByName(String name) {
        User sss = null;
        try {
            Connection conn = DAOFactory.createConnection();
            PreparedStatement ps = conn.prepareStatement(FIND_NAME);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            rs.next();
            sss = new User(rs.getString("username"), Integer.parseInt(rs.getString("password")),rs.getString("isadmin"));

            ps.close();
            conn.close();
            return sss;
        } catch (Exception ex) {
            //ex.printStackTrace();
            return null;
        }

    }

    public boolean findUser(User sss) {
        boolean i = false;
        try {
            Connection conn = DAOFactory.createConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, sss.getName());
            ps.setString(2, sss.getPassword().toString());
            i = ps.executeQuery().next();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public boolean updateToken(User sss) {

        boolean i = false;
        Connection conn = DAOFactory.createConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE users SET token=? WHERE username=?");

            ps.setString(2, sss.getName());
            ps.setString(1, sss.getToken());

            System.out.println(sss.getToken());
            i = (ps.executeUpdate() != 0);
            conn.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }

    public boolean closeToken(User sss) {

        boolean i = false;
        Connection conn = DAOFactory.createConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE users SET token=1313  WHERE username=?");

            ps.setString(1, sss.getName());

            i = (ps.executeUpdate() != 0);
            conn.close();


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.print(i);
        return i;
    }
}
