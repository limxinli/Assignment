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
							<a href="allgames.jsp" class="active-menu-item"><button
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
		ALL GAMES <i class="fa fa-angle-double-right "></i>
		</h3>
	</div>
	</section>
	<div class="searchgames">
	<form action="welcome.jsp">
		Search: <input type="text" name="searchString" id="searchgames" placeholder="Search by game title, company, release date, price or genre name" class="form-control"> <input
			type="submit" id="enter-button" class="btn btn-info" value="Enter">
	</form>
	</div>
	<!-- BACK TO TOP BUTTON -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://arrow.scrolltotop.com/arrow92.js"></script>
	<noscript>
		Not seeing a <a href="http://www.scrolltotop.com/">Scroll to Top
			Button</a>? Go to our FAQ page for more info.
	</noscript>
	<!--TOP SECTION END-->
	<%
		Connection conn = DatabaseConnection.getConnection();

		String sql = "Select * from all_games";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		out.println("<table border='3'>");
	%>
	<caption>
		<h2>
			Games Data
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
			int dbgameid = rs.getInt("game_id");
			String dbgametitle = rs.getString("game_title");
			String dbcompany = rs.getString("company");
			Date dbdate = rs.getDate("release_date");
			String dbdescription = rs.getString("description");
			double dbprice = rs.getDouble("price");
			String newdbprice = String.format("%.2f", dbprice);
			String dbimageloc = rs.getString("image_loc");
			int dbpreowned = rs.getInt("preowned");
			String dbgenreid = rs.getString("genre_id");
			String dbgenrename = rs.getString("genre_name");
	%>
	<tr>
		<td><%=dbgameid%></td>
		<td><%=dbgametitle%></td>
		<td><%=dbcompany%></td>
		<td><%=dbdate%></td>
		<td><%=dbdescription%></td>
		<%
			if (dbprice == 0) {
				out.println("<td>TBC</td>");
			} else {
				%><td><%="$" + newdbprice%></td>
		<%
			}
		%>
		<td><%=dbimageloc%></td>
		<%
			if (dbpreowned == 1) {
					out.println("<td>yes</td>");
				} else {
					out.println("<td>no</td>");
				}

		%>
		    <td><%=dbgenreid%></td>
		    <td><%=dbgenrename%></td>
 </tr>
    


	<%
		}
		out.println("</table>");

		conn.close();
	%>

	<div class="copy-txt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 set-foot">
					&copy 2016 Singapore Polytechnic | All rights reserved | Design by
					: <a href="http://www.binarytheme.com" target="_blank"
						style="color: #7C7C7C;">binarytheme.com</a>
				</div>
			</div>
		</div>
	</div>
	<!-- COPY TEXT SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.11.1.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
</body>
</html>
