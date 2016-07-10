<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authentication</title>
</head>
<body>
	<%
		Connection conn = DatabaseConnection.getConnection();

		String inputusername = request.getParameter("userid");
		String inputpassword = request.getParameter("passwd");

		String sql = "Select * from administrator where username=? and password=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, inputusername);
		pstmt.setString(2, inputpassword);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			response.sendRedirect("editall.jsp");
		} else {
			response.sendRedirect("memLogin.html");
		}
		conn.close();
	%>
</body>
</html>