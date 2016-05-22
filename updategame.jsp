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
<!-- CHOSEN CSS -->
<link rel="stylesheet" href="assets/chosen_v1.5.1/docsupport/prism.css">
<link rel="stylesheet" href="assets/chosen_v1.5.1/chosen.css">
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
					<li><a href="editall.jsp" class="active-menu-item"><span
							class="glyphicon glyphicon-edit" aria-hidden="true"></span> EDIT</a></li>
					<li><a href="login.html"> <span
							class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
							LOGOUT
					</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!--MENU SECTION END-->
	<section class="headline-sec">
	<div class="overlay ">
		<h3>
			UPDATE GAME <i class="fa fa-angle-double-right "></i>
		</h3>

	</div>
	</section>
	<!--TOP SECTION END-->
	<%
		Connection conn = DatabaseConnection.getConnection();

		int id = Integer.parseInt(request.getParameter("id"));

		String sql = "SELECT game_id FROM game_data";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,id);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
	%>

	<%
		}
		conn.close();
	%>
	
	<section>
	<div class="gamedata">
		<form action="updategame.jsp">
		<input type ="hidden" name="id" value="<%=id%>">
			Game ID: <input type="text" name="id" value="<%=rs.getString("game_id")%>"> <br> 
			Game Title: <input type="text" name="title" value="<%=rs.getString("game_title")%>"> <br>
			Company: <input type="text" name="company" value="<%=rs.getString("company")%>"> <br> 
			Release Date: <input type="text" name="date" value="<%=rs.getString("release_date")%>" placeholder="Type in this format (yyyy-mm-dd)"> <br> 
			Description: <textarea class="form-control" rows="5" name="description"	value="<%=rs.getString("description")%>"></textarea> <br> 
			Price: <input type="text" name="price" id="price" class="form-control"> <br> 
			Image Location: <input type="text" name="img" value="<%=rs.getString("img_loc")%>" placeholder="Path of the image (assets/img/)"> <br> 
			Genre:<div class="genre-drop" >
			<select data-placeholder="Select the genre(s)" class="chosen-select"
					multiple style="width: 350px;" tabindex="4" name="genre-drop"
					id="genre-drop">

				</select>
			</div>
			<div class="radio-button2">
				Is it pre-owned? <br> <input type="radio" value=<%=rs.getString("preowned")%> name="type"
					value="no"> No <input type="radio" value="<%=rs.getString("preowned")%>"
					name="type" value="yes"> Yes
			</div>
			<br>Genre ID: <input type="text" name="genreid" value="<%=rs.getString("genre_id")%>"> 
			<input type="submit" lass="btn btn-info" id="add" value="Update">
		</form>
	</div>
	</section>
	
	
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
	<!-- CHOSEN SCRIPTS -->
	<script src="assets/chosen_v1.5.1/chosen.jquery.js"></script>
	<script src="assets/chosen_v1.5.1/docsupport/prism.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var config = {
			'.chosen-select' : {},
			'.chosen-select-deselect' : {
				allow_single_deselect : true
			},
			'.chosen-select-no-single' : {
				disable_search_threshold : 10
			},
			'.chosen-select-no-results' : {
				no_results_text : 'Oops, nothing found!'
			},
			'.chosen-select-width' : {
				width : "95%"
			}
		}
		for ( var selector in config) {
			$(selector).chosen(config[selector]);
		}
	</script>
</body>
</html>