<%-- 
    Document   : Configuration
    Created on : 27 Apr, 2017, 4:24:52 AM
    Author     : Shri89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <style>
        form {
    border: 3px solid #f1f1f1;
    width:50%;
    height:100vh;
    margin-left: 25%;
}
        
        .imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.foodhero {
    width: 40%;
    height: 40%;
    border-radius: 50%;
}

         input[type=text] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    
}
        
       .container {
    padding: 16px;
}
        input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}
         
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuration Page</title>
    </head>
    <body>
        
        <form action="Controller.Configuration_Servlet" method="post" align="center">  
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
            </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <div class="container">
            <label style="float:left;"><b>Minimum Quantity</b></label>
            <input type="text" placeholder="Enter min quantity" name="min" required id="min" >
                
            <label style="float:left"><b>Maximum quantity</b></label>
            <input type="text" placeholder="Enter max quantity" name="max" required id="max">
                
            <label style="float:left;"><b>Shelf Life</b></label>
            <input type="text" placeholder="Enter shelf life" name="shlife" required id="shlife" >    
                
            <input type="submit" value="Configure" id="submit" name="submit"/>
            </div>
           <!-- <table align="center">
                <tr><td>
                        Minimum Quantity:</td><td><input type="text" name="min" id="min"/></td></tr><tr>
                    <td>Maximum Quantity</td><td><input type="text" name="max" id="max"/></td></tr> 
                <tr><td>
                        Shelf Life:</td><td><input type="text" name="shlife" id="shlife"/></td></tr>
                    
            </table>
            </br></br>
            <input type="submit" value="Configure" id="submit" name="submit"/>-->
        </form>
    </body>
</html>
