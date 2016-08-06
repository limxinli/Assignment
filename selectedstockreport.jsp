<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="controller.*, java.util.*, model.*"%>
<%@page import="java.sql.*,db.*"%>
<%
if (session.getAttribute ("ADMIN-STATUS") == null) {
	response.sendRedirect("index.jsp");
}
%>
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
				<a class="navbar-brand"><strong style=""></strong>Game Store<small>
						Singapore Polytechnic</small></a>

			</div>
			<div class="navbar-collapse collapse move-me">
				<ul class="nav navbar-nav navbar-right set-links">
					<li><div class="dropdown">
						<a><button class="dropbtn"><span class="glyphicon glyphicon-edit"></span> EDIT<span class="caret"></span>
									</button></a>
								<div id="myDropdown" class="dropdown-content dropdown-menu-right">
									<a href="editall.jsp">Games</a>
									<a href="editgenre.jsp">Genres</a>
								</div>
					</div></li>
			 				<li><a href="logoutAdmin.jsp"><span class="glyphicon glyphicon-log-out"></span> LOGOUT</a></i>
				</ul>
			</div>

		</div>
	</div>
	<!--MENU SECTION END-->
	<section class="headline-sec">
	<div class="overlay ">
		<h3>
			STOCK REPORT <i class="fa fa-angle-double-right "></i>
		</h3>
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
	</section>
	<!--TOP SECTION END-->
	<p id="caption">
			Stock Report
	</p>
	<table border = "1">
		<tr>
		<th>Game Title</th>
		<th>Price</th>
		<th>Sales Price</th>
		<th>Quantity</th>
	</tr>
	<%
	ArrayList<StockReportDetails> viewstock = (ArrayList<StockReportDetails>)session.getAttribute("selectresults");
	
	if (viewstock != null) {
		for(StockReportDetails stock:viewstock) {

	%>
	<tr>
		<td><%=stock.getGametitle()%></td>
		<%
		if (stock.getPrice() == 0) { %>
			<td> TBC </td>
		<%
		} else { %>
			<td><%=stock.getPrice()%></td>
		<%
		}
		%>
		<%
		if (stock.getSaleprice() == 0) { %>
			<td> - </td>
		<%
		} else { %>
			<td><%=stock.getSaleprice()%></td>
		<%
		}
		%>
		<td><%=stock.getQuantity()%></td>
	</tr>
	<%
		}
	}
	%>
	</table>


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