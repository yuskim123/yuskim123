<%@page import="member.MemberDAO"%>
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
	String id = request.getParameter("userId");

	MemberDAO mdao = new MemberDAO();
	int ch = mdao.idcheck(id);
%>

	<form action="idcheck.jsp" name="wfr" method="get">
	아이디:<input type="text" name="userId" value="<%=id%>"><br>
	<input type = "submit" value="아이디찾기">
	
	
	
	<%if(ch==0){
		%>
		<script>
		alert("사용가능한 아이디 입니다");
		</script>
		<input type = "button" value="아이디사용" onclick="ok()">
		<%
	}else if (ch==1){
		%>
		<script type="text/javascript">
		alert("중복된 아이디 입니다")
		</script>
		<%
	}
	%>
<script type="text/javascript">
function ok() {
	if(<%=ch%>==1){
		alert("중복된 아이디 입니다")
		return;
	}
	
// 	alert("검색한 아이디 : " + document.wfr.userId.value)
	opener.document.fr.id.value=document.wfr.userId.value;
	window.close();
	
}
</script>

</form>

</body>
</html>