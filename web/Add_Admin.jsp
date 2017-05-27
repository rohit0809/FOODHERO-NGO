<%-- 
    Document   : Add_Admin
    Created on : 27 Apr, 2017, 4:04:04 AM
    Author     : Shri89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        form {
    border: 3px solid #f1f1f1;
    width:50%;
    height:100%;
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

        input[type=text], input[type=password]{
    width: 100%;
    padding: 12px 20px;
    margin: 0px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
        
        .container {
    padding: 16px;
}
        input[type=submit]  {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

input[type=submit] :hover {
    opacity: 0.8;
}
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add_Admin Page</title>
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
        <form id="admin" action="Controller.Add_Admin_Servlet" method="post" align="center">  
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
             </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <table align="center">
                <tr><td>
                        Name:</td><td><input type="text" name="name" id="name"/></td></tr>
                <tr><td>
                        Email:</td><td><input type="text" name="email" id="email"/></td></tr>
                <tr><td>
                        Phone:</td><td><input type="text" name="phone" id="phone"/></td></tr>
                <tr><td>
                        Designation:</td><td><input type="text" name="desig" id="desig"/></td></tr>
                <tr><td>
                        Password:</td><td><input type="password" name="password" id="password"/></td></tr>
                    
            </table>
            </br></br>
            <input type="button" value="Add" id="add" name="add" onClick="check(this.form)"/>
        </form>
<script>
    
    function check(frm)
    {
      
        var email=document.getElementById("email").value;
        var password=document.getElementById("password").value;
        var flag=0;
        /*var new_email=document.getElementById("email").value;
        var rootref=firebase.database().ref().child('NGO admin');
        rootref.on("child_added",snap=>{
        var email=snap.child("email") .val();
        if(new_email==email)
            flag=1;
        })
        alert(flag);
        if(flag)
        {
            alert("There already exists an account under the same id");
            return false;
        }
        else
            submitClick();
        return true;*/
        firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {
  // Handle Errors here.
  flag=1;
  alert(error.message);
  // ...
});

var delayMillis=2000;
    setTimeout(function() {
  //your code to be executed after 5 second
   if(!flag)
{  submitClick(frm);
}
}, delayMillis);
    }
    function submitClick(frm)
    {
     
   //var s=document.getElementById("name").value.toString();
  //alert("yes");
    var postData = {
    name: document.getElementById("name").value,
    email: document.getElementById("email").value,
    phone: document.getElementById("phone").value,
    desig: document.getElementById("desig").value,
    password: document.getElementById("password").value
  };
    var newPostKey = firebase.database().ref().child('NGO admin').push().key;
//I have added yayyyy
  // Write the new post's data simultaneously in the posts list and the user's post list.
  alert(newPostKey);
  //alert(firebase.database().ref().child('NGO admin')+'/'+ newPostKey);
  firebase.database().ref().child('NGO admin').child(newPostKey).set(postData);
  var delayMillis=6000;
    setTimeout(function() {
  //your code to be executed after 6 second
   frm.submit();
}, delayMillis);
 /* updates['/user-pos/'+ newPostKey] = postData;
  return firebase.database().ref().update(updates);*/
     
    }
</script>

    </body>
</html>
