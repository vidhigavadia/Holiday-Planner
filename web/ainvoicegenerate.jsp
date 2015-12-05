<%-- 
    Document   : ainvoicegenerate
    Created on : Apr 22, 2014, 9:57:27 PM
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
        <script type="text/javascript">
            function calc1()
            {
                var a = document.getElementById("tni").value;
                var b = document.getElementById("c1").value;
                var c = a*b;
                
                document.getElementById("t1").setAttribute("value", c);
                
            }
            function calc2()
            {
                var a,b,c;
                a = document.getElementById("ctbt").value;
                b = document.getElementById("c2").value;
                c = (a*b)/100;
                document.getElementById("t2").setAttribute("value", c);
            }
            function calc3()
            {
                var a,b,c;
                a = document.getElementById("t1").value;
                b = document.getElementById("t2").value;
                c = (parseInt(a, 10))+ parseInt(b, 10);
              
                document.getElementById("t").setAttribute("value", c);
            }
        </script>
        <script type="text/javascript">
            function getVal()
            {
                document.getElementById("err").innerHTML ="";
                var vid =document.getElementById("vlist").value
                var sdt = document.getElementById("sdate").value;
                var edt = document.getElementById("edate").value;
                
                document.getElementById("vid").setAttribute("value", vid);
                
                var xmlhttp;
                
                var vl=document.getElementById("vlist").value;    
               
                if (vl == "")
                {
                    document.getElementById("err").innerHTML="Select Vendor";
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
                        document.getElementById("invdetail").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET","AInvVendorDetail?vid="+vid+"&sdt="+sdt+"&edt="+edt,true);
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
                                <h2 align="left">Generate invoice by entering details.</h2>
                                <h3>  ${Status} </h3>
                                <c:remove scope="session" var="Status" />
                                <c:remove scope="session" var="Update" />

                                <div class="clr"></div>
                                <form action="AGenerateInv" method="get">
                                    <table class="style5" >
                                        <tr>
                                            <th width="200" align="left">Start Date</th>
                                            <td width="150"><input type="date" name="sdate" id ="sdate"/> </td>
                                        </tr>
                                        <tr>
                                            <th width="200" align="left">End Date</th>
                                            <td width="150"><input type="date" name="edate" id="edate" /> </td>
                                        </tr>
                                        <tr>
                                            <th width="200" align="left">Select Vendor</th>
                                            <td width="150">
                                                <select name="vlist" id="vlist" onChange="getVal()" >
                                                    <option value="" >Select Vendor</option>
                                                    <c:forEach items="${VendorList}" var="p" >
                                                        <option value="${p.email}" >${p.fname}&nbsp;${p.lname}</option>
                                                    </c:forEach>
                                                </select>
                                                <div id="err"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="200" align="left">Vendor ID</th>
                                            <td width="200"><input type="text" value="" name="vid" id="vid" readonly="readonly"/></td>
                                        </tr>
                                    </table>
                                    <p><b>Enter Charges and click Invoice to generate Invoice.</b></p>
                                    <div id="invdetail">
                                        <table class="style5">
                                            <tr>
                                                <th width="200" align="left">Total No . of Inquiry</th>
                                                <td width="144"><input type="text" name="tni" id="tni" value="" readonly="readonly"/></td>
                                            </tr>
                                            <tr>
                                                <th width="200" align="left">Charge Per Inquiry(in Rs)</th>
                                                <td><input type="text" name="c1" id="c1" value="100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></td>
                                            </tr>
                                            <tr>
                                                <th width="200" align="left">Total 1</th>
                                                <td><input type="text" name="t1" id="t1" value="" readonly="readonly" onfocus="calc1()"/></td>
                                            </tr>
                                        </table>
                                        <br>
                                        <table class="style5" >
                                            <tr>
                                                <th width="200" align="left">Total No. of Booked trips</th>
                                                <td width="150"><input type="text" name="tbt" id="tbt" value="" readonly="readonly" onfocus="calc1()"/> </td>
                                            </tr>
                                            <tr>
                                                <th width="200" align="left">Total amount of booked trips(in Rs)</th>
                                                <td><input type="text"  name="ctbt" id="ctbt" value="" readonly="readonly" /></td>
                                            </tr>
                                            <tr>
                                                <th width="200" align="left">% Charge to total amount</th>
                                                <td><input type="text" name="c2" id="c2"  value="5" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></td>
                                            </tr>
                                            <tr>
                                                <th width="200" align="left">Total 2</th>
                                                <td><input type="text" name="t2" id="t2" value="" readonly="readonly" onfocus="calc2()" /></td>
                                            </tr>
                                        </table>
                                        <br>
                                        <table class="style5">
                                            <tr>
                                                <th width="200" align="left">Total Amount(Rs)</th>
                                                <td width="144"><input type="text" name="t" id="t" readonly="readonly" onfocus="calc3()"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p>
                                        <input type="submit" value="Generate" />
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
                                    <li><a href="AInvoicesServlet">Invoices</a></li>
                                    <li class="active"><a href="AInvoiceVendorlstServlet">Generate</a></li>


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


