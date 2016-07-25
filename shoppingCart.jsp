<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, db.*, Model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		ArrayList<Games_Data> GameArray = (ArrayList<Games_Data>)session.getAttribute("login-status");
		
		Connection conn = DatabaseConnection.getConnection();
			
		PreparedStatement pstmt = conn
			.prepareStatement("SELECT * FROM shopping_cart ORDER BY gameid");
		
		ResultSet rs = pstmt.executeQuery();

		out.println("<table border='3'>");
	%>

	<p id="caption">
			Shopping Cart
	</p>
	
	<tr>
		<th>Game ID</th>
		<th>Game Title</th>
		<th>Release Date</th>
		<th>Price</th>
		<th colspan='2'>Actions</th>
	</tr>
	
	<%
		while (rs.next()) {
			int dbgameid = rs.getInt("game_id");
			String dbgametitle = rs.getString("game_title");
			Date dbdate = rs.getDate("release_date");
			double dbprice = rs.getDouble("price");

			out.println("<tr>");
			out.println("<td>" + dbgameid + "</td>");
			out.println("<td>" + dbgametitle + "</td>");
			out.println("<td>" + dbdate + "</td>");
			out.println("<td>" + dbprice + "</td>");
	%>

	<td>
		<form action="DeleteGame" method="get">
			<input type="hidden" name="hiddenID" value="<%=dbgameid%>"> <input
				type="submit" value="Delete">
		</form>
	</td>
	<td>
		<form action="UpdateGame" method="get">
			<input type="hidden" name="hiddenID" value="<%=dbgameid%>"> <input
				type="submit" value="Update">
		</form>
	</td>

	<%
		out.println("</tr>");

		}
		out.println("</table>");

		conn.close();
	%>

</body>
</html>