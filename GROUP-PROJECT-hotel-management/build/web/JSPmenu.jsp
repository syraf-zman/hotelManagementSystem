<%-- 
    Document   : JSPmenu
    Created on : 23 Jun 2022, 8:45:03 AM
    Author     : FAHMI
--%>
<% //Session checking (by Amir)
    if(session.getAttribute("Employee") == null) {
        request.setAttribute("errMessage", "You have not login");
        request.getRequestDispatcher("/index.jsp").forward( request, response);
    }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:useBean id="Employee" scope="session" type="com.hotel.model.Employee" />
<!DOCTYPE html>
<html>
    <head>
        <title>Hotel Menu</title>
        <link rel="stylesheet" href="menuCascading.css">

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>HOTEL MANAGEMENT SYSTEM</h1>
        <div class="topnav">
            <a class="active" href="#home">Dashboard</a>
            <a href="booking.jsp">New booking</a>
            <a href="checkBooking.jsp">Check booking</a>
            <a href="logout.do">Log out</a>
        </div><br>
        Employee ID&nbsp;&nbsp;&nbsp;&nbsp; : <c:out value="${Employee.employeeID}"></c:out><br>
        Employee Name: <c:out value="${Employee.employeeName}"></c:out>
    </body>
</html>
