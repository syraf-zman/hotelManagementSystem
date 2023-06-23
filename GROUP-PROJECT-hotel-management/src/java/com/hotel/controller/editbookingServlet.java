package com.hotel.controller;

import com.hotel.dao.*;
import com.hotel.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class editbookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Start of doPost() method
        
        List errorMsgs = new LinkedList(); //Get Error Message
        
        //Get the information of the user employee
        HttpSession session = request.getSession();
        //If there is no session / session time out is reached
        if(session.getAttribute("Employee") == null){
            request.setAttribute("errMessage", "Login to continue ...");
            request.getRequestDispatcher("/index.jsp").forward( request, response);
            return;
        }
        Employee emp = (Employee)session.getAttribute("Employee");
        
        //Get parameters from submitted form
        String bookingid = request.getParameter("bookingid");
        String custname = request.getParameter("custName");
        String phoneNo = request.getParameter("custPhone");
        String bkdate = request.getParameter("bookingDate");
        String prev_roomid = request.getParameter("prevRoomid");
        String roomType = request.getParameter("roomType");
        String roomID = request.getParameter("roomID");
        
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
        if ( ! errorMsgs.isEmpty()) {
            request.setAttribute("errorMsgs", errorMsgs);
            RequestDispatcher view = request.getRequestDispatcher("/editbooking.jsp");
            view.forward(request, response);
            return;
        }
        
        //Get booking data
        BookingDao bkdao = new BookingDao();
        booking bk = bkdao.getBookingID(bookingid);
        
        //update customer data in the database
        CustomerDao custdao = new CustomerDao();
        Customer cust = custdao.updateCustomer(
                (new Customer(bk.getCustomerID(),custname,phoneNo)));
        
        //update room data in the database
        roomDao rdao = new roomDao();
        //Get previous room data
        room prev_room = rdao.getRoomByID(prev_roomid);
        
        if(roomType.equals("") || roomType.trim().length() == 0){
                roomID = prev_roomid; //Use the current room id as the previous
                room r = rdao.getRoomByID(prev_roomid);
                roomType = r.getRoomType();
        } else {
            //Previous room id will be updated
            rdao.updateRoomStatus(prev_roomid);
            rdao.updateRoomStatus(roomID);
        }
        booking newbk = new booking(bookingid,emp.getEmployeeID(),
        roomID,cust.getCustomerID(),bkdate);
        bkdao.updateBooking(newbk);
            
        //Redirect to editsuccessBooking.jsp
        request.setAttribute("custName",custname);
        request.setAttribute("custPhone", phoneNo);
        request.setAttribute("bookingDate",bkdate);
        request.setAttribute("roomType",roomType);
        request.setAttribute("editbooking", "success");
        RequestDispatcher view = request.getRequestDispatcher("/successBooking.jsp");
        view.forward(request, response);
        
        //End of doPost() method
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
