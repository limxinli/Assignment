<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*,controller.*, java.util.*, model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
				<a class="navbar-brand" href="index.jsp"><strong style=""></strong>Game
					Store<small> Singapore Polytechnic</small></a>
			</div>
			<div class="navbar-collapse collapse move-me">
				<ul class="nav navbar-nav navbar-right set-links">
					<li><a href="index.jsp" class="active-menu-item"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>
					<li><div class="dropdown">
							<a href="allgames.jsp"><button class="dropbtn">
									GAMES <span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content">
								<a href="action.jsp">Action</a> <a href="adventure.jsp">Adventure</a>
								<a href="horror.jsp">Horror</a> <a href="rpg.jsp">RPG</a> <a
									href="shooter.jsp">Shooter</a>
							</div>
						</div></li>
					<li><a href="about.jsp">ABOUT</a></li>
					<%
						if (session.getAttribute ("LOGIN-STATUS") != "YES") {
					%>
					<li><a href="login.jsp"> <span
							class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
							LOGIN
					</a></li>
					<%
						}
															else { 
																ArrayList<MemberDetails> viewMembers = (ArrayList<MemberDetails>)session.getAttribute("results");
																
																if (viewMembers != null) {
																	for(MemberDetails member:viewMembers) {
					%>	
							<li><div class="dropdown">
								<a href="viewMember.jsp"><button class="dropbtn"><span
									class="glyphicon glyphicon-user"></span>
										<%=member.getName()%> <span class="caret"></span>
									</button></a>
								<div id="myDropdown" class="dropdown-content dropdown-menu-right">
									<a href="displayShoppingCart.jsp">Shopping Cart</a>
									<a href="logoutMember.jsp" onclick="Logout()">Logout</a>
								</div>
								<script>
									function Logout() {
										alert ('Successfully logged out!');
									}
								</script>
							</div></li>
						<%
								}
							}
						}
						%>
				</ul>
			</div>

		</div>
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

	<!--MENU SECTION END-->
	<div id="feature-sec">
		<div class="container">
			<div class="row ">
				<div class="col-md-12">
					<div id="carousel-example" class="carousel slide"
						data-ride="carousel">

						<ol class="carousel-indicators">
							<li data-target="#carousel-example" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example" data-slide-to="1"></li>
							<li data-target="#carousel-example" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<div class="container center">
									<div class="container col-md-offset-3 slide-custom">
										<h4 class="slideshow">Featured</h4>
										 <img
											src="assets/img/featured.jpg"
											alt="Featured Game" width="1000" height="500" border="1"
											class="img-u">
								
									</div>
								</div>
							</div>
							<div class="item">
								<div class="container center">
									<div class="container col-md-offset-3 slide-custom">
										<h4 class="slideshow">Upcoming</h4>
										<img
											src="assets/img/newgame.jpg"
											alt="New Games" width="1000" height="500" border="1"
											class="img-u">
									</div>
								</div>
							</div>
							<div class="item">
								<div class="container center">
									<div class="container col-md-offset-3 slide-custom">
										<h4 class="slideshow">Editors' Choice</h4>
										<img
											src="assets/img/editor.jpg"
											alt="Editor's Choice" width="1000" height="500" border="1"
											class="img-u">
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--HOME SECTION END-->

	<section id="search-game">
		<div class="container">
		<form action="searchgame.jsp">
			<div id="searchforgame">
				<div class="col-md-6">
					<input type="text" id="search" name="gametitle" value="Enter game title"
						onfocus="if(this.value==this.defaultValue)this.value='';"
						onblur="if(this.value=='')this.value=this.defaultValue;"
						class="form-control input-cls" />
				</div>

				<div class="genre-drop">
					<select name="genre-drop" id="genre-drop">
					<option value="none">None</option>
						<option value="action">Action</option>
						<option value="adventure">Adventure</option>
						<option value="horror">Horror</option>
						<option value="rpg">RPG</option>
						<option value="shooter">Shooter</option>
					</select>
				</div>

				<div class="radio-button">
					<input type="radio" id="new" name="type" value="no"> New <input
						type="radio" id="preowned" name="type" value="yes">
					Pre-owned
				</div>
					<div class="col-md-4">
						 <input type="submit" id="submit"
							class="btn btn-info btn-lg btn-set" value="SEARCH GAME" />
					</div>
			</div>
			</form>
		</div>
	</section>
	<!--SEARCH SECTION END-->
	<div class="horizontal_line"></div>
	<div id="new-release">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span><a
			href="new.jsp" class="new-release-font"> New Releases</a>
	</div>

	<div class="indeximages">
	<%
	Connection conn = DatabaseConnection.getConnection();
	
	String sql = "select * from game_data gd, genre g, game_genre gg where gd.game_id=gg.game_id and gg.genre_id=g.genre_id group by release_date having datediff(curdate(), release_date) < 180 AND release_date <= curdate()";

	PreparedStatement pstmt = conn.prepareStatement(sql);

	ResultSet rs = pstmt.executeQuery();

	while (rs.next()) {
		int dbgameid = rs.getInt("game_id");
		String dbimageloc = rs.getString("image_loc");
			
	%>
	<form action="ingame.jsp" method="get">
		<input type="hidden" name="hiddenID"/>
	
	<a href="ingame.jsp?hiddenID=<%=dbgameid%>">
	<img src="<%=dbimageloc%>/img1.jpg" alt="" height="270" width="190" /></a>
	<% }%>
	</form>
	</div>
	
	<div class="horizontal_line"></div>
	<div id="sales">
		<span class="glyphicon glyphicon-usd" aria-hidden="true"></span><class="sales-font"> On Sale Now
	</div>

	<div class="indeximages">
	<%
	String sql2 = "select * from game_data where sale_price != '0'";

	pstmt = conn.prepareStatement(sql2);

	rs = pstmt.executeQuery();

	while (rs.next()) {
		int dbgameid = rs.getInt("game_id");
		double dbsprice = rs.getDouble("sale_price");
		String dbimageloc = rs.getString("image_loc");
			
	%>
	<form action="ingame.jsp" method="get">
		<input type="hidden" name="hiddenID"/>
	
	<a href="ingame.jsp?hiddenID=<%=dbgameid%>">
	<img src="<%=dbimageloc%>/img1.jpg" alt="" height="270" width="190" /></a>
	<% }
	conn.close();
	%>
	</form>
	</div>

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
