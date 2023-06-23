<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.hotel.dao.*"%>
<%@page import="com.hotel.model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<% //Session checking (by Amir)
    if(session.getAttribute("Employee") == null) {
        request.setAttribute("errMessage", "You have not login");
        request.getRequestDispatcher("/index.jsp").forward( request, response);
    }%>
<html>
    <head>
        <title>Delete Booking</title>
        <link rel="stylesheet" href="menuCascading.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <%  //JSP codes
        //Get the booking id from url
        String bookid = request.getParameter("bookid");
        //Get booking data
        BookingDao bkdao = new BookingDao();
        booking bk = bkdao.getBookingID(bookid);
        bkdao.releaseBookList(); //Clear list of data
        
        //Get customer id and room id from booking object
        String custid = bk.getCustomerID();
        String roomid = bk.getRoomID();
        
        //Get data from table Customer
        CustomerDao cdao = new CustomerDao();
        Customer cust = cdao.getCustomer(custid);
        
        //Get data from the table Room
        roomDao rdao = new roomDao();
        room custroom = rdao.getRoomByID(roomid);
        
        //Get Employee/Receptionist data
        EmployeeDao empdao = new EmployeeDao();
        Employee emp = empdao.getEmployeeByID(bk.getEmployeeID());
        %>
    <body>
        <h1>HOTEL MANAGEMENT SYSTEM</h1>
        <div class="topnav">
            <a href="JSPmenu.jsp">Dashboard</a>
            <a class="active" href="#">New booking</a>
            <a href="checkBooking.jsp">Check booking</a>
            <a href="index.html">Log out</a>
        </div><br><br>
        
        <div class="divBooking">
        <%-- Receive Data From JSP code --%>
        <h3>Edit Booking Info: <%=bookid%></h3>
            <form name="form" action="cancelbooking.do" method="POST">
                
                <%--Hidden Input--%>
                <input type="hidden" name="bookingid" value="<%=bookid%>">
                <input type="hidden" name="roomid" value="<%=bk.getRoomID() %>">
                
                <br>Name&nbsp&nbsp <input type="text" name="custName" 
                       value="<%=cust.getCustomerName()%>" readonly><br><br>

                Phone&nbsp&nbsp<input type="text" name="custPhone" 
                       value="<%=cust.getCustomerPhoneNum()%>" readonly><br><br>
                    
                Date&nbsp&nbsp<input type="date" name="bookingDate" value="<%=bk.getBookingDate()%>" readonly=""><br><br>
                
                Selected Room Number : <%=custroom.getRoomNum() %> -
                    (<%=custroom.getRoomType()%>) <br><br>
                Booking Recorded By: <%=emp.getEmployeeName()%> (
                <%=emp.getEmployeeID() %>)<br><br>
                
                <input type="hidden" name="deletecust" 
                       value="<%=cust.getCustomerID() %>">
                <br><br>
                
                <input style="width:120px;height:25px;"
                       type="submit" value="Confirm Delete">
            </form>
                <button onclick="location.href='checkBooking.jsp';"
                 style="width:80px;height:25px;">Back</button><br><br>
        </div>
    </body>
</html>
