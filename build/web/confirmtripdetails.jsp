<%-- 
    Document   : confirmtripdetails
    Created on : Apr 9, 2014, 10:46:50 PM
    Author     : Brijesh Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Confirm Trip Details</title>
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
                                <h2>Trip Details </h2>
                                <div class="clr"></div>
                                <p><div align="center"><h2>Trip Name: ${tripInfo.tripname}</h2></div></p>
                                <form action="SaveNewTripServlet" method="post" name="tripinfo">

                                    <table width="100%" border="0" >
                                        <tr>
                                            <th width="25%" scope="row"><div align="left">From</div></th>
                                        <td width="25%"><label>${tripInfo.from}</label></td>
                                        <td width="25%"></td><td width="25%"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">To</div></th>
                                        <td><label>${tripInfo.to}</label></td>
                                        <td></td><td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">Start Date </div></th>
                                        <td><label>${tripInfo.tsdate}</label></td>
                                        <td></td><td></td>
                                        </tr>

                                        <tr> <th height="29" scope="row"><div align="left">End Date </div></th>
                                        <td><label>${tripInfo.tedate}</label></td>
                                        <td></td><td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">No. of Adults</div></th>
                                        <td><label>${tripInfo.noAdult}</label></td>
                                        <td></td><td></td>
                                        </tr>
                                        <tr>
                                        <th scope="row"><div align="left">No. of Children </div></th>
                                        <td><label>${tripInfo.noChild}</label></td>
                                        <td></td><td></td>
                                        </tr>
                                        <tr></tr>
                                        <tr><th colspan="4" align="center"><h3><label>Area Details</label></h3></th></tr>
                                    </table>
                                        <table width="586" border="1" class="addtable">
                                        <tr><th width="154">Area</th>
                                        <th width="145">Hotel Type</th>
                                        <th width="129">Start Date</th>
                                        <th width="130">End Date</th>
                                        </tr>
                                          <c:forEach items="${tripdetail}" var="t">
                                            <tr>
                                                <td align="center">${t.area}</td>
                                                <td align="center">${t.htype}</td>
                                                <td align="center">${t.asdate}</td>
                                                <td align="center">${t.aedate}</td>
                                            </tr>
                                        </c:forEach>   
                                     
                                  </table>
                                        <p></p>
                                        <input type="submit" value="Submit" />
                                        <a href="DiscardServlet"><input type="button" value="Discard" /></a>
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
                                    <li class="active"><a href="SubmittedTripServlet">Submitted Trip </a></li>
                                    <li><a href="ApprovedTripServlet">Approved Trip </a></li>
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
