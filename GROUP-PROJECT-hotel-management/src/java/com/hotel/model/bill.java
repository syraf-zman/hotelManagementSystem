/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hotel.model;

/**
 *
 * @author FAHMI
 */
public class bill {
    private String billID;
    private String bookingID;
    private String employeeID;
    private String roomNum;
    private String totalPrice;
    
    public bill(String billID, String bookingID, String employeeID, String roomNum, String totalPrice){
        this.billID=billID;
        this.bookingID=bookingID;
        this.employeeID=employeeID;
        this.roomNum=roomNum;
        this.totalPrice=totalPrice;
    }

    /**
     * @return the billID
     */
    public String getBillID() {
        return billID;
    }

    /**
     * @param billID the billID to set
     */
    public void setBillID(String billID) {
        this.billID = billID;
    }

    /**
     * @return the bookingID
     */
    public String getBookingID() {
        return bookingID;
    }

    /**
     * @param bookingID the bookingID to set
     */
    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    /**
     * @return the employeeID
     */
    public String getEmployeeID() {
        return employeeID;
    }

    /**
     * @param employeeID the employeeID to set
     */
    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    /**
     * @return the roomNum
     */
    public String getRoomNum() {
        return roomNum;
    }

    /**
     * @param roomNum the roomNum to set
     */
    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    /**
     * @return the totalPrice
     */
    public String getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}
