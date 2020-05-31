<%@page import="com.learn.mycart.entities.User" %>

<%
   User user=(User)session.getAttribute("current-user");
   if(user==null)
   {
	   session.setAttribute("message", "You are not logged in !! Login first");
	   response.sendRedirect("login.jsp");
   }
   else
   {
	   if(user.getUserType().equals("admin"))
	   {
		   session.setAttribute("message", "You are not Normal User !! Do not access this page");
		   
		   response.sendRedirect("login.jsp");
	   }
   }

%>


















<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Normal User: Mycart</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
     <%@include file="components/navbar.jsp" %>
     <div class="container">
     <h1>This is normal page</h1>
     
     </div>

</body>
</html>