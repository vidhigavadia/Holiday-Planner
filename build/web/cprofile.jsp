<%-- 
    Document   : aprofile
    Created on : Mar 16, 2014, 4:03:40 PM
    Author     : Brijesh Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
    <head>
        <title>Profile</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <script type="text/javascript">
            function PerfAction()
            {
  
                document.getElementById("fname").removeAttribute('disabled');
                document.getElementById("lname").removeAttribute('disabled');
             //   document.getElementById("gender1").removeAttribute('disabled');
             //   document.getElementById("gender2").removeAttribute('disabled');
                document.getElementById("street").removeAttribute('disabled');
                document.getElementById("city").removeAttribute('disabled');
                document.getElementById("pincode").removeAttribute('disabled');
                document.getElementById("state").removeAttribute('disabled');
                document.getElementById("phno").removeAttribute('disabled');
                document.getElementById("save").removeAttribute('disabled');
                document.getElementById("edit").disabled = "true";
      
            }

            function validate()
            {
                document.getElementById("errorfname").innerHTML="";		
                document.getElementById("errorlname").innerHTML="";						             
    	
                var fname=document.getElementById("fname").value;
                var lname=document.getElementById("lname").value;
    		
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
                            <li class="active"><a href="SetProfileServlet">Profile</a></li>
                            <li><a href="trip.jsp">Trip</a></li>

                            <li><a href="AllInvoiceServlet">Invoice</a></li>
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
                                    Hello ${ProfileInfo.fname} </h2>
                                <h3>  ${Update} </h3>

                                <c:remove scope="session" var="Status" />
                                <c:remove scope="session" var="Update" />
                                <div class="clr"></div>
                                <form action="EditServlet" method="post">
                                    <table width="100%" height="229">
                                        <tr>
                                            <th width="25%" scope="row"><div align="left" class="style5">First Name </div></th>
                                        <td width="75%"><input type="text" name="fname" id="fname" disabled="disabled" placeholder="First Name" value=${ProfileInfo.fname}>
                                            <div id="errorfname" class="style1" style="font-size:12px"></div>
                                        </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Last Name </div></th>
                                        <td><input type="text" name="lname" id="lname" disabled="disabled" placeholder="Last name" value="${ProfileInfo.lname}"/>
                                            <div id="errorlname" class="style1" style="font-size:12px"></div>
                                        </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Gender</div></th>
                                        <td><p>
                                                <c:if test="${ProfileInfo.gender == 'male'}" >
                                                    <label>
                                                        <input type="radio" name="gender" value="male" readonly="readonly" checked="checked">
                                                        Male</label>
                                                    <label>
                                                        <input type="radio" name="gender" value="female" readonly="readonly">
                                                        Female</label>
                                                    <br>
                                                </c:if>
                                                <c:if test="${ProfileInfo.gender == 'female'}" >
                                                    <label>
                                                        <input type="radio" name="gender" value="male" readonly="readonly">
                                                        Male</label>
                                                    <label>
                                                        <input type="radio" name="gender" value="female" readonly="readonly" checked="checked">
                                                        Female</label>
                                                    <br>
                                                </c:if>
                                                <c:if test="${ProfileInfo.gender == 'null'}" >
                                                    <label>
                                                        <input type="radio" name="gender" value="male" readonly="readonly">
                                                        Male</label>
                                                    <label>
                                                        <input type="radio" name="gender" value="female" readonly="readonly">
                                                        Female</label>
                                                    <br>
                                                </c:if>
                                            </p></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Address</div></th>
                                        <td><input type="text" name="street" id="street" disabled="disabled" placeholder="Street" value="${ProfileInfo.street}"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left"><span class="style5"><span class="style5"></span></span></div></th>
                                        <td><input type="text" name="city" id="city" disabled="disabled" placeholder="City" value="${ProfileInfo.city}">
                                            <input type="text" name="pincode" id="pincode" disabled="disabled" placeholder="Pincode" value="${ProfileInfo.pincode}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left"><span class="style5"><span class="style5"></span></span></div></th>
                                        <td><input type="text" name="state" id="state" disabled="disabled" placeholder="State" value="${ProfileInfo.state}"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Phone No. </div></th>
                                        <td><input type="text" name="phno" id="phno" disabled="disabled" value="${ProfileInfo.phno}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left" class="style5">Email</div></th>
                                        <td><input type="text" name="email" id="email" readonly="readonly" value="${ProfileInfo.email}"></td>
                                        </tr>
                                    </table>

                                    <p>&nbsp;</p>
                                    <p class="style1"><input type="button" value="Edit" onClick="PerfAction();" id="edit"/></a>	
                                        &nbsp;&nbsp;&nbsp;<input type="submit" value="Save" id="save" onClick="return validate();" disabled="disabled" /></p>
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
                                    <li class="active"><a href="SetProfileServlet">Profile</a></li>
                                    <li><a href="changepassword.jsp">Change Password</a></li>
                                    <li><a href="LogOutServlet">Log out</a></li>

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
