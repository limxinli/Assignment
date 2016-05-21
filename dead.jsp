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
<title>Better Late Than Dead</title>
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
	<div class="navbar navbar-inverse navbar-fixed-top ">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"><strong style=""></strong>Game
					Store<small> Singapore Polytechnic</small></a>

			</div>
			<div class="navbar-collapse collapse move-me">
				<ul class="nav navbar-nav navbar-right set-links">
					<li><a href="index.html"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>
					<li><div class="dropdown">
							<a href="genre.html" class="active-menu-item"><button
									class="dropbtn">
									GAMES <span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content">
								<a href="action.jsp">Action</a> <a
									href="adventure.jsp" class="active-menu-item">Adventure</a> <a href="horror.jsp">Horror</a>
								<a href="rpg.jsp">RPG</a> <a href="shooter.jsp">Shooter</a>
							</div>
						</div></li>
					<li><a href="about.html">ABOUT</a></li>
					<li><a href="login.html"> <span
							class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
							LOGIN
					</a></li>
				</ul>
			</div>

		</div>
	</div>

	<!--MENU SECTION END-->
	<section class="headline-sec">
	<div class="overlay ">
		<h3>
			BETTER LATE THAN DEAD <i class="fa fa-angle-double-right "></i>
		</h3>

	</div>
	</section>
	<!-- HOME SECTION END -->

	<%
		Connection conn = DatabaseConnection.getConnection();

		String sql = "Select * from game_data where game_title='Better Late Than Dead'";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		out.println("<table border='3'>");
	%>

	<tr>
		<th>Game Title</th>
		<th>Company</th>
		<th>Release Date</th>
		<th>Description</th>
		<th>Price</th>
	</tr>

	<%
		while (rs.next()) {
			String name = rs.getString("game_title");
			String com = rs.getString("company");
			Date redate = rs.getDate("release_date");
			String desc = rs.getString("description");
			double price = rs.getDouble("price");
	%>
	<tr>
		<td><%=name%></td>
		<td><%=com%></td>
		<td><%=redate%></td>
		<td><%=desc%></td>
		<td><%=price%></td>
	</tr>
	<%
		}
		out.println("</table>");

		conn.close();
	%>

</body>
</html>