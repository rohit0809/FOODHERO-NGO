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
        <script src="https://www.gstatic.com/firebasejs/3.9.0/firebase.js"></script>
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
  </script>
        <form action="Controller.Allotment_Servlet" method="post" align="center">  
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
             </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <table align="center" border="1" id="table_body">
                <td>Donor_Address</td>
                <td>Request_id</td>
                <td>Donor_id</td>
                <td>Volunteer_id</td>
                <td>Track</td>
                <!--<input type="checkbox" value="check" id="check" name="check"/>-->
            </table>
            </br></br>
            </form>
        
        
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script>
            $(document).ready(function(){
                var c=0;
            var rootRef=firebase.database().ref().child("Record_Database");
    rootRef.on("child_added",snap =>{
       var did=snap.child("donorid").val();
       
        var reqid=snap.child("requestid").val();
         var volunid=snap.child("volid").val();
        var vadd=snap.child("add").val();
        var dadd=snap.child("d_add").val();
         c++;
        var rid=c;
  
$("#table_body").append("<tr><td>"+dadd+"</td><td>"+reqid+"</td><td>"+did+"</td><td>"+volunid+"</td><td><button id=\""+rid+"\" type=\"button\" onClick=\"track(this.id);\">Track</button></td><td><button id=\""+volunid+"\" type=\"button\" onClick=\"cnfm(this.id);\">Confirm</button></td></tr>");

})
 })
 function cnfm(volid)
 {
     //alert("hi");
     var flag=0;
     var rootref1 = firebase.database().ref().child('Record_Database');
     var rootref2 = firebase.database().ref().child('History');
     var rootref3 = firebase.database().ref().child('Volunteer');
     var vid,status;
     
     rootref1.on("child_added",snap=>{
        
        vid=snap.child("volid") .val();
        if((vid==volid)&&(!flag))
        {
            rootref2.push().set(snap.val());
            flag=1;
        }
        
    })
    
    rootref3.on("child_added",snap=>{
        vid=snap.child("Email").val();
        status=snap.child("Status") .val();
        if(vid==volid)
        {
            var ref = rootref3.child(snap.key);
                //alert(ref);
                ref.update({Status:"0"});
        }
        
    })


 }
 function track(i)
 {
     //alert("hi");
     var table=document.getElementById('table_body');
     var d_add=table.rows[i].cells[0].innerHTML;
     alert(d_add);
 }
 
 
        </script>
    </body>
</html>
