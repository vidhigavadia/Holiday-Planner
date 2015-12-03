<%-- 
    Document   : hotel
    Created on : Apr 21, 2014, 10:11:57 AM
    Author     : Brijesh Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Hotel</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
        
        <script type="text/javascript">
   function initialize() {
    var area = document.getElementById('area1');
    
    var options = {componentRestrictions: {country: 'us'}};
                 
    new google.maps.places.Autocomplete(area, options);
    
}
             
google.maps.event.addDomListener(window, 'load', initialize);
</script>
        <script type="text/javascript">
            function a()
            {
        
                document.getElementById("addhotel").removeAttribute("hidden");
                document.getElementById("addarea").setAttribute("hidden", true);
                document.getElementById("addprice").setAttribute("hidden", true);
            }
            function b()
            {
        
                document.getElementById("addhotel").setAttribute("hidden", true);
                document.getElementById("addarea").removeAttribute("hidden");
                document.getElementById("addprice").setAttribute("hidden", true);
            }
            function c()
            {
                document.getElementById("addprice").removeAttribute("hidden");
                document.getElementById("addarea").setAttribute("hidden", true);
                document.getElementById("addhotel").setAttribute("hidden", true);   
            }
            
            function checkarea()
            {
        
                document.getElementById("errordest1").innerHTML="";		
                document.getElementById("errorarea1").innerHTML="";						             
    	
                var state=document.getElementById("state1").value;    
                var area=document.getElementById("area1").value;   
                if(state=="-1")
                {
                    document.getElementById("errordest1").innerHTML="Enter Destination";
                    document.getElementById("errordest1").style.color="red";
                    return false;
                }
                if(area==null || area=="")
                {
                    document.getElementById("errorarea1").innerHTML="Enter area";
                    document.getElementById("errorarea1").style.color="red";
                    return false;
                }
                   
                return true;
                    
            }
     
            function checkhotel()
            {
        
                document.getElementById("errordest2").innerHTML="";		
                document.getElementById("errorarea2").innerHTML="";
                document.getElementById("errorhotel2").innerHTML="";
        
    	
                var state=document.getElementById("state2").value;    
                var area=document.getElementById("area2").value;  
                var hotel=document.getElementById("hotel2").value;  
                if(state=="-1")
                {
                    document.getElementById("errordest2").innerHTML="Enter Destination";
                    document.getElementById("errordest2").style.color="red";
                    return false;
                }
                if(area=="-1")
                {
                    document.getElementById("errorarea2").innerHTML="Enter Area";
                    document.getElementById("errorarea2").style.color="red";
                    return false;
                }
                if(hotel==null || hotel=="")
                {
                    document.getElementById("errorhotel2").innerHTML="Enter Hotel";
                    document.getElementById("errorhotel2").style.color="red";
                    return false;
                }
                 
                return true;
            }
            function checkprice()
            {
                document.getElementById("errordest3").innerHTML="";		
                document.getElementById("errorarea3").innerHTML="";
                document.getElementById("errorhotel3").innerHTML="";
                document.getElementById("errorprice3").innerHTML="";
                 
                var state=document.getElementById("state3").value;    
                var area=document.getElementById("area3").value;  
                var hotel=document.getElementById("hotel3").value; 
                var price=document.getElementById("price").value;
                var sd= document.getElementById("from").value;
                var ed= document.getElementById("to").value;
    
                if(state=="-1")
                {
                    document.getElementById("errordest3").innerHTML="Enter Destination";
                    document.getElementById("errordest3").style.color="red";
                    return false;
                }
                if(area=="-1")
                {
                    document.getElementById("errorarea3").innerHTML="Enter Area";
                    document.getElementById("errorarea3").style.color="red";
                    return false;
                }
                if(hotel=="-1")
                {
                    document.getElementById("errorhotel3").innerHTML="Enter Hotel";
                    document.getElementById("errorhotel3").style.color="red";
                    return false;
                }
                if (sd =="" || ed == "" )
                {
                    document.getElementById("err").innerHTML="Enter Date";
                    document.getElementById("err").style.color="red";
                    return false;
                }
                
                if(price==null || price=="")
                {
                    document.getElementById("errorprice3").innerHTML="Enter Price";
                    document.getElementById("errorprice3").style.color="red";
                    return false;
                }
                
                return true;
                
            }

            function fillarea1()
            {
                var xmlhttp;
                
                var state=document.getElementById("state2").value;    
                   
                if (state == -1)
                {
                    document.getElementById("errordest2").innerHTML="enter destination";
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
                        document.getElementById("area2").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET","FillArea?state="+state,true);
                xmlhttp.send();
            }
            
            function fillarea2()
            {
                var xmlhttp;
                
                var state=document.getElementById("state3").value;    
                    
                if (state == -1)
                {
                    document.getElementById("errordest3").innerHTML="enter destination";
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
                        document.getElementById("area3").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET","FillArea?state="+state,true);
                xmlhttp.send();
            }
            function fillhotel()
            {
                var xmlhttp;
                
                var area=document.getElementById("area3").value;    
                   
                if (area == -1)
                {
                    document.getElementById("errorarea3").innerHTML=" Enter area";
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
                        document.getElementById("hotel3").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET","FillHotel?area="+area,true);
                xmlhttp.send();
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
                            <li class="active"><a href="DestinationServlet1">Hotel</a></li>
                            <li><a href="VSubmittedTripServlet">Trip</a></li>
                            <li><a href="vinvoice">Invoice</a></li>
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
                                    </h2>
                                <h3>  ${Status} </h3>

                                <c:remove scope="session" var="Status" />
                                <c:remove scope="session" var="Update" />
                                <div class="clr"></div>
                                <form action="" method="get">
                                    <table width="100%">
                                        <tr>
                                            <td><input type="button" value="Add Area" onClick="b()"></td>
                                            <td><input type="button" value="Add Hotel" onClick="a()"></td>
                                            <td><input type="button" value="Add Hotel Price" onClick="c()"></td>
                                        </tr>
                                    </table>

                                </form>

                                <div><br/><br/></div>
                                <div class="clr "id="addarea" >
                                    <form action="AddArea" method="get">

                                        <table width="100%"><tr>
                                                <th width="25%" scope="row"><div align="left" class="style5">State </div></th>
                                            <td><select name="state1" id="state1">
                                                    <option value="-1">Select State</option>
                                                    <c:forEach items="${Destination}"  var="a">
                                                        <option value="${a.destId}">${a.destination}</option>
                                                    </c:forEach>
                                                </select>
                                                <div id="errordest1" class="style1" style="font-size:12px"></div>
                                            </td></tr>
                                            <tr><th width="25%" scope="row"><div align="left" class="style5">Area </div></th>
                                            <td><input type="text" name="area1" id="area1" autocomplete="on">
                                                <div id="errorarea1" class="style1" style="font-size:12px"></div>
                                            </td></tr>   
                                        </table>  

                                        &nbsp;<p class="style1"><input type="submit" value="Add" id="add1"onclick="return checkarea();"/></p>


                                    </form>
                                </div>

                                <div class="clr "id="addhotel" hidden="true">
                                    <form action="AddHotel" method="get">

                                        <table width="100%"><tr>
                                                <th width="25%" scope="row"><div align="left" class="style5">State </div></th>
                                            <td><select name="state2" id="state2" onChange="fillarea1()">
                                                    <option value="-1">Select State</option>
                                                    <c:forEach items="${Destination}"  var="a">
                                                        <option value="${a.destId}">${a.destination}</option>
                                                    </c:forEach>
                                                </select>
                                                <div id="errordest2" class="style1" style="font-size:12px"></div>
                                            </td></tr>
                                            <tr><th width="25%" scope="row"><div align="left" class="style5">Area </div></th>
                                            <td><select name="area2" id="area2">
                                                    <option value="-1">Select Area</option>
                                                </select>
                                                <div id="errorarea2" class="style1" style="font-size:12px"></div>
                                            <tr><th width="25%" scope="row"><div align="left" class="style5">Hotel </div></th>
                                            <td><input type="text" name="hotel2" id="hotel2" >
                                                <div id="errorhotel2" class="style1" style="font-size:12px"></div>

                                            </td>
                                            </tr>
                                            <tr>
                                                <th width="25%" scope="row"><div align="left" class="style5">Hotel Type</div></th>

                                            <td><select name="htype" id="htype">
                                                    <option value=""> Select type</option>
                                                    <option value="1 Star"> 1 Star </option>
                                                    <option value="2 Star"> 2 Star </option>
                                                    <option value="3 Star"> 3 Star </option>
                                                    <option value="4 Star"> 4 Star </option>
                                                    <option value="5 Star"> 5 Star </option>
                                                    <option value="7 Star"> 7 Star </option>
                                                </select>


                                            </td>
                                            </tr>

                                            <tr>
                                                <th scope="row"><div align="left" class="style5">Address</div></th>
                                            <td><input type="text" name="street" id="street" placeholder="Street" value=""></td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><div align="left"><span class="style5"><span class="style5"></span></span></div></th>
                                            <td><input type="text" name="city" id="city" placeholder="City" value="">
                                                <input type="text" name="pincode" id="pincode"placeholder="Pincode" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>

                                            </td>
                                            </tr>

                                            <tr>
                                                <th scope="row"><div align="left" class="style5">Phone No. </div></th>
                                            <td><input type="text" name="phno" id="phno" value="" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><div align="left" class="style5">Email</div></th>
                                            <td><input type="text" name="email" id="email" value=""></td>
                                            </tr>    </table>  

                                        &nbsp;<p class="style1"><input type="submit" value="Add" id="add2" onClick="return checkhotel();"/></p>


                                    </form>
                                </div>

                                <div class="clr "id="addprice" hidden="true">
                                    <form action="AddPrice" method="get">

                                        <table width="100%"><tr>
                                                <th width="25%" scope="row"><div align="left" class="style5">State </div></th>
                                            <td><select name="state3" id="state3" onChange="fillarea2()">
                                                    <option value="-1">Select State</option>
                                                    <c:forEach items="${Destination}"  var="a">
                                                        <option value="${a.destId}">${a.destination}</option>
                                                    </c:forEach>
                                                </select>
                                                <div id="errordest3" class="style1" style="font-size:12px"></div>
                                            </td></tr>
                                            <tr><th width="25%" scope="row"><div align="left" class="style5">Area </div></th>
                                            <td><select name="area3" id="area3" onChange="fillhotel()">
                                                    <option value="-1">Select Area</option>
                                                </select>
                                                <div id="errorarea3" class="style1" style="font-size:12px"></div></td></tr>
                                            <tr><th width="25%" scope="row"><div align="left" class="style5">Hotel </div></th>
                                            <td><select name="hotel3" id="hotel3">
                                                    <option value="-1">Select Hotel</option>
                                                </select>
                                                <div id="errorhotel3" class="style1" style="font-size:12px"></div>

                                            </td>
                                            </tr>
                                            <tr>
                                                <th width="25%" scope="row"><div align="left" class="style5">From </div></th>
                                            <td><input type="date" name="from" id="from"></td>
                                            </tr>

                                            <tr>  <th width="25%" scope="row"><div align="left" class="style5">To </div></th>
                                            <td><input type="date" name="to" id="to">

                                                <div id="err" class="style1" style="font-size:12px"></div> </td></tr>
                                            <tr><th width="25%" scope="row"><div align="left" class="style5">Room Type </div></th>
                                            <td><input type="text" name="rtype" id="rtype" >


                                            </td>
                                            </tr>

                                            <tr>
                                                <th width="25%" scope="row"><div align="left" class="style5">Hotel Price</div></th>
                                            <td><input type="text" name="price" id="price" value="" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                <div id="errorprice3" class="style1" style="font-size:12px"></div></td>
                                        </table>
                                        &nbsp;<p class="style1"><input type="submit" value="Add" id="add3" onClick="return checkprice();"/></p>

                                    </form>
                                </div>
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
                                    <li class="active"><a href="DestinationServlet1">Add</a></li>
                                    <li><a href="DestinationServlet2">View/Delete</a></li>
                                 


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


