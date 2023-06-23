package com.hotel.util;
//Imports
import java.sql.*;
//Class for HOtel Management Database connection
public class HoteldbConn {
    public static Connection connectToDB(){
        //Setting up Connection object
        Connection conn = null;
        String driver = "org.apache.derby.jdbc.ClientDriver";
        String url = "jdbc:derby://localhost:1527/Customer";
        String dbUser = "app"; String dbPassword="app";
         try {
            try{ //Loading the driver
                Class.forName(driver);
            } //If the driver fail to load
            catch (ClassNotFoundException e){
                e.printStackTrace();
            }
            //Have the connection object connect to the database
            conn = DriverManager.getConnection(url,dbUser,dbPassword );
            System.out.println("Printing connection object "+conn);
        } catch(Exception e){
            e.printStackTrace();
        }
        //Return the Database Connection Object
        return conn;
    }
}
