<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<header>

<!-- <body background="../images/bg_gnb (1).png"> -->
<% String id = (String)session.getAttribute("id"); %>
<%if(id==null){ %>
<div id="login"><a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a></div>
<div class="clear"></div>
<%}else{ %>
<div id="login">

<%=id %>님 로그인 중입니다.|
<input type="button" value="회원정보" onclick="location.href='../member/member.jsp'">

<input type="button" value="로그아웃" onclick="location.href='../member/logout.jsp'"></div>
<%} %>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<!-- <div id="logo"><a href="../main/main.jsp"><img src="../images/logo.gif" width="265" height="78" alt="Fun Web"></a></div> -->
<div id="logo"><a href="../main/main.jsp"><img src="../inc/123.png" width="265" height="78"  alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu" >
<ul >
	<li ><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">STORE</a></li>
	<li><a href="../recommend/recommend.jsp">MENU</a></li>
	
	<li><a href="../center/notice.jsp">NOTICE</a></li>
	<li><a href="../mail.jsp">고객의 소리</a></li>

	</ul>
</nav>
</header>
