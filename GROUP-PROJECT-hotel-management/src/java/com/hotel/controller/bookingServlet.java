package com.hotel.controller;
//imports
import com.hotel.dao.*;
import com.hotel.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class bookingServlet extends HttpServlet {

        private PreparedStatement pstmt;
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ///By Amir
        
        List errorMsgs = new LinkedList(); //Get Error Message
        
        //Parameters received which in used:
        String custname = request.getParameter("custName");
        String phoneNo = request.getParameter("custPhone");
        String bkdate = request.getParameter("bookingDate");
        String roomType = request.getParameter("roomType");
        String roomID = request.getParameter("roomID");
        
        //Get the information of the user employee
        HttpSession session = request.getSession();
        //If there is no session / session time out is reached
        if(session.getAttribute("Employee") == null){
            request.setAttribute("errMessage", "Login to continue ...");
            request.getRequestDispatcher("/index.jsp").forward( request, response);
            return;
        }
        
        Employee emp = (Employee)session.getAttribute("Employee");
        
        //Check availability of the room
        roomDao rdao = new roomDao();
        room cr = rdao.getRoomByID(roomID);
        
        
        //Checking null entry
        if(custname == null || custname.trim().length() == 0){
            errorMsgs.add("Please enter customer's name");
        }
        if(phoneNo == null || phoneNo.trim().length() == 0){
            errorMsgs.add("Please enter customer's phone number");
        }
        if(bkdate == null || bkdate.trim().length() == 0){
            errorMsgs.add("Please enter booking date ");
        }
        if(roomType == null || roomType.trim().length() == 0){
            errorMsgs.add("Please select type of room");
        }
        if(roomID == null || roomID.trim().length() == 0){
            errorMsgs.add("Please select room number");
        }
        if ( !errorMsgs.isEmpty()) {
            request.setAttribute("errorMsgs", errorMsgs);
            RequestDispatcher view = request.getRequestDispatcher("/booking.jsp");
            view.forward(request, response);
            return;
        }
        
        //insert customer data to database if there is no existing data
        CustomerDao custdao = new CustomerDao();
        Customer cust = custdao.getCustomer(custname, phoneNo);
        if(cust == null){
            cust = custdao.addCustomer((new Customer("0",custname,phoneNo)));
        }
        
        //update selected room's status
        rdao.updateRoomStatus(roomID);
        
        //Create a data access object (DAO) booking information
        BookingDao bkdao = new BookingDao();
        //Generate a booking id
        String bookID = bkdao.generateBookID();
        
        //Create a booking information object
        booking bk = new booking(bookID,
                emp.getEmployeeID(),cr.getRoomID(),cust.getCustomerID(),bkdate);
        bkdao.addBooking(bk);
        
        //Redirect to successBooking.jsp
        request.setAttribute("custName",custname);
        request.setAttribute("custPhone", phoneNo);
        request.setAttribute("bookingDate",bkdate);
        request.setAttribute("roomType",roomType);
        RequestDispatcher view = request.getRequestDispatcher("/successBooking.jsp");
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
