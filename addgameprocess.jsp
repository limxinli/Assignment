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

		int game_id = Integer.parseInt(request.getParameter("gameid"));
		String game_title = request.getParameter("title");
		String company = request.getParameter("company");
		String release_date = request.getParameter("date");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String image_loc = request.getParameter("img");
		String preowned = request.getParameter("type");
		String genre_name = request.getParameter("genre-drop");

		String sql = "call addAndSelect(?,?,?,?,?,?,?,?,?)";

		CallableStatement cs = conn.prepareCall(sql);
		cs.setInt(1, game_id);
		cs.setString(2, game_title);
		cs.setString(3, company);
		cs.setString(4, release_date);
		cs.setString(5, description);
		cs.setString(6, price);
		if (price.isEmpty()){
			cs.setInt(6, 0);
		}
		else {
			cs.setString(6, price);
		}
		cs.setString(7, image_loc);
		if ("no".equals(preowned)) {
			cs.setInt(8, 0);
		} else if ("yes".equals(preowned)) {
			cs.setInt(8, 1);
		}
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
			game_id = rs.getInt("game_id");
			game_title = rs.getString("game_title");
			company = rs.getString("company");
			Date dbdate = rs.getDate("release_date");
			description = rs.getString("description");
			double dbprice = rs.getDouble("price");
			String newdbprice = String.format("%.2f", dbprice);
			image_loc = rs.getString("image_loc");
			int dbpreowned = rs.getInt("preowned");
			genre_id = rs.getString("genre_id");
			String dbgenrename = rs.getString("genre_name");
	%>
	<tr>
		<td><%=game_id%></td>
		<td><%=game_title%></td>
		<td><%=company%></td>
		<td><%=dbdate%></td>
		<td><%=description%></td>
		<%
			if (dbprice == 0) {
					out.println("<td>TBC</td>");
				} else {
		%><td><%="$" + newdbprice%></td>
		<%
			}
		%>
		<td><%=image_loc%></td>
		<%
			if (dbpreowned == 1) {
					out.println("<td>yes</td>");
				} else {
					out.println("<td>no</td>");
				}
		%>
		<td><%=genre_id%></td>
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