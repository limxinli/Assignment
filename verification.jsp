<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verification</title>
</head>
<body>
	<%
		Connection conn = DatabaseConnection.getConnection();

		String inputusername = request.getParameter("username");
		String inputpassword = request.getParameter("password");

		String sql = "Select * from administrator";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			String dbusername = rs.getString("username");
			String dbpassword = rs.getString("password");

			if (inputusername.equals(dbusername)
					&& inputpassword.equals(dbpassword)) {
				response.sendRedirect("edit.html");
			} else {
				response.sendRedirect("login.html");
			}
		}
		conn.close();
	%>
</body>
</html>