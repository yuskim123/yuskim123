<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="../images/wood-2045380_1920.jpg">
<%
	request.setCharacterEncoding("utf8");
	int num = Integer.parseInt(request.getParameter("num"));

	BoardDAO bdao = new BoardDAO();
	BoardBean bb = new BoardBean();
	bb = bdao.updateForm(num);
	
%>


<h1>게시판 글수정</h1>


	
	<form action="updatePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=bb.getNum() %>">	
	<table border="1">
	<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=bb.getName() %>" readonly></td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
	<tr><td>제목</td><td><input type="text" name="subject" value="<%=bb.getSubject() %>"></td></tr>
	<tr><td>첨부파일</td><td colspan="3"><a href="../upload/<%=bb.getFile() %>"><%=bb.getFile() %></a> 
	<br><a href="file_down2.jsp?file_name=<%=bb.getFile() %>"><%=bb.getFile() %></a>
	<img src="../upload/<%=bb.getFile() %>" width="50" height="50"></td></tr>
	<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"><%=bb.getContent() %>"</textarea></td></tr>
	<tr><td colspan="2"><input type="submit" value="글수정" ></td></tr>
	<tr><td colspan="2"><input type="reset" value="다시쓰기" ></td></tr>
	
	</table>
</form>
</body>
</html>













