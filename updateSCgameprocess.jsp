<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = DatabaseConnection.getConnection();

		String gametitle = request.getParameter("gametitle");
		Double price = Double.parseDouble(request.getParameter("price"));
		int qty = Integer.parseInt(request.getParameter("quantity"));
		int id = Integer.parseInt(request.getParameter("hiddenID"));
		
		PreparedStatement pstmt = conn
				.prepareStatement("UPDATE inventory SET game_title=?, price=?, quantity=?, WHERE gameid=? ");

		pstmt.setString(1, gametitle);
		pstmt.setDouble(2, price);
		pstmt.setInt(3, qty);
		pstmt.setInt(5, id);
	%>

	<%
		conn.close();
	%>

</body>
</html>