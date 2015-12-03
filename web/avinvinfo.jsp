<%-- 
    Document   : avinvinfo
    Created on : Apr 23, 2014, 3:56:27 PM
    Author     : Brijesh Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Invoice</title>
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
                            <li><a href="avendor.jsp">Vendor</a></li>

                            <li class="active"><a href="AInvoicesServlet">Invoice</a></li>
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
                                <h2 align="left">Invoice Information.</h2>
                                <h3>&nbsp;</h3>
                                <c:remove scope="session" var="Status" />
                                <c:remove scope="session" var="Update" />

                                <div class="clr"></div>
                                <form action="AVInvInfoServlet" method="post">
                                    <h3 align="left"><b>Invoice ID: ${Info.invid}</b></h3>

                                    <table width="100%" class="style5">
                                        <tr>
                                            <th align="left" width="33%" scope="row">Invoice Date</th>
                                            <td width="67%">${Info.datetime}</td>
                                        </tr><tr>
                                            
                                            <th align="left" width="33%" scope="row">Status</th>
                                            <td width="67%">${Info.sts}</td>
                                        </tr>
                                    </table>
                                        <br>
                                    <table width="100%" class="style5">
                                        <tr>
                                            <th width="33%" align="left" scope="row">vendor Name</th>
                                            <td width="67%">${Info.vname}</td>
                                        </tr>
                                        <tr>
                                            <th align="left">Vendor Email</th>
                                            <td>${Info.vid}</td>
                                        </tr>
                                    </table>
                                        <br>
                                        <table width="100%" class="style5">

                                        <tr>
                                            <th align="left">Total no. of Inquiry</th>
                                            <td>${Info.total_inq}</td>
                                        </tr>
                                        <tr>
                                            <th width="33%" align="left">Charge per Inquiry</th>
                                            <td width="67%">${Info.cp_inq}</td>
                                        </tr>
                                        <tr>
                                            <th align="left">Subtotal 1 </th>
                                            <td>${t1}</td>
                                        </tr>
                                        </table>
                                        <br>
                                        <table class="style5" width="100%" >
                                        <tr>
                                            <th width="33%" align="left">Total booked Amount</th>
                                            <td width="67%">${Info.total_bkamt}</td>
                                        </tr>
                                        <tr>
                                            <th align="left">% Charge</th>
                                            <td>${Info.cp_bkamt}</td>
                                        </tr>
                                        <tr>
                                            <th align="left">Subtotal 2</th>
                                            <td>${t2}</td>
                                        </tr>
                                        </table>
										<br>
                                        <table class="style5" width="100%" >
                                        <tr>
                                            <th width="33%" align="left">Total Invoice Amount</th>
                                            <td width="67%">${Info.total}</td>
                                        </tr>

                                    </table>


                                    <P>

                                    </P>


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
                                    <li class="active"><a href="AInvoicesServlet">Invoices</a></li>
                                    <li><a href="AInvoiceVendorlstServlet">Generate</a></li>


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


