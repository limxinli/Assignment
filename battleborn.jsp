<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Battleborn</title>
</head>
<body>
<%
		Connection conn=DatabaseConnection.getConnection();

		String sql = "Select * from game_data where game_title=Battleborn";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		out.println("<table border='1'>");

		while (rs.next()) {
			String name = rs.getString("game_title");
			String com = rs.getString("company");
			Date redate = rs.getDate("release_date");
			String desc = rs.getString("description");
			double price = rs.getDouble("price");
	%>
	<tr>
		<td><%=name%></td>
		<td><%=com%></td>
		<td><%=redate%></td>
		<td><%=desc%></td>
		<td><%=price%></td>
	</tr>
	<%
		}
		out.println("</table>");
		
		conn.close();
	%>

</body>
</html>