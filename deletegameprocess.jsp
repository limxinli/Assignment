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
			
			PreparedStatement pstmt = conn
					.prepareStatement("DELETE FROM game_data WHERE game_id =?");

			String sql="call deleteAndSelect(?)";
			
			CallableStatement cs=conn.prepareCall(sql);
			cs.setInt(1,gameid);
			cs.execute();
			
			ResultSet rs=cs.getResultSet();
			cs.getResultSet(); 
			
			out.println("Remaining Records:");
			out.println("<table border='3'>");
	%>
		<tr>
	<th>Game ID</th>
	<th>Game Title</th>
	<th>Company</th>
	<th>Release Date</th>
	<th>Description</th>
	<th>Price</th>
	<th>Image Location</th>
	<th>Pre-owned</th>
</tr>
		<%
		while(rs.next()){ 
			gameid = rs.getInt("game_id");
			String title = rs.getString("game_title");
			String company = rs.getString("company");
			Date dbdate = rs.getDate("release_date");
			String description = rs.getString("description");
			double price = rs.getDouble("price");
			String newdbprice = String.format("%.2f", price);
			String image_loc = rs.getString("image_loc");
			int dbpreowned = rs.getInt("preowned");
			%>
			<tr>
			<td><%=gameid%></td>
			<td><%=title%></td>
			<td><%=company%></td>
			<td><%=dbdate%></td>
			<td><%=description%></td>
<%
			if (price == 0) {
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
			</tr>
		<%
		}
		out.println("</table>");
		
		conn.close();
	%>
	<a href="editall.jsp">Return</a>
</body>
</html>