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
request.setCharacterEncoding("utf8");

String search = request.getParameter("search");
BoardDAO bdao = new BoardDAO();

	int count =bdao.getBoardCount(search);
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

List boardList = bdao.boardList(startRow, pageSize, search);
 
%>
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%
	for(int i =0; i<boardList.size();i++){
		BoardBean bb = (BoardBean)boardList.get(i);%>
		<tr>
		<td><%=bb.getNum()%></td>
		<td class="left"><a href="content.jsp?num=<%=bb.getNum() %>"><%=bb.getSubject() %></a></td>
		<td><%=bb.getName() %></td>
		<td><%=bb.getDate() %></td>
		<td><%=bb.getReadcount() %></td>
		</tr>
		<%
	}
%>
</table>
<div id="table_search">
<form action= "noticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
<input type="button" value="글쓰기" class="btn" onclick="location.href='writeForm.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">
	<%
	if(count!=0){ 
		//게시판 전체 페이지 수 구하기
		//한 화면에 보여줄 페이지수
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int pageBlock=10;
		//시작하는 페이지 번호 구하기
		int startPage =(((currentPage-1)/pageBlock)*pageBlock)+1;
		//끝나는 페이지 번호 구하기
		int endPage = startPage+(pageBlock-1);
		if(endPage>pageCount){
			endPage=pageCount;
		}
		//출력
		if(currentPage<=startPage){%>
			[이전]&nbsp;
		<%}else{ %>
			<a href ="notice.jsp?pageNum=<%=currentPage-1%>">[이전]</a>
			<%
		}
		for(int i = startPage;i<=endPage;i++){
			%><a href="notice.jsp?pageNum=<%=i %>">[<%=i %>]</a>
			<%			
		}
		if(pageCount<=pageBlock||currentPage>=endPage){%>
			[다음]<%
		}else{%>
			<a href = "notice.jsp?pageNum=<%=currentPage+1 %>">[다음]</a>
		<%}
	}
	%>
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















