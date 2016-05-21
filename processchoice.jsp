<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verification</title>
</head>
<body>
	<%
	String table = request.getParameter("tablechoice");
	String command = request.getParameter("commands");

	 if(table.equals("Game") && command.equals("Add")) {
	      response.sendRedirect("addgame.jsp");
	   }
	 else if(table.equals("Game") && command.equals("Update")){
		 response.sendRedirect("updategame.html");
	 }
	 else if(table.equals("Game") && command.equals("Delete")){
		 response.sendRedirect("deletegame.html");
	 }
	 else if(table.equals("Genre") && command.equals("Add")){
		 response.sendRedirect("addgenre.html");
	 }
	 else if(table.equals("Genre") && command.equals("Update")){
		 response.sendRedirect("updategenre.html");
	 }
	 else {
		 response.sendRedirect("deletegenre.html");
	 }
	%>
</body>
</html>