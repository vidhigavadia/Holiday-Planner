<%-- 
    Document   : logout
    Created on : Apr 2, 2014, 7:44:48 PM
    Author     : Brijesh Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging out</title>
       
       
       <script type="text/javascript">
            function autoClick () {
           document.forms["logoutform"].submit();
          }
             window.onload = autoClick;
        </script>
    </head>
    
    <form action="LogOut" id="logoutform" method="post">
       
    </form>
   </html>
