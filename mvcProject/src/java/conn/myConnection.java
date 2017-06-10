/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conn;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author JARVIS
 */
public class myConnection {
    private static Connection con;
    public static Connection getCon()
    {
        try {
             Class.forName("com.mysql.jdbc.Driver");
             con=DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/mvc","root","IP");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
