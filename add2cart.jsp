<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, db.*, Games_data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		String ISBN=request.getParameter("ISBN");
		String Title=request.getParameter("Title");
		String Author=request.getParameter("Author");
		String Publisher=request.getParameter("Publisher");
		int Quantity=Integer.parseInt(request.getParameter("Quantity"));
		double Price=Double.parseDouble(request.getParameter("Price"));

		Games_Data NewGame = new Games_Data();
		NewGame.setGameid(gameid);
		NewGame.setGametitle(gametitle);
		
		ArrayList<Games_Data> BookArray = (ArrayList<ValueBean>)session.getAttribute("book");

		 if(BookArray==null){
			BookArray = new ArrayList<ValueBean>();
		 }

		BookArray.add(NewBook);

		session.setAttribute("book",BookArray);
		response.sendRedirect("displayCart.jsp");
	%>

</body>
</html>