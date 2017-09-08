
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author kasun lakmal
 */
public class DB {
    Connection conn;
    Statement stmt;
    ResultSet res;
    
    public DB(){
        
    }
    public Connection setConnection() throws SQLException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn =DriverManager.getConnection("jdbc:mysql://localhost/banksystem_db", "root", "");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    public ResultSet getResulyt(String sql, Connection conn){
        try{
            stmt =conn.createStatement();
            res = stmt.executeQuery(sql);
        }catch(Exception e){
            
        }
        return res;
    }
}
