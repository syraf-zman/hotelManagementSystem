<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //Session checking (by Amir)
    if(session.getAttribute("Employee") == null) {
        request.setAttribute("errMessage", "You have not login");
        request.getRequestDispatcher("/index.jsp").forward( request, response);
    }%>

<%@page import="com.hotel.dao.CustomerDao"%>
<%@page import="com.hotel.model.Customer"%>
<%@page import="java.util.*"%>

    <%//JSP code
        CustomerDao custdao = new CustomerDao(); //Get customer dao
        List custlist = custdao.getCustomerList();
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menuCascading.css">
        <title>List of Customers</title>
    </head>
    <body>
        <h1>HOTEL MANAGEMENT SYSTEM</h1>
        <div class="topnav">
            <a href="JSPmenu.jsp">Dashboard</a>
            <a href="booking.jsp">New booking</a>
            <a href="checkBooking.jsp">Check booking</a>
            <a href="logout.do">Log out</a>
        </div>
        <h3 style="background-color: white">List of Customers</h3>
        <table border="1" cellspacing="5" cellpadding="10" width="80%" >
            <tr>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Phone Number</th>
            </tr>
            <% //Display all data
            if(custlist != null) {
                for(Object obj: custlist) { 
                    Customer c = (Customer) obj;
            %>
                <tr>
                    <td><%=c.getCustomerID()%></td>
                    <td><%=c.getCustomerName() %></td>
                    <td><%=c.getCustomerPhoneNum() %></td>
                </tr><% } }%>
        </table>
    </body>
</html>