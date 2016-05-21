<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Created</title>
</head>
<body>
	<%
		Connection conn = DatabaseConnection.getConnection();

		String inputtitle = request.getParameter("title");
		String inputcompany = request.getParameter("company");
		String inputdate = request.getParameter("date");
		String inputdesc = request.getParameter("description");
		String inputprice = request.getParameter("price");
		String inputimg = request.getParameter("img");
		String inputgenre = request.getParameter("genre-drop");
		String inputnew = request.getParameter("new");
		String inputpreowned = request.getParameter("preowned");

		String sql = "";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, inputuserid);
		pstmt.setString(2, inputpassword);

		int recsModified = pstmt.executeUpdate();

		out.println(recsModified + " record inserted");

		conn.close();
	%>
	<a href="displaymembers.jsp">Click to go back</a>
</body>
</html>