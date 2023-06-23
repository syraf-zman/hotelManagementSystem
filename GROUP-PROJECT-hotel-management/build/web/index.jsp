<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- index.jsp: Author: Asyraf
                Editor 1: Amir--%>
<html>
    <head>
        <title>Hotel Management System</title>
        <style>
            
        div 
        {
            background-image: url('darker.png');
            width: 1000px;
            padding-left: 100px;
            padding-right: 100px;
            padding-bottom: 100px;
            border: 0px;
            border:0px solid green;
            margin: auto;
        }
        
        body
        {
            font-size: 120%;
            color: white;
            font-family: verdana;
            background-image: url('bgimage.jpg');
            background-repeat:no-repeat;
            background-attachment: fixed;
            background-size: cover;
	}
        
        input[type=text],[type=password]
        {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px;
            border-radius: 10px;
        }
        input[type=submit]
        {   
            padding: 15px 32px;
            position:relative;
            left:45%;
        }
        
	</style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>
        <h1 style="font-size:300%;" >Hotel Management System</h1>
        <form action="login.do" method="POST">
            
            <b>Username  <br><br><input type="text" name="username"><br><br><br>
                Password <br><br><input type="password" name="password"><br><br><br>
<%-- Editor 1:  {--%>
    <br><span style="color:red;">
    <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
    </span><br>
<%-- } --%>
            <input type="submit" value="Login">
        </form>
        </div>
    </body>
</html>
