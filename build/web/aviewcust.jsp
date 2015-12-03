<%-- 
    Document   : aviewcust
    Created on : May 7, 2014, 1:34:30 PM
    Author     : Brijesh Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Customers</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <style type="text/css">
            <!--
            .style1 {
                font-size: 16px;
                font-weight: bold;
            }
            .style5 {font-size: 12px}
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
                            <li><a href="SetProfileServlet">Profile</a></li>
                            <li class="active"><a href="avendor.jsp">User</a></li>

                            <li><a href="AInvoicesServlet">Invoice</a></li>
                            <li><a href="LogOutServlet">Log out</a></li>
                        </ul>
                        <div class="clr"></div>
                    </div>
                    <div class="hbg"><img src="images/header_images.jpg" width="923" height="291" alt="" style="border-radius: 13px;"/></div>
                </div>
                <div class="content" style="min-height: 500px">
                    <div class="content_bg">
                        <div class="mainbar">
                            <div class="article">
                                <h2 align="left">View Customer </h2>
                                <h3>  ${Status} </h3>
                                <c:remove scope="session" var="Status" />
                                <c:remove scope="session" var="Update" />

                                <div class="clr"></div>
                                <form action="ACustInfoServlet" method="post">
                               
                                    <c:if test="${empty VendorList}">
                                        <h3>No Customer Found.</h3>
                                    </c:if>

                                    <c:if test="${VendorList.size() > 0 }">
                                     

                                        <table width="100%" border="1" class="addtable">
                                            <tr>
                                                <th>Select</th>
                                                <th>Email</th>
                                                <th>Name</th>
                                                <th>Phone No</th>
                                            </tr>

                                               <c:forEach items="${VendorList}" var="vls" >
                                                <tr>
                                                    <td align="center"><input type="radio"  name="vid" value="${vls.email}" checked="checked"></td>
                                                    <td align="center">${vls.email}</td>
                                                    <td align="center">${vls.fname} ${vls.lname}</td>
                                                    <td align="center">${vls.phno}</td>
                                                </tr>
                                            </c:forEach>
                                     
                                        </table>
                                    </c:if>

                                    <p class="style1">
                                        <input type="submit" name="vbtn" value="Get Info" />
                                        <%-- <input type="submit" value="Remove" name="vbtn"/> --%>
                                    </p>
                                </form>
                            </div>

                            <div class="article">
                                <h2><span></span> </h2>

                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </div>
                        </div>
                        <div class="sidebar">
                            <div class="gadget">
                                <h2 class="star"><span>Menu</span></h2>
                                <div class="clr"></div>
                                <ul class="sb_menu">
                                    <li><a href="avendor.jsp">Add Vendor</a></li>
                                    <li><a href="AViewVendorServlet">View Vendor</a></li>
                                    <li class="active"><a href="ACustListServlet">View Customers</a></li>


                                </ul>
                            </div>
                            <div class="gadget">
                                <h2 class="star">&nbsp;</h2>
                                <h2 class="star"><span></span></h2>
                            </div>
                            <div class="gadget">
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

