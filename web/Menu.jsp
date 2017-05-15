<%-- 
    Document   : Menu
    Created on : 27 Apr, 2017, 1:36:30 AM
    Author     : Shri89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
     .imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.foodhero {
    width: 40%;
    height: 40%;
    border-radius: 50%;
}
        .tabs {
    border: 3px solid #f1f1f1;
    width:50%;
    height:100vh;
    margin-left: 25%;
}
        input[type=button], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 15px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    background-color: #4CAF50;
    color: white;
}
        input[type=button]:hover {
    opacity: 0.8;
}
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
    </head>
    <body>
       <%  
           
String login_msg=(String)request.getAttribute("login_msg");  
if(login_msg!=null){  
out.print(login_msg);  
}  
 %>  
         <div class="tabs">
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
             </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <table align="center">
                <tr><td><input type="button" value="VOLUNTEERS" name="volunteer" id="volunteer" onClick="window.location.href='Volunteer.jsp'"/></td>
                    <td><input type="button" value="HISTORY" id="history" name="history" onClick="window.location.href='History.jsp'"/></td> 
                    <td><input type="button" value="REQUESTS" id="request" name="request" onClick="window.location.href='Configuration.jsp'"/></td></tr>
            </table>
        </div>
    </body>
</html>
