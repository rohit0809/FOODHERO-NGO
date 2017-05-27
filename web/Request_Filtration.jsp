<%-- 
    Document   : Request_Filtration
    Created on : 27 Apr, 2017, 4:37:13 AM
    Author     : Shri89
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Configuration_Bean"%>
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
<% Configuration_Bean obj = (Configuration_Bean)request.getAttribute("configdata");
String maxvalue=obj.getMax();
String minvalue=obj.getMin();
String shlife=obj.getShlife();
//out.print(maxvalue);
%>
    </style>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request_Filtration Page</title>
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
  var primary = firebase.initializeApp(config, "primary");
  var primaryDatabase = primary.database();
  
   var secondaryAppConfig = {
   apiKey: "AIzaSyBHMSIBI0ak-mXLUyD_f2n-j6Nyo6YJyBA",
    authDomain: "foodhero-volunteer.firebaseapp.com",
    databaseURL: "https://foodhero-volunteer.firebaseio.com",
    projectId: "foodhero-volunteer",
    storageBucket: "foodhero-volunteer.appspot.com",
    messagingSenderId: "78886963576"
};
var secondary = firebase.initializeApp(secondaryAppConfig, "secondary");
var secondaryDatabase = secondary.database();
</script>
        <div class="myclass">
            <div class="imgcontainer">
            <img src="./images/images.jpg" alt="foodhero" class="foodhero">
             </div>
            <h1 align="center" style="font-family: Arial, Helvetica, sans-serif;font-size:3em;margin-bottom:5px;">Food Hero</h1>
            <table align="center" border="1" id="table_body">
                <th>Donor_id</th>
                <th>Place</th>
                <th>Landmark</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Request_id</th>
                <th>Shelflife</th>
                <!--<input type="checkbox" value="check" id="check" name="check"/>-->
        </table>
                        <input type="button" value="Send Notification to the checked requests" id="notify" name="notify" onClick="notify()"/>
                        <input type="button" value="Check Status" id="check" name="check" onClick="window.location.href='Allotment.jsp'"/>
        </div>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script>
            $(document).ready(function(){
                
             var maxval=<%=maxvalue%>;
             var minval=<%=minvalue%>;
             var shflife=<%=shlife%>;
            var rootRef1=primaryDatabase.ref().child("Food_Items");
    rootRef1.on("child_added",snap =>{
       var did=snap.child("donorid").val();
       //var did="singhsourav206@gmail.com";
        var landmark=snap.child("landmark").val();
        var place=snap.child("location").val();
        var name=snap.child("name").val();
        var quantity=snap.child("quantity").val();
        var rid=snap.child("requestid").val();
        var shlife=snap.child("shelflife").val();
         
  if(quantity>=minval && quantity<=maxval && shlife>=shflife)
$("#table_body").append("<tr><td>"+did+"</td><td>"+place+"</td><td>"+landmark+"</td><td>"+name+"</td><td>"+quantity+"</td><td>"+rid+"</td><td>"+shlife+"</td><td><button id=\""+rid+"\" onClick=\"remove(this.id)\">Click to Remove</button></td></tr>");
else
{
    var Ref=primaryDatabase.ref().child("Food_Items").child(rid);
    Ref.remove();
}
})
 })
 
 function remove(id1){
               var Ref=primaryDatabase.ref().child("Food_Items").child(id1);
               //alert(document.getElementById(id1).innerHTML);
               document.getElementById(id1).innerHTML="Removed";
        Ref.remove();
            }
        /* $(document).ready(function(){
                var rootref1=primaryDatabase.ref().child('Food_Items');
                //alert("hi");
        rootref1.on("child_added",snap=>{
        var rid=snap.child("requestid") .val();
        //alert(rid);
        //var did=snap.child("donorid") .val();
        var did="singhsourav206@gmail.com";
        var place=snap.child("location") .val();
        var landmark=snap.child("landmark") .val();
        var quantity=snap.child("quantity") .val();
        var name=snap.child("name") .val();
        var shlife=snap.child("shelflife") .val();
        $("#table").append("<tr><td>"+did+"</td><td>"+place+"</td><td>"+landmark+"</td><td>"+name+"</td><td>"+quantity+"</td><td>"+shlife+"</td></tr>");//"</td><td><input type='checkbox' name='Check' value="+rid+"></input></td></tr>"
    })
            })*/
            function notify()
            {
                var lst=[];
                var table=document.getElementById('table_body');
                var flag=[];
var syn1=0;
var rootref2=secondaryDatabase.ref().child('Volunteer');
//alert(table.rows.length);
   var address,email,volume,phone,did,place,landmark,name,quantity,shlife,status,reqid;
 for(var i=1; i<table.rows.length;i++)
     flag[i]=0;
        rootref2.on("child_added",snap=>{
        address=snap.child("Address") .val();
        email=snap.child("Email") .val();
        volname=snap.child("Name") .val();
        phone=snap.child("Phone") .val();
        status=snap.child("Status") .val();
       // alert(landmark+" "+address+" "+name);
        for(var i=1; i<table.rows.length;i++){

        did=(table.rows[i].cells[0].innerHTML);
        place=(table.rows[i].cells[1].innerHTML);
        landmark=(table.rows[i].cells[2].innerHTML);
        name=(table.rows[i].cells[3].innerHTML);
        quantity=(table.rows[i].cells[4].innerHTML);
        reqid=(table.rows[i].cells[5].innerHTML);
        shlife=(table.rows[i].cells[6].innerHTML);
      // alert(landmark);
         
 if((flag[i])||(status=="1"))
     continue;
            if((landmark==address)&&(flag[i]==0))
            {
                lst.push(snap.key);
                //var ref = rootref2.child(snap.key);
                //alert(ref);
              //ref.update({Status:"1"});
                alert(name);
                var delayMillis = 5000; //1 second

setTimeout(function() {
  //your code to be executed after 1 second
  var c;
  c++;
}, delayMillis);
               flag[i]=1;
    var postData = {
    add: landmark,
   dadd: place,
    itemname: name,
    volph: phone,
    volunteername: volname,
    volid: email,
    donorid: did,
    quant: quantity,
    requestid: reqid,
    shelflife: shlife, 
    flag:"0",
    exp_time:"0"
    };
    
    var newPostKey = secondaryDatabase.ref().child('Request_Database').push().key;
    //var newPostKey2 = secondaryDatabase.ref().child('History').push().key;
    // Write the new post's data simultaneously in the posts list and the user's post list.
    //alert(newPostKey+" "+i);
    //alert(firebase.database().ref().child('NGO admin')+'/'+ newPostKey);
    secondaryDatabase.ref().child('Request_Database').child(newPostKey).set(postData);
    //secondaryDatabase.ref().child('History').child(newPostKey2).set(postData);
            }
           
        }
        })
        //}, delayMillis);
        
         var delayMillis = 5000; //1 second

setTimeout(function() {
  //your code to be executed after 1 second

           for(i=0;i<lst.length;i++)
           {
               rootref2.child(lst[i]).update({Status:"1"});
           }
          }, delayMillis);
            }
        
        </script>
       
    </body>
</html>
