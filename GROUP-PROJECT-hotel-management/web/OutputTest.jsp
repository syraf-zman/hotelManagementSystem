<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%-- TESTING FILE ONLY AND NOT INCLUDED --%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking Room</title>
        <link rel="stylesheet" href="menuCascading.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
    <%  //JSP code
        String cname = request.getParameter("custName");
        String cphone = request.getParameter("custPhone");
        String bkDate = request.getParameter("bookingDate");
        String rtype = request.getParameter("roomType");
        String rno = request.getParameter("roomID");
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
        <%-- List of room numbers --%>
        Name: <%=cname%><br><br>
        Phone No: <%=cphone%><br><br>
        Booking Date: <%=bkDate%><br><br>
        Room Type: <%=rtype%><br><br>
        Room Number: <%=rno%><br><br>
        </div>
    </body>
</html>
