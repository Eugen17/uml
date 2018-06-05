package DAO;




import java.sql.*;
import java.sql.DriverManager;


public class DAOFactory {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/main?useSSL=false&serverTimezone=UTC";


    public DAOFactory() {
        createConnection();
    }

    public static Connection createConnection() {
        try {
            try {
                Class.forName(JDBC_DRIVER);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            return DriverManager.getConnection(URL, "root", "root");
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    public SessionDAO getSessionDAO() {
        return new SessionDAO();
    }
    public UserDAO getUserDAO() {
        return new UserDAO();
    }
}
