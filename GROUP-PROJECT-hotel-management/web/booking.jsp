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
        <title>Booking Room</title>
        <link rel="stylesheet" href="menuCascading.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
    function select_roomType() {
        var rtype = document.getElementById("roomType").value;
        if(rtype === 'single'){
            var st1 = document.getElementById('rsingle').value;
            if(st1 === ""){
                document.getElementById('displayList').innerHTML =
                "There is no room available at the moment<br><br>";
            } else {
            document.getElementById('displayList').innerHTML = 
                    "Room Number&nbsp&nbsp<select name=roomID> "+st1+
                    "</select><br><br>";}
        }
        else if(rtype === 'double'){
            var st1 = document.getElementById('rdouble').value;
            if(st1 === ""){
                document.getElementById('displayList').innerHTML =
                "There is no room available at the moment<br><br>";
            } else {
            document.getElementById('displayList').innerHTML =
                    "Room Number&nbsp&nbsp<select name=roomID> "+st1+
                    "</select><br><br>";}
        }
        else if(rtype === 'suite'){
            var st1 = document.getElementById('rsuite').value;
            if(st1 === ""){
                document.getElementById('displayList').innerHTML =
                "There is no room available at the moment<br><br>";
            } else {
            document.getElementById('displayList').innerHTML = 
                    "Room Number&nbsp&nbsp<select name=roomID> "+st1+
                    "</select><br><br>";}
        }
        else {
            document.getElementById("displayList").innerHTML=
            "Select a room type first <br><br>";
        }
    }
        </script>
    </head>
    <%  //JSP scriptlet
        //Get error message
        List errorMsgs = (List) request.getAttribute("errorMsgs");
        
        //Get data from the table Room
        roomDao rdao = new roomDao();
        List rl = rdao.getRoomList();
        String rsingle="",rdouble="",rsuite="";
            for(Object obj: rl){
                room cr = (room) obj;
                //To get list of option of rooms that are available
                if(cr.getStatus().equals("available")){
                    if(cr.getRoomType().equals("single")) {
                        rsingle = rsingle.concat("<option value="+
                                cr.getRoomID()+">(Single) Room "+
                                cr.getRoomNum()+"</option>");
                    }
                    else if(cr.getRoomType().equals("double")) {
                        rdouble = rdouble.concat("<option value="+
                                cr.getRoomID()+">(Double) Room "+
                                cr.getRoomNum()+"</option>");
                    }
                    else {
                        rsuite = rsuite.concat("<option value="+
                                cr.getRoomID()+">(Suite) Room "+
                                cr.getRoomNum()+"</option>");
                    }
                }
            }
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
        <input id="rsingle" value="<%=rsingle%>" hidden disabled/>
        <input id="rdouble" value="<%=rdouble%>" hidden disabled/>
        <input id="rsuite" value="<%=rsuite%>" hidden disabled/>
        
            <form name="form" action="booking.do" method="POST">
                           
                <br><br>Name&nbsp&nbsp <input type="text" name="custName" required><br><br>

                Phone&nbsp&nbsp<input type="text" name="custPhone" maxlength="11" required><br><br>
                    
                Date&nbsp&nbsp<input type="date" name="bookingDate" required><br><br>

                    Room Reservation type&nbsp&nbsp
                    <select id="roomType" name="roomType" onchange="select_roomType()"
                            required>
                            <option value="">Select Room Type</option>
                            <option value="single">RM 100 : Single</option>
                            <option value="double">RM 150 : Double</option>
                            <option value="suite">RM 200 : Suite</option>
                        </select><br><br>
                    <div id="displayList">
                    </div>
                            <input type="submit" value="Submit"><br><br>
                <%--Display Error Message--%>
                <%if(errorMsgs != null){%>
                <div align="center">
                <div style="background-color: white; width: 50%;">
                <ul style="color: red">
                    <%
                    //String to print error
                    for(Object msg: errorMsgs){%>
                    <li><%= msg%></li>
                    <%}%>
                </ul></div></div>
                <%}%>
            </form>
        </div>
    </body>
</html>
