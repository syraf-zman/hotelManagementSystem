/** Author 1: Mohammad Amir
 * Editor:
 * @
 */
package com.hotel.dao;
//imports
import com.hotel.util.HoteldbConn; //DatabaseConnection
import java.sql.*;

//User login data access object (DAO)
public class LoginDao {
    public String validateUser(String usr,String pwd){
        
        //Get the User's information
        String username = usr;
        String password = pwd;
        
        //Setting up database connection
        Connection con = null; //DB connection
        Statement stmt = null; //SQL query statement
        ResultSet resultSet = null; //SQL result
        
        //Connect to the database
        try {
            con = HoteldbConn.connectToDB();//establishing connection
            stmt = con.createStatement(); //stmt used to write queries
            String sql; //sql select stmt
            sql = "select * from receptionist where username='"+username+
            "' and password='"+password+"'";

            resultSet = stmt.executeQuery(sql);// execute query
            if (resultSet.next()) { //record found (enter username & password
                return "SUCCESS"; //match with value in db 
            }
            con.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}