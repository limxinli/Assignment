<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*"%>
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
<title>Process Comment</title>
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

		String nickname = request.getParameter("nickname");
		String comment = request.getParameter("comment");

		String sql = "insert into comment_id(nickname, comment) values (?,?)";

		CallableStatement cs = conn.prepareCall(sql);
		cs.setString(1, nickname);
		cs.setString(2, comment);

		cs.execute();

		ResultSet rs = cs.getResultSet();
		cs.getResultSet();
		
		out.println("<table border='3'>");
	%>
	<caption>
		<h2>
			Updated table:
			<h2>
	</caption>
	<tr>
		<th>User ID</th>
		<th>Nickname</th>
		<th>Comments</th>
	</tr>
	<%
		while (rs.next()) {
			nickname = rs.getString("nickname");
			comment = rs.getString("comment");
	%>
	<tr>
		<td><%=nickname%></td>
		<td><%=comment%></td>
</tr>

	<%
		}
		out.println("</table>");

		conn.close();
	%>
	<a href="addcomment.jsp">Return</a>
</body>
</html>