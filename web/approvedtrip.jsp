<%-- 
    Document   : approvedtrip
    Created on : Apr 9, 2014, 9:33:38 PM
    Author     : Brijesh Admin
--%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Approved Trip</title>
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
                        <h1><a href="#"><span>Holiday</span>Planner<small>Customize Your Trip</small></a></h1>
                    </div>
                    <div class="search">
                        <div class="clr"></div>
                    </div>
                    <div class="clr"></div>
                    <div class="menu_nav">
                        <ul>
                            <li><a href="SetProfileServlet">Profile</a></li>
                            <li class="active"><a href="trip.jsp">Trip</a></li>
                            <li><a href="AllInvoiceServlet">Invoice</a></li>
                            <li><a href="LogOutServlet">Log Out</a></li>
                        </ul>
                        <div class="clr"></div>
                    </div>
                    <div class="hbg"><img src="images/header_images.jpg" width="923" height="291" alt="" style="border-radius: 13px;"/></div>
                </div>
                <div class="content" style="min-height: 500px">
                    <div class="content_bg">
                        <div class="mainbar">
                            <div class="article">
                                <h2>Enter Details about trip </h2>
                                <div class="clr"></div>
                                <p> <p>
                                <form action="GetServlet" method="post" name="submiittedtrip">
                                    
                                     <c:if test="${empty Apptrip}">
                                        <h3>No Approved Trips Found.</h3>
                                    </c:if>

                                            <c:if test="${Apptrip.size() > 0}">
                                    <table border-style="solid" border="1" class="addtable" width="100%">
                                        
                                        <thead>
                                            <tr>
                                                <th>Select</th>
                                                <th>Name</th>
                                                <th>From</th>
                                                <th>To</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${Apptrip}" var="at">
                                                <tr>

                                                    <td align="center"><input type="radio" name="tripid" value="${at.tripId}" checked="checked" /></td>
                                                    <td align="center">${at.tripname}</td>
                                                    <td align="center">${at.from}</td>
                                                    <td align="center">${at.to}</td>
                                                    <td align="center">${at.status}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <p> <input type="submit" value="Get Info" name="st"/>
                                        <input type="submit" value="Get Invoice" name="st"/>
                                    </p>
                                            </c:if>
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
                                <h2 class="star"><span>Menu</span></h2>
                                <div class="clr"></div>
                                <ul class="sb_menu">
                                    <li><a href="trip.jsp">Plan New Trip </a></li>
                                    <li><a href="SubmittedTripServlet">Submitted Trip </a></li>
                                    <li class="active"><a href="ApprovedTripServlet">Approved Trip </a></li>
                                    <li><a href="BookedTripServlet">Booked Trip </a></li>

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
