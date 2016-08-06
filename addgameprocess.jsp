<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*"%>
<%
if (session.getAttribute ("ADMIN-STATUS") == null) {
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

		String game_title = request.getParameter("title");
		String company = request.getParameter("company");
		String release_date = request.getParameter("date");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String image_loc = request.getParameter("img");
		String preowned = request.getParameter("type");
		String genre_name = request.getParameter("genre-drop");

		String sql = "insert into game_data(game_title, company, release_date, description, price, image_loc, preowned) values(?,?,?,?,?,?,?);";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, game_title);
		pstmt.setString(2, company);
		pstmt.setString(3, release_date);
		pstmt.setString(4, description);
		if (price.isEmpty()){
			pstmt.setInt(5, 0);
		}
		else {
			pstmt.setString(5, price);
		}
		pstmt.setString(6, image_loc);
		if ("no".equals(preowned)) {
			pstmt.setInt(7, 0);
		} else if ("yes".equals(preowned)) {
			pstmt.setInt(7, 1);
		}
		
		int recsModified = pstmt.executeUpdate();

		out.println(recsModified + " record added");
		
		conn.close();
	%>
	<a href="editall.jsp">Return</a>
</body>
</html>