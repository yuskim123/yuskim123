<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="../images/wood-2045380_1920.jpg">
<h1>member/joinPro.jsp</h1>
<%
//회원가입
// request 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터  id pass name email address  phone  mobile 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String post =request.getParameter("post");
String address=request.getParameter("address");
String address1=request.getParameter("address1");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());
// 패키지 member 파일이름 MemberBean 
MemberBean mb=new MemberBean();
// id pass name reg_date email address  phone  mobile
//  MemberBean  mb 객체생성
//  mb 멤버변수 <= 파라미터 저장
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setReg_date(reg_date);
mb.setEmail(email);
mb.setPost(post);
mb.setAddress(address);
mb.setAddress1(address1);
mb.setPhone(phone);
mb.setMobile(mobile);

// 패키지 member 파일이름 MemberDAO
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
//  insertMember(mb) 메서드호출
mdao.insertMember(mb);
// login.jsp 이동
response.sendRedirect("login.jsp");
%>
</body>
</html>





