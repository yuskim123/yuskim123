<%@page import="menu.MenuDAO"%>
<%@page import="menu.MenuBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int ranNum = Integer.parseInt(request.getParameter("num"));
	
	MenuBean mb = new MenuBean();
	MenuDAO dao = new MenuDAO();
	
	mb = dao.getMenu(ranNum);
	
	
	
	%>
<%-- 	<h1><%=mb.getName() %></h1> --%>
<%-- 	<img src="../images/menu/<%=mb.getFile() %>"> --%>

<h1><%=mb.getName() %></h1>
<img src="../images/menu/1.jpg" width="500" height="600">


</body>
</html>