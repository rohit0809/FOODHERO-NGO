
<%-- 
    Document   : Request_Filtration
    Created on : 27 Apr, 2017, 4:37:13 AM
    Author     : Shri89:D
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
    .myclass {
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

        
        .container {
    padding: 16px;
}
         input[type=button]{
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

    input[type=button]:hover {
    opacity: 0.8;
}
    </style>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Volunteer Page</title>
    </head>
    <body>
        <div class="myclass">
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
             </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <table align="center" border="1">
                <thead><tr>
                <td>Address</td>
                <td>DOB</td>
                <td>E-mail</td>
                <td>Name</td>
                <td>Password</td>
                <td>Phone</td>
                    </tr>
            </thead>
            <tbody id="volunteer_table_body">
            
            </tbody>
                <!--<input type="checkbox" value="check" id="check" name="check"/>-->
        </table>
        </div>


<script src="https://www.gstatic.com/firebasejs/3.9.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyBHMSIBI0ak-mXLUyD_f2n-j6Nyo6YJyBA",
    authDomain: "foodhero-volunteer.firebaseapp.com",
    databaseURL: "https://foodhero-volunteer.firebaseio.com",
    projectId: "foodhero-volunteer",
    storageBucket: "foodhero-volunteer.appspot.com",
    messagingSenderId: "78886963576"
  };
  firebase.initializeApp(config);
</script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script>
    var rootRef=firebase.database().ref().child("Volunteer");
    rootRef.on("child_added",snap =>{
        var address=snap.child("Address").val();
        var dob=snap.child("DOB").val();
        var email=snap.child("Email").val();
        var name=snap.child("Name").val();
        var password=snap.child("Password").val();
        var phone=snap.child("Phone").val();
$("#volunteer_table_body").append("<tr><td>"+address+"</td><td>"+dob+"</td><td>"+email+"</td><td>"+name+"</td><td>"+password+"</td><td>"+phone+"</td></tr>");
});
</script>

    </body>
</html>
