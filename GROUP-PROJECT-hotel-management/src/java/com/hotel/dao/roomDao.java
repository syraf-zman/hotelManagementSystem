package com.hotel.dao;
//imports
import com.hotel.model.room;
import com.hotel.util.HoteldbConn;
import java.util.*;
import java.sql.*;
public class roomDao {
    //Member(s)
    private Connection con; //connection object
    private LinkedList roomlist = null;
    
    //methods
    //Connect to database
    private void openDB(){ con=HoteldbConn.connectToDB();}
    //Close the database
    private void closeDB() throws SQLException {con.close();}
    
    //1) Get room list
    public LinkedList getRoomList(){
        //If the data list of room exists, return anyway
        if(roomlist != null) return roomlist;
        
        openDB(); //get Connection
        //Initialize the list of room
        roomlist = new LinkedList();
        String sql = "select * from room order by roomnum";
        Statement stmt;
        try {
            //Get data of each room
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                String roomid = rs.getString("roomid");
                String roomnum = rs.getString("roomnum");
                String roomtype = rs.getString("roomtype");
                double price = rs.getDouble("roompricepernight");
                String status = rs.getString("status");
                
                //Create room bean object
                room newroom = new room(roomid,roomnum,roomtype,price,status);
                
                roomlist.add(newroom);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return roomlist; //Return this variable
    }
    
    //2) Get room object by id
    public room getRoomByID(String id){
        if(roomlist == null) {getRoomList();} //Get all data
        
        for(Object obj: roomlist){
            if(id.equals( ((room)obj).getRoomID() )){
                return (room) obj;
            }
        }
        return null;
    }
    
    //3) Get room object by room number and room type
    public room getRoom(String rn, String type){
        if(roomlist == null) {getRoomList();} //Get all data
        
        for(Object obj: roomlist){
            room croom = (room) obj;
            if(type.equals(croom.getRoomType())){
                if(rn.equals(croom.getRoomNum())){
                    return (room) obj;
                }
            }
        }
        return null;
    }
    
    //4) Get list of room object by type
    public List getRoomListByType(String t){
        if(roomlist == null) {getRoomList();} //Get all data
        List rl = new LinkedList();
        int count = 0; //To track succesfull data comparison
        //Copy specified data to list object
        for(Object obj: roomlist){
            room croom = (room) obj;
            if(t.equals(croom.getRoomType())){
                rl.add(obj);
                count++;
            }
        }
        if(count == 0) return null; //If there's no data found
        
        return rl; //Return list if data found
    }
    
    //5) Update Room Status
    public void updateRoomStatus(String id){
        //Prepare update data
        String status = "";
        
        //Get info of the room
        room r = getRoomByID(id);
        if(r.getStatus().equals("available")){
            status = "booked";
        } else {
            status = "available";
        }
        //Start the database
        openDB();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("update room set status='"+
                    status+"' where roomid='"+id+"'");
            ps.executeUpdate();
            closeDB();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
