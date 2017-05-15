<%-- 
    Document   : Login
    Created on : 27 Apr, 2017, 12:28:46 AM
    Author     : Shri89
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Login_Servlet"%>  
<jsp:useBean id="obj" class="Bean.Login_Bean"/>  
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

        input[type=text], input[type=password] {
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
        button {
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
        <title>Login Page</title>
    </head>
    <body>
        <script src="https://www.gstatic.com/firebasejs/3.9.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyA_hydomDobVRRVuwofNJvRbBOgVoDIi9U",
    authDomain: "foodhero-master-9ffd7.firebaseapp.com",
    databaseURL: "https://foodhero-master-9ffd7.firebaseio.com",
    projectId: "foodhero-master-9ffd7",
    storageBucket: "foodhero-master-9ffd7.appspot.com",
    messagingSenderId: "720826695419"
  };
  firebase.initializeApp(config);
</script>
       <%  
           
String login_msg=(String)request.getAttribute("login_msg");  
if(login_msg!=null){  
out.print(login_msg);  
}  
 %>  

        <form id="login" action="Controller.Login_Servlet" method="post" align="center">  
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
             </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <div class="container">
    <label style="float:left;"><b>Username</b></label>
    <input type="text" placeholder="Enter email" name="email" required id="email" >

    <label style="float:left"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required id="password">
            <button type="button" id="btsubmit" name="btsubmit" onClick="check()"/>Submit</button>
            <input type="button" value="Add Admin" id="add" name="add" onClick="window.location.href='Add_Admin.jsp'"/>
            </div>
            <!--
            </br></br>
            <input type="submit" value="Login" id="submit" name="submit"/>
            <input type="button" value="Add Admin" id="add" name="add" onClick="window.location.href='Add_Admin.jsp'"/>-->
        </form>
 <script>
            function check()
            {
                var flag=0;
                var email=document.getElementById("email").value;
                var password=document.getElementById("password").value;
               /* var rootref=firebase.database().ref().child('NGO admin');
        rootref.on("child_added",snap=>{
        var eid=snap.child("email") .val();
        var pass=snap.child("password") .val();
        var phone=snap.child("phone") .val();
        //alert(eid+" "+pass+" "+phone);
        if(((id==eid)||(id==phone))&&(pass==password))
        {
            flag=1;
        }
        }) 
      alert(password+" u "+flag);
if(!flag)
{
    alert("Invalid login credentials!"+" "+password);
    return false;
   }
   else
   return true;*/
        firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
  // Handle Errors here.
  flag=1;
  alert(error.message);
  // ...
});
var delayMillis=3000;
    setTimeout(function() {
  //your code to be executed after 3 second
  if(!flag)
  document.getElementById("login").submit();
  
}, delayMillis);
    }
            </script>
    </body>
</html>
