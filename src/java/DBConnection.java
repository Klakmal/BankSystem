/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Ganusha
 */
public class DBConnection {
    private final String url = "jdbc:mysql://localhost/banksystem_db";
    private final String user = "root";
    private final String password = "";

    
    public Connection getConnection() throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, user, password);

        return connection;
    }
    
}
