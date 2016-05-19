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
							<a href="genre.html" class="active-menu-item"><button
									class="dropbtn">
									GAMES <span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content">
								<a href="action.html" class="active-menu-item">Action</a> <a
									href="adventure.html">Adventure</a> <a href="horror.html">Horror</a>
								<a href="rpg.html">RPG</a> <a href="shooter.html">Shooter</a>
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
			ACTION GAMES <i class="fa fa-angle-double-right "></i>
		</h3>

	</div>
	</section>
	<!--HOME SECTION END-->
	<%
		Connection conn = DatabaseConnection.getConnection();

		String sql = "Select * from game_data gd";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		out.println("<table border='3'>");
	%>

	<tr>
		<th id="gametitle">Game Title</th>
		<th id="release">Release Date</th>
		<th id="desc">Description</th>
		<th id="price">Price</th>
		<th id="img_loc">Image</th>
		<th id="preowned">Pre-owned</th>
		<th id="img_loc">Image</th>
	</tr>
	<%
		while (rs.next()) {
		String gametitle = rs.getString("game_title");
		String rdate = rs.getString("release_date");
		String desc = rs.getString("description");
		String price = rs.getString("price");
		String powned = rs.getString("preowned");

		out.println("<tr>");
		out.println("<td>" + gametitle + "</td>");
		out.println("<td>" + rdate + "</td>");
		out.println("<td>" + desc + "</td>");
		out.println("<td>" + price + "</td>");
		out.println("<td>" + powned + "</td>");
		/* out.println("<td> <img src=" +image+ "</td>"); --> this to display image*/
	%>
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