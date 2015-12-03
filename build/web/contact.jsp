<%-- 
    Document   : contact
    Created on : Mar 4, 2014, 5:24:07 PM
    Author     : Brijesh Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
<title>Contact Us</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
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
		  <li><a href="login.jsp">Log In</a></li>
          <li class="active"><a href="contact.jsp">Contact Us</a></li>        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><img src="images/header_images.jpg" width="923" height="291" alt="" style="border-radius: 13px;"/></div>
    </div>
    <div class="content" style="min-height: 500px">
      <div class="content_bg">
        <div class="mainbar">
          <div class="article">
            <h2><span>Contact through Email</span></h2>
            <div class="clr"></div>
            <p>You should fill up the below form and submit the details. Our representative will contact you shortly on given E-mail address.</p>
          </div>
          <div class="article">
            <h2><span>Send us</span> mail</h2>
            <div class="clr"></div>
            <form action="ContactMailServlet" method="post" id="sendemail">
              
                <h3>${Status}</h3>
                    
                <ol>
                <li>
                  <label for="name">Name (required)</label>
                  <input id="name" name="name" class="text" />
                </li>
                <li>
                  <label for="email">Email Address (required)</label>
                  <input id="email" name="email" class="text" />
                </li>
                <li>
                  <label for="subject">Subject</label>
                  <input id="subject" name="subject" class="text" />
                </li>
                <li>
                  <label for="message">Your Message</label>
                  <textarea id="message" name="message" rows="8" cols="50"></textarea>
                </li>
                <li>
                    <input type="submit" value="Submit" />
                  <p></p>
                  <div class="clr"></div>
                </li>
              </ol>
            </form>
          </div>
        </div>
        <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Menu</span></h2>
            <div class="clr"></div>
            <ul class="sb_menu">
                <li class="active"><a href="contact.jsp">Email Us</a></li>
              
            </ul>
          </div>
          <div class="gadget">
           
          </div>
          <div class="gadget">
            <h2 class="star"><span></span></h2>
            <div class="clr"></div>
            <div class="testi">
            </div>
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
