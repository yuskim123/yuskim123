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
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
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
				<li><a href="../center/notice.jsp">게시판</a></li>
				<li><a href="../fboard/fnotice.jsp">자료실</a></li>
				<li><a href="../galary/notice.jsp">갤러리</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<%

BoardDAO bdao = new BoardDAO();

	int count = bdao.getBoardCount();
//한화면에 보여줄 글 개수 설정
int pageSize=15;
//페이지번호 가져오기
String pageNum = request.getParameter("pageNum");
//페이지번호를 안가지고 온 경우 => 무조건 1페이지
if(pageNum==null){
	pageNum="1";
}
int currentPage = Integer.parseInt(pageNum);
// currentPage pageSize 이용 가져올 글의 첫행
int startRow = ((currentPage-1)*pageSize)+1;
// currentPage pageSize 이용 가져올 글의 끝행
int endRow = currentPage*10;

List boardList = bdao.boardList(startRow, pageSize);

%>
<article>
<%
String id = (String)session.getAttribute("id");
%>

<h1> 게시판 글등록 </h1>

<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id%>" readonly></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="20" cols="50"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글쓰기"><input type="reset" value="다시쓰기"></td></tr>
</table>
</form>

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















