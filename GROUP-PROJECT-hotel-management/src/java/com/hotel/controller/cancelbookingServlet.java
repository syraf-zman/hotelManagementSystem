package com.hotel.controller;

import com.hotel.dao.*;
import com.hotel.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cancelbookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Start of doPost() method
        
        //Get the parameters
        String bookid = request.getParameter("bookingid");
        String roomid = request.getParameter("roomid");
        String custid_del = request.getParameter("deletecust");
        
        //Delete the booking data
        BookingDao bkdao = new BookingDao();
        bkdao.deleteBooking(bookid);
        
        //Update room's status
        roomDao rdao = new roomDao();
        rdao.updateRoomStatus(roomid);
        
        //Delete customer's data
        CustomerDao cdao = new CustomerDao();
        cdao.deleteCustomer(custid_del);
        
        //Redirect to checkBooking.jsp
        request.setAttribute("delbooking", "Booking has been removed");
        RequestDispatcher view = request.getRequestDispatcher("/checkBooking.jsp");
        view.forward(request, response);
        
        //End of doPost() method
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
