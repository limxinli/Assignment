<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleted</title>
</head>
<body>
	<%
		Connection conn = DatabaseConnection.getConnection();

			int gameid = Integer.parseInt(request.getParameter("id"));

			String sql="call deleteAndSelect(?)";
			
			CallableStatement cs=conn.prepareCall(sql);
			cs.setInt(1,gameid);
			cs.execute();
			
			ResultSet rs=cs.getResultSet();
			cs.getResultSet(); 
			
			out.println("Remaining Records:");
			out.println("<table border='3'>");
	%>
		<tr>
	<th>Game ID</th>
	<th>Game Title</th>
	<th>Company</th>
	<th>Release Date</th>
	<th>Description</th>
	<th>Price</th>
	<th>Image Location</th>
	<th>Pre-owned</th>
</tr>
		<%
		while(rs.next()){ 
			gameid = rs.getInt("game_id");
			String title = rs.getString("game_title");
			String company = rs.getString("company");
			Date dbdate = rs.getDate("release_date");
			String description = rs.getString("description");
			double price = rs.getDouble("price");
			String newdbprice = String.format("%.2f", price);
			String image_loc = rs.getString("image_loc");
			int dbpreowned = rs.getInt("preowned");
			%>
			<tr>
			<td><%=gameid%></td>
			<td><%=title%></td>
			<td><%=company%></td>
			<td><%=dbdate%></td>
			<td><%=description%></td>
<%
			if (price == 0) {
					out.println("<td>TBC</td>");
				} else {
		%><td><%="$" + newdbprice%></td>
		<%
			}
		%>
		<td><%=image_loc%></td>
		<%
			if (dbpreowned == 1) {
					out.println("<td>yes</td>");
				} else {
					out.println("<td>no</td>");
				}
		%>
			</tr>
		<%
		}
		out.println("</table>");
		
		conn.close();
	%>
	<a href="editall.jsp">Return</a>
</body>
</html>