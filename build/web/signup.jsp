<%-- 
    Document   : register
    Created on : Apr 7, 2014, 2:41:48 PM
    Author     : Brijesh Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title>Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript">
    
    function validate()
    {   document.getElementById("errorfname").innerHTML="";
        document.getElementById("errorlname").innerHTML="";
        document.getElementById("errorphno").innerHTML="";
        document.getElementById("erroremail").innerHTML="";
        
         var fname1=document.getElementById("fname").value;
         var lname1=document.getElementById("lname").value;
         var phno1=document.getElementById("phno").value;
         var email1=document.getElementById("email").value;
         
              //document.getElementById("fname").style.visibility = 'hidden';
              if(fname1==null || fname1=="")
                  {
                      alert("Please enter First name");
                      document.getElementById("errorfname").innerHTML="Please enter First name";
                      document.getElementById("errorfname").style.color="red";
                      return false;
                  }
              if(lname1==null || lname1=="")
                  {
                      alert("Please enter Last name");
                      document.getElementById("errorlname").innerHTML="Please enter Last name";
                      document.getElementById("errorlname").style.color="red";
                      return false;
                  }
                  
                var atpos=email1.indexOf("@");
                var dotpos=email1.lastIndexOf(".");
                if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email1.length || email1==null || email1=="")
                    {
                      alert("Please enter valid Email id");
                      document.getElementById("erroremail").innerHTML="Please enter valid Email ID";
                      document.getElementById("erroremail").style.color="red";
                      return false;
                     }  
              
                          
              if(phno1==null || phno1=="")
                  {
                      alert("Please enter Phone Number");
                      document.getElementById("errorphno").innerHTML="Please enter Phone No.";
                      document.getElementById("errorphno").style.color="red";
                      return false;
                  }
             
             return true;
        
    }
    
    
</script>
<style type="text/css">
<!--
.style1 {font-size: 16px}
.style2 {font-size: 12px}
-->
</style>
</head>
<body>         <div id="fb-root"></div>         <script>(function(d, s, id) {             var js, fjs = d.getElementsByTagName(s)[0];             if (d.getElementById(id)) return;             js = d.createElement(s); js.id = id;             js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";             fjs.parentNode.insertBefore(js, fjs);         }(document, 'script', 'facebook-jssdk'));</script>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="logo">
        <h1><a href="#"><span>Holiday</span>Planner<small>Customize Your Trip</small></a></h1>
      </div>
      <div class="search">
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.jsp">About Us</a></li>
		  <li><a href="plantrip.jsp">Plan Trip</a></li>
		  <li class="active"><a href="login.jsp">Log In</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
		          </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><img src="images/header_images.jpg" width="923" height="291" alt="" style="border-radius: 13px;"/></div>
    </div>
    <div class="content" style="min-height: 500px">
      <div class="content_bg">
        <div class="mainbar">
          <div class="article">
           
            <h2><span>Register</span> </h2>
            <h3>* indicates mandatory field</h3>
            <div class="style1" style="font-size: 12px; color: red">  ${Status}</div>
            <c:remove var="Status" />
            <div class="clr"></div>
            <form action="SignUpServlet" method="post" id="register">
              <ol>
                <li>
                  <label for="fname"><span class="style1">First Name*</span> </label>
                  <input id="fname" name="fname" class="text" /><div id="errorfname"></div>
                </li>
                 <li>
                  <label for="lname"><span class="style1">Last Name*</span> </label>
                  <input id="lname" name="lname" class="text" /><div id="errorlname"></div>
                </li>
                
                 <li>
                  <label for="gender"><span class="style1">Gender</span></label>
                  <input id="gender" name="gender" type="radio" value="male" width="200px" height="16px" checked="checked"/>Male
                  <input id="gender" name="gender" type="radio" value="female" width="200px" height="16px"/>Female<div id="errorgender"></div>
                </li>
                
                 <li>
                  <label for="email"><span class="style1">E-mail ID*</span> </label>
                  <input id="email" name="email" class="text" /><div id="erroremail"></div>
                </li>
                
                
                <li>
                  <label for="phno"><span class="style1">Phone No* </span></label>
                  <input id="phno" name="phno" class="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/><div id="errorphno"></div>
                </li>
		
               
                
                <li>
                <input type="Submit" name="register" id="submit" value="Register" class="send" onClick="return validate();" />
                <input type="reset" value="Reset"/>
                </li>
		
                <li>
                
                 <p></p>
                
                 <div class="clr"></div>
                </li>
              </ol>
            </form>
          </div>
        </div>
        <div class="clr"></div>
      </div>
    </div>
  </div>
  <div class="fbg">
   <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image Gallery</span></h2>
		<br>
        <a href="#"><img src="images/1.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/2.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/7.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/4.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/5.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="images/6.jpg" width="58" height="58" alt="" /></a> </div>
      <div class="col c2">
        <h2><span>About Us</span></h2>
        <p><br />
            Personalized Holiday Planner is a paperless online system through which you can plan your customized trip/holiday from anywhere in the world. It provides facility to any customers to plan their customized Trip/Holidays with various predefined options including travel and accommodation. They will get all quotation online and based on it; customer can confirm one of the quotations online.</p>
      </div>
    <div class="col c3">
<h2><span>Like us on Facebook</span></h2>                         <div class="fb-page" data-href="https://www.facebook.com/customizedholidayplanner" data-width="300" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/customizedholidayplanner"><a href="https://www.facebook.com/customizedholidayplanner">Holiday Planner</a></blockquote></div></div>
	
      </div>

      <div class="clr"></div>
    </div>
  </div>
</div>
<div class="footer">
  <div class="footer_resize">
    <p class="lf">&copy; Copyright Holiday Planner.</p>
    <p class="rf">Layout by Holiday Planner</p>
    <div class="clr"></div>
  </div>
</div>

</html>
