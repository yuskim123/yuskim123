<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>document1</title>

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
<div id="wrap" >
<!-- 헤더파일들어가는 곳 -->

<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->

<!-- 메인이미지 들어가는곳 -->

<div class="clear"></div>
<div id="main_img"><img src="../main/imageView1.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->

<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<!-- <h3>SBACK 소개</h3> -->
<a href="../company/welcome.jsp"><p>SBACK 소개</p></a>
</div>
<div id="security">
<!-- <h3>오시는길</h3> -->
<a href="../company/map.jsp"><p>오시는길</p></a>
</div>
<div id="payment">

<a href="../recommend/recommend.jsp"><p>메뉴</p></a>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">추천</span> Menu</h3>
<dl>
<dt>Stake</dt>
<dd>
<img src="../main/imageView.jpg" width="100px" height="100px">
<img src="../main/imageView1.jpg" width="100px" height="100px">
<img src="../main/imageView2.jpg" width="100px" height="100px">
</dd>
</dl>



</div>
<div id="news_notice">
<h3 class="brown">SBACK notice</h3>
<%

BoardDAO bdao = new BoardDAO();

	int count = bdao.getBoardCount();
	
//한화면에 보여줄 글 개수 설정
int pageSize=5;
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
List boardList = bdao.getBoardList(startRow, pageSize);

%>
<table>
<%
	for(int i =0; i<boardList.size();i++){
		BoardBean bb = (BoardBean)boardList.get(i);%>
		<tr>
		<td class="context"><a href="../center/content.jsp?num=<%=bb.getNum() %>"><%=bb.getSubject() %></a></td>
		<td class="context"><%=bb.getDate() %></td>
		</tr>
		<%
	}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->

<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->

</div>
</body>
</html>


























