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

		int comment_id = Integer.parseInt(request
				.getParameter("comment_id"));
		String nickname = request.getParameter("nickname");
		String comment = request.getParameter("company");

		String sql = "call add2AndSelect(?,?,?)";

		CallableStatement cs = conn.prepareCall(sql);
		cs.setInt(1, comment_id);
		cs.setString(2, nickname);
		cs.setString(3, comment);

		cs.execute();

		ResultSet rs = cs.getResultSet();
		cs.getResultSet();
		
		out.println("<table border='1'>");
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
			comment_id = rs.getInt("comment_id");
			nickname = rs.getString("nickname");
			comment = rs.getString("comment");
	%>
	<tr>
		<td><%=comment_id%></td>
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