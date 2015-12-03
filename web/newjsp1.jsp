<%-- 
    Document   : newjsp1
    Created on : Apr 11, 2014, 1:47:40 AM
    Author     : Brijesh Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
<title>SocialNet | Support</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" media="screen, print, handheld" type="text/css" href="calendar.css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="calendar.js"> </script>

   </head>
<body>         <div id="fb-root"></div>         <script>(function(d, s, id) {             var js, fjs = d.getElementsByTagName(s)[0];             if (d.getElementById(id)) return;             js = d.createElement(s); js.id = id;             js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";             fjs.parentNode.insertBefore(js, fjs);         }(document, 'script', 'facebook-jssdk'));</script>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="logo">
        <h1><a href="#"><span>Social</span>Net<small>Simple web template</small></a></h1>
      </div>
      <div class="search">
        <form method="post" id="search" action="#">
          <span>
          <input type="text" value="Search..." name="s" id="s" />
          <input name="searchsubmit" type="image" src="images/search.gif" value="Go" id="searchsubmit" class="btn"  />
          </span>
        </form>
        <!--/searchform -->
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="cprofile.jsp">Profile</a></li>
		  <li class="active"><a href="trip.jsp">Trip</a></li>
		  <li><a href="AllInvoiceServlet">Invoice</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
        <div class="clr"></div>
      </div>
     <iframe width="100%" height="430" src="http://www.cincopa.com/media-platform/iframe.aspx?fid=AkMA9kr271A6" frameborder="0" allowfullscreen scrolling="no"></iframe>
      <div class="hbg"></div>
    </div>
    <div class="content" style="min-height: 500px">
      <div class="content_bg">
        <div class="mainbar">
          <div class="article">
            <h2>Enter Details about trip </h2>
            <div class="clr"></div>
            <p> <p>
            <form action="" method="get" name="plantrip">
<table width="100%" border="0">
    <tr>
    <th width="22%" scope="row"><div align="left">From</div></th>
    <td width="77%"><input type="text" name="from" id="from"></td>
    </tr>
  <tr>
    <th scope="row"><div align="left">To</div></th>
    <td><select name="to" id="to">
	<option value=""> Select State </option>
    </select>    </td>
    </tr>
  <tr>
    <th scope="row"><div align="left">Start Date </div></th>
    <td><input type="date" name="tsdate" id="tsdate"></td>
    </tr>
	
	<tr> <th height="29" scope="row"><div align="left">End Date </div></th>
    <td><input type="date" name="tedate" id="tedate"></td>
	</tr>
	 <tr>
    <th scope="row"><div align="left">No. of Adults</div></th>
    <td><input type="text" name="nadult" id="nadult"></td>
    </tr>
	<tr>
    <th scope="row"><div align="left">No. of Children </div></th>
    <td><input type="text" name="nchild" id="nchild"></td>
    </tr>
	<tr>
	<td height="121" width="22%"><em>Enter Area names one by one, then click Add. </em></td>
	<td><table width="79%">
      <tr>
        <th width="32%" scope="row"><div align="left">Enter Area </div></th>
        <td width="68%"><input type="text" name="area" id="area"></td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Hotel Type </div></th>
        <td><select name="select">
		<option value=""> Select type</option>
		<option value="1"> 1 Star </option>
		<option value="2"> 2 Star </option>
		<option value="3"> 3 Star </option>
		<option value="4"> 4 Star </option>
		<option value="5"> 5 Star </option>
		<option value="7"> 7 Star </option>
        </select>
        </td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Start Date </div></th>
        <td><input type="date" name="asdate" id="asdate">	</td>
      </tr>
      <tr>
        <th scope="row"><div align="left">End Date </div></th>
        <td><input type="date" name="aedate" id="aedate"></td>
      </tr>
	  <tr><td><div align="center">
	    <input type="submit" name="add" value="Add">
	    <input type="reset" name="reset" value="Reset">
	  </div></td>
	  </tr>
    </table></td>
	</tr>
	<tr>
<tr><th> </th><td>
  <div align="center">
    <input type="submit" name="Submit"/>
    <input type="reset" name="Reset" value="Reset" >
  </div></td><td width="1%"></td>
</tr>
</table>
			</form>
            </p>
            <ul class="sb_menu">
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
            </ul>
          </div>
        </div>

          <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Sub</span> Menu</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="#">Plan New Trip </a></li>
              <li><a href="#">Submitted Trip </a></li>
              <li><a href="#">Booked Trip </a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="#">Archives</a></li>
            </ul>
          </div>
          <div class="gadget"></div>
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

