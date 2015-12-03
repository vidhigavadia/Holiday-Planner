<%-- 
    Document   : avendor
    Created on : Apr 15, 2014, 6:08:57 PM
    Author     : Brijesh Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Vendors</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <script type="text/javascript">
            
            function validate123()
            {
                document.getElementById("errorfname").innerHTML="";		
                document.getElementById("errorlname").innerHTML="";
                document.getElementById("erroremail").innerHTML="";
                document.getElementById("errordip").innerHTML="";
    	
                var fname=document.getElementById("fname").value;
                var lname=document.getElementById("lname").value;
                var em = document.getElementById("email").value;
                var d = document.getElementById("dip").value;
    		
                if(em == null || em=="")
                {
                    alert("Please enter Email ID");
                    document.getElementById("erroremail").innerHTML="Please enter Email ID";
                    document.getElementById("erroremail").style.color="red";
                    return false;
                }
                
                if(fname==null || fname=="")
                {
                    alert("Please enter First Name");
                    document.getElementById("errorfname").innerHTML="Please enter First Name";
                    document.getElementById("errorfname").style.color="red";
                    return false;
                }
		
                if(lname==null || lname=="")
                {
                    alert("Please enter Last Name");
                    document.getElementById("errorlname").innerHTML="Please enter Last Name";
                    document.getElementById("errorlname").style.color="red";
                    return false;
                }
                
                if(d ==null || d =="")
                {
                    alert("Please enter Amount");
                    document.getElementById("errordip").innerHTML="Please enter Amount";
                    document.getElementById("errordip").style.color="red";
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
                            <li class="active"><a href="avendor.jsp">Users</a></li>

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
                                <h2 align="left">Add Vendor </h2>
                                <h3>  ${Status} </h3>
                                <c:remove scope="session" var="Status" />
                                <c:remove scope="session" var="Update" />

                                <div class="clr"></div>
                                <form action="RegisterServlet" method="post">
                                    <table width="100%" >
                                        <tr>
                                            <th width="25%" scope="row"><div align="left" class="style5">First Name </div></th>
                                        <td width="75%"><input type="text" name="fname" id="fname"  placeholder="First Name">
                                            <div id="errorfname" class="style1" style="font-size:12px"></div>                                        </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Last Name </div></th>
                                        <td><input type="text" name="lname" id="lname"  placeholder="Last name"/>
                                            <div id="errorlname" class="style1" style="font-size:12px"></div>                                        </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Gender</div></th>
                                        <td>
                                            <label>
                                                <input type="radio" name="gender" value="male" checked="checked">
                                                Male</label>
                                            <label>
                                                <input type="radio" name="gender" value="female" >
                                                Female</label>

                                        </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Phone No. </div></th>
                                        <td><input type="text" name="phno" id="phno" placeholder="Phone No"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Email (Username)</div></th>
                                        <td><input type="text" name="email" id="email" placeholder="Enter email id" >
                                            <div id="erroremail" class="style1" style="font-size:12px"></div>                                        </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Diposited Amount</div></th>
                                        <td><input type="text" placeholder="Enter Diposited Amount" id="dip" name="dip" value="0">
                                            <div id="errordip" class="style1" style="font-size:12px"></div>                                        </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Paypal ID</div></th>
                                        <td><input type="text" name="paypal" id="pp" /> </td>
                                        </tr>

                                    </table>


                                    <p class="style1">
                                        <input type="submit" name="register" value="Add" onClick="return validate123();" id="add"/>
                                        <input type="reset" value="Reset" />
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
                                    <li class="active"><a href="avendor.jsp">Add Vendor</a></li>
                                    <li><a href="AViewVendorServlet">View Vendors</a></li>
                                    <li><a href="ACustListServlet">View Customers</a></li>
                                    


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

