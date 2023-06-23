<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //Session checking (by Amir)
    if(session.getAttribute("Employee") == null) {
        request.setAttribute("errMessage", "You have not login");
        request.getRequestDispatcher("/index.jsp").forward( request, response);
    }%>
<%@ page language="java" import="java.sql.*" %>
<%@page import="java.sql.*"%>
<%@page import="com.hotel.dao.*"%>
<%@page import="com.hotel.model.*"%>
<%@page import="java.util.*"%>

    <%//JSP code
        //Get Booking List
        BookingDao bkdao = new BookingDao(); //Edited by Amir
        List bklist = bkdao.getBookList();
        
        CustomerDao custdao = new CustomerDao(); //Get customer dao
        EmployeeDao empdao = new EmployeeDao(); //Get employee dao
        roomDao rdao = new roomDao(); //Get room list
    %>

<!DOCTYPE html>
<html>
<style>
.tooltip {
  position: relative;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 180px;
  background-color: #99ffcc;
  color: #006666;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menuCascading.css">
        <title>Check Booking</title>
    </head>
    <body>
        <h1>HOTEL MANAGEMENT SYSTEM</h1>
        <div class="topnav">
            <a href="JSPmenu.jsp">Dashboard</a>
            <a href="booking.jsp">New booking</a>
            <a class="active" href="#">Check booking</a>
            <a href="logout.do">Log out</a>
        </div>
        <h3>List of Bookings</h3>
       <% //If delete operation was done, display message
           if(request.getAttribute("delbooking") != null){
               Object p = request.getAttribute("delbooking");
               %><p style="color:red;background-color:white;"><%=p%></p><%
           }
       %>
        <table border="1" cellspacing="5" cellpadding="10" width="80%" >
            <tr>
                    <th>Booking ID</th>
                    <th>Employee ID</th>
                    <th class="tooltip">Room ID
                    <span class="tooltiptext">
                            View:<br>
                            <a href="RoomList.jsp">List of Rooms</a>
                        </span>
                    </th>
                    <th class="tooltip">Customer ID
                        <span class="tooltiptext">
                            View:<br>
                            <a href="CustomerList.jsp">List of Customers</a>
                        </span>
                    </th>
                    <th>Booking Date</th>
                    <th>Actions</th>
            </tr>
            <% //Display all data
            if(bklist != null) {
                for(Object obj: bklist) {
                    booking bk = (booking) obj;
                    Customer c = custdao.getCustomer(bk.getCustomerID());
                    Employee emp = empdao.getEmployeeByID(bk.getEmployeeID());
                    room r = rdao.getRoomByID(bk.getRoomID());
            %>
                
                <tr>
                        <td><%= bk.getBookingID() %></td>
                            <td class="tooltip" ><%= bk.getEmployeeID() %>
                                <span class="tooltiptext">
                                    <%= emp.getEmployeeName() %> <br>
                                </span>
                            </td>
                            <td class="tooltip"><%= bk.getRoomID()  %>
                                <span class="tooltiptext">
                                    Room Type: <%= r.getRoomType() %> <br>
                                    Room Number: <%= r.getRoomNum() %> <br>
                                    Price: RM<%=r.getRoomPrice() %>
                                </span>
                            </td>
                        
                            <td class="tooltip"><%= bk.getCustomerID() %>
                                <span class="tooltiptext">
                                    <%= c.getCustomerName() %> <br>
                                    <%= c.getCustomerPhoneNum() %>
                                </span>
                            </td>
                            
                            
                        <td><%= bk.getBookingDate() %></td>
                        <td><a href="editbooking.jsp?bookid=<%=bk.getBookingID()%>">
                                Edit</a>
                            <a href="deletebooking.jsp?bookid=<%=
                                bk.getBookingID()%>">Cancel</a>
                            </td>
                </tr><% } }%>
        </table>
    </body>
</html>
