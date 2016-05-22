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

		int gameid = Integer.parseInt(request.getParameter("game_id"));
		String title = request.getParameter("game_title");
		String company = request.getParameter("company");
		String date = request.getParameter("release_date");
		String desc = request.getParameter("description");
		Double price = Double.parseDouble(request.getParameter("price"));
		String img = request.getParameter("img_loc");
		String genrename = request.getParameter("genre_name");
		String type = request.getParameter("preowned");
		String genreid = request.getParameter("genre_id");

		String sql = "call addAndSelect(?,?,?,?,?,?,?,?,?,?)";

		CallableStatement cs = conn.prepareCall(sql);
		cs.setInt(1, gameid);
		cs.setString(2, title);
		cs.setString(3, company);
		cs.setString(4, date);
		cs.setString(5, desc);
		cs.setDouble(6, price);
		cs.setString(7, img);
		cs.setString(8, genrename);
		cs.setString(9, type);
		cs.setString(10, genreid);
		
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
		<th>Game ID</th>
		<th>Game Title</th>
		<th>Company</th>
		<th>Release Date</th>
		<th>Description</th>
		<th>Price</th>
		<th>Image Location</th>
		<th>Pre-owned</th>
		<th>Genre ID</th>
		<th>Genre Name</th>
	</tr>
	<%
		while (rs.next()) {
			gameid = rs.getInt("game_id");
			title = rs.getString("game_title");
			company = rs.getString("company");
			Date dbdate = rs.getDate("release_date");
			desc = rs.getString("description");
			double dbprice = rs.getDouble("price");
			String newdbprice = String.format("%.2f", dbprice);
			img = rs.getString("image_loc");
			int dbpreowned = rs.getInt("preowned");
			genreid = rs.getString("genre_id");
			String dbgenrename = rs.getString("genre_name");
	%>
	<tr>
		<td><%=gameid%></td>
		<td><%=title%></td>
		<td><%=company%></td>
		<td><%=dbdate%></td>
		<td><%=desc%></td>
		<%
			if (dbprice == 0) {
					out.println("<td>TBC</td>");
				} else {
		%><td><%="$" + newdbprice%></td>
		<%
			}
		%>
		<td><%=img%></td>
		<%
			if (dbpreowned == 1) {
					out.println("<td>yes</td>");
				} else {
					out.println("<td>no</td>");
				}
		%>
		<td><%=genreid%></td>
		<td><%=dbgenrename%></td>
	</tr>



	<%
		}
		out.println("</table>");

		conn.close();
	%>
	<a href="searchgame.jsp">Return</a>
</body>
</html>