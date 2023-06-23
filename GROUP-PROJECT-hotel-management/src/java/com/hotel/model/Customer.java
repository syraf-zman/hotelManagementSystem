package com.hotel.model;

/**
 *
 * @author FAHMI
 */
public class Customer {
    private String customerID;
    private String customerName;
    private String customerPhoneNum;
    
    public Customer(String id, String name, String phone){
        this.customerID=id;
        this.customerName=name;
        this.customerPhoneNum=phone;
    }

    /**
     * @return the customerID
     */
    public String getCustomerID() {
        return customerID;
    }

    /**
     * @param customerID the customerID to set
     */
    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    /**
     * @return the customerName
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * @param customerName the customerName to set
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * @return the customerPhoneNum
     */
    public String getCustomerPhoneNum() {
        return customerPhoneNum;
    }

    /**
     * @param customerPhoneNum the customerPhoneNum to set
     */
    public void setCustomerPhoneNum(String customerPhoneNum) {
        this.customerPhoneNum = customerPhoneNum;
    }
}