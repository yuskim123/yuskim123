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
<body>

<%
	request.setCharacterEncoding("utf8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");

	BoardDAO bdao = new BoardDAO();
	
	int ch=bdao.deletePro(num, pass);
	
	if(ch==1){
			%>
			<script>
				alert("삭제 성공!");
				location.href="notice.jsp";
			</script>	
			<%
		}else if (ch==2){
			%>
			<script>
				alert("비밀번호가 일치하지 않습니다!");
				history.back();
			</script>
			<%
		}else {
			%>
			<script>
			alert("글이 존재하지 않습니다!");
			history.back();
		</script>
		<% 
	}



%>
</body>
</html>