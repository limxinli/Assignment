<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*"%>
<%
if (session.getAttribute ("ADMIN-STATUS") != "YES") {
	response.sendRedirect("index.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>SP Game Store</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLE CSS -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE CSS -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- Favicon -->
<link rel="shortcut icon" href="assets/img/favicon.ico" />
</head>
<body>
	<%
		Connection conn = DatabaseConnection.getConnection();

		String genre_id = request.getParameter("genreid");
		String genre_name = request.getParameter("genrename");

		String sql = "update genre set genre_name=? where genre_id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, genre_name);
		pstmt.setString(2, genre_id);
		
		int recsModified = pstmt.executeUpdate();

		out.println(recsModified + " record updated");
		
		conn.close();
	%>
	<a href="editgenre.jsp">Return</a>
</body>
</html>