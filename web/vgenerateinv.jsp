<%-- 
    Document   : vgenerateinv
    Created on : Apr 24, 2014, 5:54:05 PM
    Author     : Brijesh Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>View Invoices</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <script type="text/javascript" >
            function getInfo()
            {
                var xmlhttp;
                
                var tid = document.getElementById("tid").value;    
                if (tid == "" )
                {
                    document.getElementById("err1").innerHTML="Select Trip Here.";
                    document.getElementById("err1").style.color="red";
                    return;
                }
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {// code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("info").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET","VGenerateInvInfo?tid="+tid,true);
                xmlhttp.send();
            }
            
        </script>
        <script type="text/javascript" >
            function chkamt()
            {
                document.getElementById("err2").innerHTML="";
                
                var rm , amt;
                rm = document.getElementById("remain").value;
                amt = document.getElementById("amt").value;
                                
               if(amt > rm)
                    {
                        document.getElementById("err2").innerHTML = "Invoice amount can't be greater than remaining amount.";
                        document.getElementById("err2").style.color="red";
                        return false;
                    }
                    return true;
            }
        </script>
        
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
                            <li><a href="DestinationServlet1">Hotel</a></li>
                            <li><a href="VSubmittedTripServlet">Trip</a></li>
                            <li class="active"><a href="VCInvServlet">Invoice</a></li>
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
                                <h2 align="left"><br>
                                    Invoices generated till now.   </h2>
                                <h3>  ${Status} </h3>

                                <c:remove scope="session" var="Status" />
                                <c:remove scope="session" var="Update" />
                                <div class="clr"></div>
                                <form action="VGenerateInv" method="post">
                                    <c:if test="${ empty Trips}">
                                        <h3>You do not have any approved/booked trips to generate invoice.</h3>
                                    </c:if>
                                    <c:if test="${Trips.size() > 0}">
										<br>
                                        <table border="0" class="style5" width="100%">
                                            <tr>
                                                <th width="23%" align="left">Select trip</th>
                                                <td>
                                                    <select name="tid" id="tid" onchange="getInfo()">
                                                        <option value="">Select Trip</option>
                                                        <c:forEach items="${Trips}"  var="a">
                                                            <option value="${a.tid}">${a.tname}</option>
                                                        </c:forEach>
                                                    </select>
                                              </td>
                                            </tr>
                                        </table>
                                        <br>
                                        <div id="info" >
                                          </div>
                                       
                                    </c:if>

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
                                    <li><a href="VCInvServlet">View</a></li>
                                    <li class="active"><a href="VInvTlist">Generate</a></li>
                                    <li><a href="VPayInvList">Pay</a></li>


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

