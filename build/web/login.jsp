<%-- 
    Document   : login
    Created on : Mar 4, 2014, 5:21:16 PM
    Author     : Brijesh Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title>Log In</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript">
    
    function validate()
    {   document.getElementById("errorpwd").innerHTML="";
        document.getElementById("erroruname").innerHTML="";
         var username=document.getElementById("uname").value;
         var password=document.getElementById("pwd").value;
              //document.getElementById("fname").style.visibility = 'hidden';
              if(username==null || username=="")
                  {
                      alert("Please enter Username");
                      document.getElementById("erroruname").innerHTML="Please enter Username";
                      document.getElementById("erroruname").style.color="red";
                      return false;
                  }
              if(password==null || password=="")
                  {
                      alert("Please enter Password");
                      document.getElementById("errorpwd").innerHTML="Please enter Password";
                      document.getElementById("errorpwd").style.color="red";
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
           
            <h2><span>Log In</span> </h2>
            <div class="style1" style="font-size: 12; color: red">  ${Status}${Update}</div>
            <div class="clr"></div>
            <c:remove var="Status" />
            <c:remove var="Update" />
            <form action="LoginServlet" method="post" id="login">
              <ol>
                <li>
                  <label for="username"><span class="style1">Username*</span> </label>
                  <input id="uname" name="uname" class="text" autofocus="autofocus" /><div id="erroruname"></div>
                </li>
                <li>
                  <label for="email"><span class="style1">Password* </span></label>
                  <input id="pwd" name="pwd" type="password" class="text" /><div id="errorpwd"></div>
                </li>
			    <li>
                                <input type="Submit" name="submit" id="submit" value="Log in" class="send" onClick="return validate();" />
			    </li>
				<li></li>
                <li><a href="forgotpwd.jsp">Forgot Password</a>
                  <p></p>
                  <div class="clr"></div>
                </li>
              </ol>
            </form>
            <label> Don't have an account? You can Sign Up here. It's free.</label>
            <br></br>
            <input type="Submit" name="submit2" id="submit2" value="Sign Up" class="send" onClick="document.location.href = 'register.jsp'" />

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
<h2><span>Like us on Facebook</span></h2>                         
<div class="fb-page" data-href="https://www.facebook.com/customizedholidayplanner" data-width="300" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/customizedholidayplanner"><a href="https://www.facebook.com/customizedholidayplanner">Holiday Planner</a></blockquote></div></div>
	
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
