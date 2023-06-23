<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //Session checking (by Amir)
    if(session.getAttribute("Employee") == null) {
        request.setAttribute("errMessage", "You have not login");
        request.getRequestDispatcher("/index.jsp").forward( request, response);
    }%>

<%@page import="com.hotel.dao.roomDao"%>
<%@page import="com.hotel.model.room"%>
<%@page import="java.util.*"%>

    <%//JSP code
        roomDao rdao = new roomDao(); //Get customer dao
        List roomlist = rdao.getRoomList();
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menuCascading.css">
        <title>List of Rooms</title>
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
                    <th>Room ID</th>
                    <th>Room Number</th>
                    <th>Room Type</th>
                    <th>Room Price</th>
                    <th>Room Status</th>
            </tr>
            <% //Display all data
            if(roomlist != null) {
                for(Object obj: roomlist) {
                    room r = (room) obj;
            %>
                <tr>
                    <td><%=r.getRoomID() %></td>
                    <td><%=r.getRoomNum() %></td>
                    <td><%=r.getRoomType() %></td>
                    <td><%=r.getRoomPrice() %></td>
                    <td><%=r.getStatus() %></td>
                </tr><% } }%>
        </table>
    </body>
</html>
