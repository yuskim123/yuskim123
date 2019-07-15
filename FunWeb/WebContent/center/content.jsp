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

<h1>글 내용 상세 보기</h1>
<%
	
	BoardBean bb = new BoardBean();
	BoardDAO bdao = new BoardDAO();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	bdao.plusRead(num);
	bb = bdao.contentBoard(num); 
	String content=bb.getContent();
	if(content!=null){
		// /r/n => <br> 바꾸기 문자열.replace("old문자열","new문자열")
		content=content.replace("\r\n","<br>");		
		
	}
	String id = (String)session.getAttribute("id");
			
	%>
	<article>
	<table border="1" id="notice">
	<tr><td>번호</td><td><%=bb.getNum() %></td>
	<td>작성날짜</td><td><%=bb.getDate() %></td></tr>
	<tr><td>글쓴이</td><td><%=bb.getName() %></td>
	<td>조회수</td><td><%=bb.getReadcount() %></td></tr>
	<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
	
	<tr><td>내용</td><td colspan="3"><%=content %></td></tr>
	<%if(id!=null){
	 	if(id.equals   (bb.getName())){%>
	<tr><td colspan="2">
	<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
    <input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'"></td>
	 <%	}
		
	}%>
	<td colspan="2"><input type="button" value="답글쓰기" onclick="location.href='rewriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'"></td>
						<td colspan="2"><input type="button" value="글목록" onclick="location.href='notice.jsp'"></td></tr>
	 
	
	
	</table>
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















