<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, db.*, model.*"%>
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
<link href="Assignment/assets/css/style.css" rel="stylesheet" />
<!-- Favicon -->
<link rel="shortcut icon" href="assets/img/favicon.ico" />
</head>
<body>

	<%
		ArrayList<Games_Data> GameArray = (ArrayList<Games_Data>)session.getAttribute("login-status");
			
			if (GameArray != null) {
		for(Games_Data games:GameArray) {
	%>

	<p id="caption">Shopping Cart</p>

	<tr>
		<th>Game ID</th>
		<th>Game Title</th>
		<th>Release Date</th>
		<th>Price</th>
		<th colspan='2'>Actions</th>
	</tr>

	<tr>
		<td><%=games.getGameid()%></td>
		<td><%=games.getGametitle()%></td>
		<td><%=games.getReleasedate()%></td>
		<td><%=games.getSaleprice()%></td>

		<td>
			<form action="DeleteGame" method="get">
				<input type="hidden" name="hiddenID" value="<%=games.getGameid()%>">
				<input type="submit" value="Delete">
			</form>
		</td>
		<td>
			<form action="UpdateGame" method="get">
				<input type="hidden" name="hiddenID" value="<%=games.getGameid()%>">
				<input type="submit" value="Update">
			</form>
		</td>

		<%
			}
			}
		%>
	
<div class="copy-txt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 set-foot">
					&copy 2016 Singapore Polytechnic | LIM XIN LI & BAVANI D/O RAMAN |
					All rights reserved | Design by : <a href="http://www.binarytheme.com" target="_blank"
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