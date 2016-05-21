<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Product</title>
</head>
<body>
<%
	Connection conn=DatabaseConnection.getConnection();

	String title = request.getParameter("title");
	String company = request.getParameter("company");
	String date = request.getParameter("date");
	String description = request.getParameter("description");
	double price = Double.parseDouble(request.getParameter("price"));
	String image_loc = request.getParameter("img");
	String type = request.getParameter("type");
	
	String sql="call addAndSelect(?,?,?,?,?,?,?)";
	
	CallableStatement cs=conn.prepareCall(sql);
	cs.setString(1,title);
	cs.setString(2,company);
	cs.setString(3,date);
	cs.setString(4,description);
	cs.setDouble(5,price);
	cs.setString(6,image_loc);
	if ("no".equals(type)) {
		cs.setInt(7,0);
	} else if ("yes".equals(type)) {
		cs.setInt(7,1);
	}
	cs.execute();
	
	ResultSet rs=cs.getResultSet();
	cs.getResultSet(); //use getMoreResultSet when you need to produce more than 1 result
	
	out.println("<table border='3'>");%>
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
		int dbgameid = rs.getInt("game_id");
		title = rs.getString("game_title");
		company = rs.getString("company");
		Date dbdate = rs.getDate("release_date");
		description = rs.getString("description");
		price = rs.getDouble("price");
		String newdbprice = String.format("%.2f", price);
		image_loc = rs.getString("image_loc");
		int dbpreowned = rs.getInt("preowned");
%>
		<tr>
		<td><%=dbgameid%></td>
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