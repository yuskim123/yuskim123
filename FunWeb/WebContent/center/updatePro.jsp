<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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

	BoardBean bb = new BoardBean();
	
	bb.setNum(Integer.parseInt(request.getParameter("num")));
	bb.setName(request.getParameter("name"));
	bb.setPass(request.getParameter("pass"));
	bb.setSubject(request.getParameter("subject"));
	bb.setContent(request.getParameter("content"));
	bb.setFile(request.getParameter("file"));
	
	BoardDAO bdao = new BoardDAO();
	
	int ch = bdao.updatePro(bb); 
	
	
	
	if(ch==1){
			%>			
			<script>
				alert("수정완료");
				location.href="notice.jsp";
			</script>
			
			<%
		}else if (ch==2){
			%>
			<script>
				alert("비밀번호가 일치하지 않습니다.")
				history.back();
			</script>
			<%
		}else if (ch==0){
			%>
			<script>
				alert("글이 존재하지 않습니다.")
				location.href="notice.jsp";
			</script>
			<%
		}

%>


</body>
</html>

















