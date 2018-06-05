package DAO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.*;
import java.time.Instant;
@Entity
@Table(name="users", schema ="main")
public class User {


    private Integer password;
    @Id
    @Column(name = "username", length = 100, nullable = false)
    private String username;
    private String token;
    private String isAdmin;

    public User() {
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public User(String username, String password) {
        token = Integer.toString(Instant.now().hashCode());
        this.password = password.concat("saltyprotection").hashCode();
        this.username = username;
        this.isAdmin="0";


    }


    public User(String username, String password,String isAdmin) {
        token = Integer.toString(Instant.now().hashCode());
        this.password = password.concat("saltyprotection").hashCode();
        this.username = username;
        this.isAdmin=isAdmin;


    }

    public User(String username, Integer password, String isAdmin) {
        token = Integer.toString(Instant.now().hashCode());
        this.password = password;
        this.username = username;
        this.isAdmin=isAdmin;


    }

    public Integer getPassword() {
        return password;
    }

    public void setPassword(Integer password) {
        this.password = password;
    }

    public String getName() {
        return username;
    }

    public void setName(String name) {
        this.username = name;
    }

    @Override
    public String toString() {
        return "User{"
                + "username=" + username
                + ", password='" + password + '\''
                + '}';
    }

}
