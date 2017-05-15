<%-- 
    Document   : Allotment
    Created on : 27 Apr, 2017, 4:59:43 AM
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
        
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Allotment Page</title>
    </head>
    <body>
        <form action="Controller.Allotment_Servlet" method="post" align="center">  
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
             </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <table align="center" border="1" id="table_body">
                <td>Request_id</td>
                <td>Donor_id</td>
                <td>Volunteer_id</td>
                <td>Track</td>
                <!--<input type="checkbox" value="check" id="check" name="check"/>-->
            </table>
            </br></br>
            </form>
        <script src="https://www.gstatic.com/firebasejs/3.9.0/firebase.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script>
          var config = {
              apiKey: "AIzaSyBHMSIBI0ak-mXLUyD_f2n-j6Nyo6YJyBA",
    authDomain: "foodhero-volunteer.firebaseapp.com",
    databaseURL: "https://foodhero-volunteer.firebaseio.com",
    projectId: "foodhero-volunteer",
    storageBucket: "foodhero-volunteer.appspot.com",
    messagingSenderId: "78886963576"
  };
  firebase.initializeApp(config);
             $(document).ready(function(){
                 var c=0;
            var rootRef=firebase.database().ref().child("Request_Database");
    rootRef.on("child_added",snap =>{
        var rid=c;
            var did=snap.child("donorid").val();
       //var did="singhsourav206@gmail.com";
        var volunid=snap.child("volid").val();
       c++; 
$("#table_body").append("<tr><td>"+rid+"</td><td>"+did+"</td><td>"+volunid+"</td></tr>");

})
 })
 
        </script>
    </body>
</html>
