<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{width:450px;
margin: auto;
}
h1{ text-align: center;}

td{ border: 1px dotted gray;}
</style>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body background="images/wood-2045380_1920.jpg">
<div id="wrap">
<!-- 헤더 들어가는곳 -->
<header>
<% String id = (String)session.getAttribute("id"); %>
<%if(id==null){ %>
<div id="login"><a href="member/login.jsp">login</a> | <a href="member/join.jsp">join</a></div>
<div class="clear"></div>
<%}else{ %>
<div id="login"><%=id %>님이 로그인 하였습니다.
<input type="button" value="회원정보" onclick="location.href='member/member.jsp'">
<input type="button" value="로그아웃" onclick="location.href='member/logout.jsp'"></div>
<%} %>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="main/main.jsp"><img src="inc/123.png" width="265" height="78"  alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul >
	<li ><a href="main/main.jsp">HOME</a></li>
	<li><a href="company/welcome.jsp">STORE</a></li>
	<li><a href="recommend/recommend.jsp">MENU</a></li>
	
	<li><a href="center/notice.jsp">NOTICE</a></li>
	<li><a href="mail.jsp">고객의 소리</a></li>

	</ul>
</nav>
</header>
<!-- 헤더 들어가는곳 -->

<!-- 본문들어가는 곳 -->

<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->

<!-- 왼쪽메뉴 -->

<!-- 게시판 -->


<article>
<h1>Notice</h1>
<form action="mailSend" method="post">
<h1>Mail</h1>
<table>
<tr><td>보내는 사람 메일 : </td><td><input type="text" name="sender" value="yuskim123@naver.com" readonly></td></tr>
<tr><td>받는 사람 메일 : </td><td><input type="text" name="receiver"></td></tr>
<tr><td>제목 : </td><td><input type="text" name="subject"></td>
<tr><td>내용 : </td><td><textarea name="content" cols=40 rows=20></textarea></td></tr>
<tr><td align=center colspan="2"><input type="submit" value="보내기"></td>
</table>

</form>
</article>
<!-- 게시판 -->

<!-- 본문들어가는 곳 -->

<div class="clear"></div>

<!-- 푸터 들어가는곳 -->
<footer>
<hr>
<div id="bt_img">
<img src="inc/123.png" width="200" heigth="100" >
</div>
<div id="copy">All contents Copyright 2011 FunWeb 2011 FunWeb 
Inc. all rights reserved<br>
Contact mail:yuskim123@gmail.com Tel +82 64 123 4315
Fax +82 64 123 4321</div>
<div id="social"><img src="images/facebook.gif" width="33" 
height="33" alt="Facebook">
<img src="images/twitter.gif" width="34" height="34"
alt="Twitter"></div>
</footer>
<!-- 푸터 들어가는곳 -->

</div>
</body>
</html>















