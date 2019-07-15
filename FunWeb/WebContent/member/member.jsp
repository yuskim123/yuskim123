<%@page import="member.MemberBean"%>
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
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body background="../images/wood-2045380_1920.jpg">
<div id="wrap">
<!-- 헤더 들어가는곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더 들어가는곳 -->

<!-- 본문들어가는 곳 -->

<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="member.jsp">회원정보</a></li>
<li><a href="update.jsp">회원정보 수정</a></li>
<li><a href="delete.jsp">회원정보 삭제</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<%
	String id = (String)session.getAttribute("id");
	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(id);

%>
<article>
<h1>Information</h1>

<table id="member">
<tr><th class="tmember">아이디</th> <td><%=mb.getId() %></td> </tr>
    <tr><th class="tmember">이름</th> <td><%=mb.getName() %></td> </tr>
    <tr><th class="tmember">E-MAIL</th> <td><%=mb.getEmail() %></td> </tr>
    <tr><th class="tmember">우편번호</th> <td><%=mb.getPost() %></td>
    <tr><th class="tmember">주소</th> <td><%=mb.getAddress() %> <%=mb.getAddress1() %></td>
    <tr><th class="tmember">폰번호</th> <td><%=mb.getPhone() %></td>
    <tr><th class="tmember">모바일번호</th> <td><%=mb.getMobile() %></td>
    </tr>
 
</table>




<div id="table_search">

</div>
<div class="clear"></div>
<div id="page_control">
	
</div>
</article>
<!-- 게시판 -->

<!-- 본문들어가는 곳 -->

<div class="clear"></div>

<!-- 푸터 들어가는곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는곳 -->

</div>
</body>
</html>















