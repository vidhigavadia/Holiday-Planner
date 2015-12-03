<%-- 
    Document   : plantrip
    Created on : Mar 4, 2014, 5:24:52 PM
    Author     : Brijesh Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Plan Trip</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" media="screen, print, handheld" type="text/css" href="calendar.css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <script type="text/javascript" src="calendar.js"> </script>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
        
        <script type="text/javascript">
   function initialize() {
    var from = document.getElementById('from');
    var to = document.getElementById('to');
    var area = document.getElementById('area');
    var options = {componentRestrictions: {country: 'us'}};
                 
    new google.maps.places.Autocomplete(from, options);
    new google.maps.places.Autocomplete(to, options);
    new google.maps.places.Autocomplete(area, options);
}
             
google.maps.event.addDomListener(window, 'load', initialize);
</script>
        <script type="text/javascript">
            function add2()
            {
                var xmlhttp;
    
                document.getElementById("err").innerHTML="";
                var ar=document.getElementById("area").value;    
                var ty=document.getElementById("htype").value;
                var sd= document.getElementById("asdate").value;
                var ed= document.getElementById("aedate").value;
    
                document.getElementById("err").innerHTML = "";
                var asd = new Date(document.getElementById("asdate").value);
                var aed = new Date(document.getElementById("aedate").value);
                var tsd = new Date(document.getElementById("tsdate").value);
                var ted = new Date(document.getElementById("tedate").value);
                
              
                if(asd.getTime() > aed.getTime())
                {
                    
                    document.getElementById("err").innerHTML = "End Date must be greater than start date";
                    return;
                
                }
                if( (asd.getTime() < tsd.getTime()) || aed.getTime() > ted.getTime() )
                {
                    document.getElementById("err").innerHTML = "Confirm dates with trip dates.";
                    return;
                }
                
                
                if (ar=="" || ty == "" || sd ==null || ed == null )
                {
                    document.getElementById("err").innerHTML="Enter all details above, then click Add";
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
                        document.getElementById("addtable").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("POST","AddAreaServlet?area="+ar+"&htype="+ty+"&asdate="+sd+"&aedate="+ed,true);
                xmlhttp.send();
            }
    
    
            function remove12(i)
            {
               
                var id = i;
                var xmlhttp;
    
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
                        document.getElementById("addtable").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("POST","RemoveAreaServlet?aid="+id,true);
                xmlhttp.send();
            }
    
        </script>
        
           
        <script type="text/javascript">
            
            function checkDate()
            {
                 document.getElementById("dateerr").innerHTML = "";
                var sd = new Date(document.getElementById("tsdate").value);
                var ed = new Date(document.getElementById("tedate").value);
                if(sd.getTime() > ed.getTime())
                {
                    alert("End Date must be greater than start date");
                    document.getElementById("dateerr").innerHTML = "End Date must be greater than start date";
                
                }
            }
            
        </script>

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
                                <form action="GetAllInfoServlet" method="post" name="plantrip">
                                    <h3>${Status}</h3>
                                    <c:remove scope="session" var="Status" ></c:remove>
                                    <table width="100%" border="0">
                                        <tr>
                                            <th width="22%" scope="row"><div align="left">Trip Name</div></th>
                                        <td width="77%"><input type="text" name="tname" id="tname" placeholder="Give unique name to trip" value=""></td>
                                        </tr>
                                        <tr>
                                            <th width="22%" scope="row"><div align="left">From</div></th>
                                    <td width="77%"><input type="text" name="from" id="from" autocomplete="on"></td>
                                        </tr>
                                        
                                        <tr>
                                            <th width="22%" scope="row"><div align="left">To</div></th>
                                    <td width="77%"><input type="text" name="to" id="to" autocomplete="on"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">Start Date </div></th>
                                        <td><input type="date" name="tsdate" id="tsdate" value=""></td>
                                        </tr>

                                        <tr> <th height="29" scope="row"><div align="left">End Date </div></th>
                                    <td><input type="date" name="tedate" id="tedate" value=""><div id="dateerr"></div></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">No. of Adults</div></th>
                                    <td><input type="text" name="nadult" id="nadult" value="0" onfocus="checkDate()"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">No. of Children </div></th>
                                        <td><input type="text" name="nchild" id="nchild" value="0"></td>
                                        </tr>
                                        <tr>
                                            <td height="121" width="22%"><em>Enter Area names one by one, then click Add. </em></td>
                                            <td><table width="79%">
                                                    <tr>
                                                        <th width="32%" scope="row"><div align="left">Enter Area </div></th>
                                                <td width="68%"><input type="text" name="area" id="area" autocomplete="on"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">Hotel Type </div></th>
                                        <td><select name="select" id="htype">
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
                                            <th scope="row"><div align="left">Start Date </div></th>
                                        <td><input type="date" name="asdate" id="asdate">	</td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><div align="left">End Date </div></th>
                                        <td><input type="date" name="aedate" id="aedate"></td>
                                        </tr>
                                        <tr><td id="err" colspan="2" ></td></tr>
                                        <tr><td align="left" colspan="2">

                                                <input type="button" name="add" value="Add" onClick="add2()">
                                                <input type="reset" name="reset" value="Reset">
                                            </td>
                                        </tr>
                                    </table></td>
                                    </tr>
                                    <tr>  <td colspan="2"><div id="addtable" class="addtable" ></div> </td> </tr>
                                    <tr>
                                    <tr><td align="left" colspan="2">

                                            <input type="submit" name="Submit"/>
                                            <input type="reset" name="Reset" value="Reset" >
                                            </div></td>
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
                                <h2 class="star"><span>Menu</span></h2>
                                <div class="clr"></div>
                                <ul class="sb_menu">
                                    <li class="active"><a href="trip.jsp">Plan New Trip </a></li>
                                    <li><a href="SubmittedTripServlet">Submitted Trip </a></li>
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
