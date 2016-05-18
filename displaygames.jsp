<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Games</title>
</head>
<body>

	<%
		Connection conn = DatabaseConnection.getConnection();

		String name = request.getParameter("Name");

		PreparedStatement pstmt = conn
				.prepareStatement("Select * from bali");

		pstmt.setString(1, "%" + name + "%");

		ResultSet rs = pstmt.executeQuery();

		out.println("<table border='1'>");

		//it will move from row1 to other row till no rows and it will force stop 
		while (rs.next()) {

			name = rs.getString("Name");
			String diploma = rs.getString("Diploma");
			int age = rs.getInt("Age");

			out.println("<tr>");
			out.println("<td>" + name + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		conn.close();
	%>

</body>
</html>