<%@page import="member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

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
// id, pass 파라미터 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// id pass 비교 일치하면
// MemberDAO 객체 생성
MemberDAO mdao=new MemberDAO();
// 리턴값 저장변수  = userCheck(함수처리할때 필요한 id,pass 가져가기)
int check=mdao.userCheck(id, pass);
//  리턴값이 1 이면 아이디 비밀번호 일치 세션값생성 main.jsp이동
//  리턴값이 0 이면 비밀번호틀림 뒤로이동
//  리턴값이 -1 이면 아이디없음 뒤로이동
if(check==1){
	// 세션값 생성  "id",id
			session.setAttribute("id", id);
			// 이동  main.jsp
			response.sendRedirect("../main/main.jsp");
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("아이디없음");
		history.back();
	</script>
	<%
}
%>
</body>
</html>


