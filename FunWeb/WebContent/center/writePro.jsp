<%-- <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> --%>
<%-- <%@page import="com.oreilly.servlet.MultipartRequest"%> --%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContents/board/writePro.jsp</h1><br>

<%
	request.setCharacterEncoding("utf8");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject=request.getParameter("subject");
	String content = request.getParameter("content");
	
	BoardBean bb =new BoardBean();
	bb.setName(name);
	bb.setPass(pass);
	bb.setSubject(subject);
	bb.setContent(content);
	
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(bb);
	
	response.sendRedirect("notice.jsp");
%>

	<script type="text/javascript">
		alert("글이 등록 되었습니다!");
		location.href="notice.jsp";
	</script>

</body>
</html>