package connection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author Layantha
 */
public class DB {
    private static Connection c;
    private static void setNewconnection ()throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        c=DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineexam", "root", "123");
        
    }
    public static void iud (String sql)throws Exception{
        if(c==null){
            setNewconnection();
        }
        c.createStatement().executeUpdate(sql);
    }
    public  static ResultSet search (String sql)throws Exception{
        if(c==null){
            setNewconnection();
        }
        return c.createStatement().executeQuery(sql);
    }
    
    public static Connection getMyconnection()throws Exception{
        if(c==null){
            setNewconnection();
        }
        return c;    
    }
}

