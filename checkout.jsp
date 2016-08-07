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
						} else { 
																									ArrayList<MemberDetails> viewMembers = (ArrayList<MemberDetails>)session.getAttribute("results");
																						
																										if (viewMembers != null) {
																											for(MemberDetails member:viewMembers) {
					%>
					<li><div class="dropdown">
							<a href="viewMember.jsp"><button class="dropbtn">
									<span class="glyphicon glyphicon-user"></span>
									<%=member.getName()%>
									<span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content">
								<a href="ViewShoppingCartServlet?hiddenID=<%=member.getId()%>">Shopping
									Cart</a> <a href="logoutMember.jsp">Logout</a>
							</div>
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

	<section class="headline-sec">
	<div class="overlay ">
		<%
			ArrayList<MemberDetails> editMembers = (ArrayList<MemberDetails>)session.getAttribute("results");
			
				if (editMembers != null) {
			for(MemberDetails member:editMembers) {
		%>
		<h3>
			<%=member.getName()%>
			Check Out <i class="fa fa-angle-double-right "></i>
		</h3>

	</div>
	</section>

	<div class="checkout info">
		<form>
			<hr id="passline">
			<b>Information</b>
			<hr id="passline2">
			Name: <%=member.getName()%><br>
			Mailing Address:<%=member.getMail()%><br>
			Email: <%=member.getEmail()%><br>
			Contact Number: <%=member.getNumber()%><br>
		</form>
	</div>
	<%
		}
			}
	%>
	<div class="checkout table">
	<hr id="passline">
		<b>Items confirmed buying</b>
	<hr id="passline2">
	<table border='1' id="confirmed">
		<tr>
			<th><b>Game Title</b></th>
			<th><b>Price($)</b></th>
			<th><b>Quantity</b></th>
		</tr>
		<%
			ArrayList<Games_Data> GameArray = (ArrayList<Games_Data>)session.getAttribute("gameresults");
				
			if (GameArray != null) {
				for(Games_Data games:GameArray) {
		%>
		<tr>
			<td><%=games.getGametitle()%></td>
			<td class="price"><%=games.getNewprice()%></td>
			<td><%=games.getQuantity()%></td>
		</tr>
		<%
			}
				}
		%>
	</table>
	<button onclick="findTotal()" id="viewtotal" class="btn btn-info btn-lg btn-set">View Total</button>
	<div id = "result"></div>
	<script type="text/javascript">
			function findTotal(){
				var sum = 0;
				// iterate through each td based on class and add the values
				$(".price").each(function() {

				    var value = $(this).text();
				    // add only if the value is number
				    if(!isNaN(value) && value.length != 0) {
				        sum += parseFloat(value);
				        sum2 = sum.toFixed(2);
				    }
			    });
				$('#result').text(sum2);
			}
    	</script>
	</div>

	<div class="checkout credit">
		<form>
			<hr id="passline">
			<b>Credit Cart Details</b>
			<hr id="passline2">
			Card Number: <input type="text" maxlength="16" name="ccNumber" class="inputmember-cls"><br>
			<br>Expiration Date: <input type="text" maxlength="2" name="ccExpiryDate" id="expirydate" placeholder="MM" class="inputmember-cls"><input type="text" maxlength="2" name="ccSecurityCode" id="expirydate" placeholder="YY" class="inputmember-cls"><br>
			<br>Security Code: <input type="text" maxlength="3" name="ccSecurityCode" id="securitycode" class="inputmember-cls"><br>
		</form>
	</div>
	
	<form onclick="return confSubmit(this)" action="InsertShoppingCartServlet" method="post">
			<%
			ArrayList<Games_Data> GameArrays = (ArrayList<Games_Data>)session.getAttribute("gameresults");
				
			if (GameArrays != null) {
				for(Games_Data games:GameArrays) {
		%>
		<input type="hidden" name="memberID" value="<%=games.getMemberid()%>"> 
		<input type="hidden" name="gameID" value="<%=games.getGameid()%>"> 
		<input type="hidden" name="gametitle" value="<%=games.getGametitle()%>">
		<input type="hidden" name="price" value="<%=games.getNewprice()%>">
		<input type="hidden" name="quantity" value="<%=games.getQuantity()%>">
					<%
				}
			}
	%>
	<input type="button" class="btn btn-info" id="submit-button5" value="Checkout">
	</form>
	<script type="text/javascript">

	function confSubmit(form) {
		if (confirm("Are you sure you want to submit the form?")) {
			form.submit();
			window.location="index.jsp";

		}
		else {
			alert("You decided not to submit the form!");
			window.location="checkout.jsp";
		}
	}
</script>


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