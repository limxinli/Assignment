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
<title>Horror Games</title>
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
								<a href="action.jsp">Action</a> <a href="adventure.jsp">Adventure</a>
								<a href="horror.jsp" class="active-menu-item">Horror</a> <a
									href="rpg.jsp">RPG</a> <a href="shooter.jsp">Shooter</a>
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
			HORROR GAMES <i class="fa fa-angle-double-right "></i>
		</h3>

	</div>
	</section>
	<!-- HOME SECTION END -->
	<%
		Connection conn = DatabaseConnection.getConnection();

	String sql = "SELECT gd.game_id, gd.game_title, gg.genre_id FROM game_genre gg, game_data gd, genre g WHERE gg.game_id = gd.game_id AND gg.genre_id = g.genre_id AND genre_name='Horror'";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			String gametitle = rs.getString("game_title");
	%>

	<!-- BACK TO TOP BUTTON -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://arrow.scrolltotop.com/arrow92.js"></script>
	<noscript>
		Not seeing a <a href="http://www.scrolltotop.com/">Scroll to Top
			Button</a>? Go to our FAQ page for more info.
	</noscript>
	<!-- BACK TO TOP BUTTON END -->

	<!-- Main Background -->
	<section>
	<div class="row">
		<div class="col-md-4 p-top-row">
			<a href="corpse.jsp" target="_black"> <img
				src="assets\img\CorpseParty\img1.jpg" alt="" height="270"
				width="190" />
			</a>
		</div>
		<%=gametitle%>
	</div>

	<div class="row">
		<div class="col-md-4 p-top-row">
			<a href="alone.jsp" target="_black"> <img
				src="assets\img\LeftAlone\img1.jpg" alt="" height="270" width="190" />
			</a>
		</div>
		<%=gametitle%>
	</div>

	<div class="row">
		<div class="col-md-4 p-top-row">
			<a href="nightcry.jsp" target="_black"> <img
				src="assets\img\NightCry\img1.jpg" alt="" height="270" width="190" />
			</a>
		</div>
		<%=gametitle%>
	</div>

	<div class="row">
		<div class="col-md-4 p-top-row">
			<a href="share.jsp" target="_black"> <img
				src="assets\img\Share\img1.jpg" alt="" height="270" width="190" />
			</a>
		</div>
		<%=gametitle%>
	</div>

	<div class="row">
		<div class="col-md-4 p-top-row">
			<a href="gfather.jsp" target="_black"> <img
				src="assets\img\TheGrandfather\img1.jpg" alt="" height="270"
				width="190" />
			</a>
		</div>
		<%=gametitle%>
	</div>
	<%
		}
		conn.close();
	%> </section>
	<!-- End Main Background -->
	<div class="copy-txt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 set-foot">
					&copy 2016 Singapore Polytechnic | LIM XIN LI & BAVANI D/O RAMAN |
					All rights reserved | Design by : <a
						href="http://www.binarytheme.com" target="_blank"
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