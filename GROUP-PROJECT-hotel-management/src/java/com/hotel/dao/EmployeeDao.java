/** Author 1: Mohammad Amir
 * @
 */
package com.hotel.dao;
//imports
import com.hotel.util.HoteldbConn; //DB connection
import com.hotel.model.Employee;
import java.sql.*;
//Employee data access object (DAO)
public class EmployeeDao {
    //Get connection
    public Connection con;
    
    //methods
    //Connect to database
    private void openDB(){ con=HoteldbConn.connectToDB();}
    //Close the database
    private void closeDB() throws SQLException {con.close();}
    //1) Get employee from the database
    public Employee getEmployee(String usr,String pwd){
        openDB(); // Connect to db
        try{
            String sql = "select * from receptionist where username='"+usr+
                    "' and password='"+pwd+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next(); //Calls fisrt row
            String empid = rs.getString("employeeid");
            String empname = rs.getString("employeename");
            Employee emp = new Employee(empid,empname,usr,pwd);
            closeDB();//close connection
            return emp;
            
        } catch (Exception e) {
            System.out.println((e));
        }
        return null;
    }
    
    //2) Get employee by id from database
    public Employee getEmployeeByID(String id){
        openDB(); // COnnect to db
        try{
            String sql = "select * from receptionist where employeeid='"
                    +id+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next(); //Calls fisrt row
            String empid = rs.getString("employeeid");
            String empname = rs.getString("employeename");
            String usr = rs.getString("username");
            String pwd = rs.getString("password");
            Employee emp = new Employee(empid,empname,usr,pwd);
            closeDB();//close connection
            return emp;
            
        } catch (Exception e) {
            System.out.println((e));
        }
        return null;
    }
}
