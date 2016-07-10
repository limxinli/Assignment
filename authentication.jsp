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

		String userID = request.getParameter("userid");
		String pwd = request.getParameter("passwd");
		String email = request.getParameter("email");

		String sql = "Select * from administrator WHERE Name=? and Password=? OR Email=? AND Password=? ";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, pwd);
		pstmt.setString(3, email);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			response.sendRedirect("mempage.jsp");
		} else {
			response.sendRedirect("memLogin.html");
		}
		conn.close();
	%>
</body>
</html>