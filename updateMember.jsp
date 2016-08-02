<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="controller.*, java.util.*, model.*"%>
<%
	if (session.getAttribute ("LOGIN-STATUS") != "YES") {
		response.sendRedirect("login.jsp");
	}
%>
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
					<li><a href="index.jsp"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>
					<li><div class="dropdown">
							<a href="allgames.jsp"><button class="dropbtn">
									GAMES <span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content">
								<a href="action.jsp">Action</a> <a href="adventure.jsp">Adventure</a>
								<a href="horror.jsp">Horror</a> <a
									href="rpg.jsp">RPG</a> <a href="shooter.jsp">Shooter</a>
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
						} else { 
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
	<!--MENU SECTION END-->
	<section class="headline-sec">
		<div class="overlay ">
		<%
		ArrayList<MemberDetails> viewMembers = (ArrayList<MemberDetails>)session.getAttribute("results");
	
		if (viewMembers != null) {
			for(MemberDetails member:viewMembers) {
		%>
			<h3>
				WELCOME <%=member.getName()%> <i class="fa fa-angle-double-right "></i>
			</h3>

		</div>
	</section>

	<!--TOP SECTION END-->
	<section>
		<div class = "updatemember">
			<form onsubmit="return checkvalue()" action="EditMemberDetailsServlet" method="post">
				<b>Name:</b> <input type="text" name="name" id="name" value="<%=member.getName()%>" class="inputmember-cls"><br><br>
				<b>Mailing Address:</b> <input type="text" name="mail" id="mail" value="<%=member.getMail()%>" class="inputmember-cls"><br><br>
				<b>Email:</b> <input type="text" name="email" id="email" value="<%=member.getEmail()%>" class="inputmember-cls"><br><br>
				<b>Contact Number:</b> <input type="text" name="number" id="number" value="<%=member.getNumber()%>" class="inputmember-cls"><br><br>
				<input type="submit" class="btn btn-info" id="submit-button" value="Save Changes">
			</form>
			<form action="updateMemberPass.jsp">
				<input type="submit" class="btn btn-info" id="submit-button" value="Change Password">
			</form>
		</div>
			<script type="text/javascript">
				function checkvalue() { 
					var name = document.getElementById('name').value;
					var mail = document.getElementById('mail').value;
					var email = document.getElementById('email').value;
					var number = document.getElementById('number').value; 
				    var no = /^[0-9]+$/;
				    if(!name.match(/\S/) || !mail.match(/\S/) || !email.match(/\S/) || !number.match(/\S/)) {
				        alert ('Empty value is not allowed!');
				        return false;
				    }
				    if (email.indexOf("@")==-1 || email.indexOf(".")==-1) {
			    		alert ('Not a valid e-mail!');
			        	return false;
			    	}
				    if(number.length != 8) {
			        	alert ('Contact number must contain 8 digits!');
			        	return false;
				    }
				    if (!no.test(number)) {
		        		alert ('Contact number must contain only numbers!');
		        		return false;
		        	}  
						return true;
				}
			</script>
		<%
	 		}
		}
	%>
	</section>

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