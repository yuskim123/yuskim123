<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
// request 한글처리
request.setCharacterEncoding("utf-8");
//id, pass, name 파라미터 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//mb변수에 <- 파라미터 값 저장
MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);
//MemberDAO 객체 생성
MemberDAO mdao=new MemberDAO();

// // 1단계 드라이버불러오기
// Class.forName("com.mysql.jdbc.Driver");
// // 2단계 디비연결
// String dbUrl="jdbc:mysql://localhost:3306/jspdb5";
// String dbUser="jspid";
// String dbPass="jsppass";

//mb변수에 <- 파라미터 값 저장


int check=mdao.userCheck(id, pass);
if(check==1){
//  수정작업 updateMember(mb) 메서드호출
	mdao.deleteMember(mb);
// sql="update member set name=? where id=?";
// 		pstmt=con.prepareStatement(sql);
// 		pstmt.setString(1, name);
// 		pstmt.setString(2, id);
// 		pstmt.executeUpdate();
//  main.jsp 이동
	session.invalidate();
	response.sendRedirect("../main/main.jsp");
}else if(check==0){
//  리턴값이 0 이면 비밀번호틀림 뒤로이동
	%>
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
	<%
}else{
//  리턴값이 -1 이면 아이디없음 뒤로이동
	%>
	<script type="text/javascript">
		alert("id없음");
		history.back();
	</script>
	<%
}


%>
</body>
</html>