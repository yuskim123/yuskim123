
<%@page import="java.util.Random"%>
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
 <%
 Random random = new Random();
 int ranNum = random.nextInt(50)+1; 
 %>
 <script type="text/javascript">
//  function rec() {
<%-- 	window.open("recommendPro.jsp?num=<%=ranNum%>","","width=750, height=900") --%>
// } 
 </script>
</head>
<body background="../images/wood-2045380_1920.jpg">
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="recommend.jsp">Menu</a></li>


</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>추천 메뉴</h1>
<h3>스테이크</h3>
<table>
<tr>
<td>
<img alt="" src="../upload/imageView.jpg" width="150px" height="150px" >
</td>
<td> 
<img alt="" src="../upload/imageView1.jpg" width="150px" height="150px">
</td>
<td>
<img alt="" src="../upload/imageView2.jpg" width="150px" height="150px"> 
</td>
<td>
<img alt="" src="../upload/imageView3.jpg" width="150px" height="150px"> 
</td>
</tr>
<tr>
<td align="center"><b>퀸 립아이 가격:천원</b></td>
<td align="center"> <b>로얄 빅토리아 가격:천원</b></td>
<td align="center"><b>뷰티풀 립 가격:이천원</b></td>
<td align="center"> <b>퍼펙트 립 가격:천원</b></td>
</tr>

</table>
<h3>서브 메뉴</h3>
<table>
<tr>
<td>
<img alt="" src="../images/recommend.jpg" width="150px" height="150px"></td>
<td>
<img alt="" src="../upload/submenu1.jpg" width="150px" height="150px"></td>
<td>
<img alt="" src="../upload/submenu2.jpg" width="150px" height="150px"></td>
<td>
<img alt="" src="../upload/submenu3.jpg" width="150px" height="150px"></td>

</tr>
<tr>
<td align="center"><b>치킨셀러드 가격: 십만원</b></td>
<td align="center"><b>고기셀러드 가격: 백만원</b></td>
<td align="center"><b>투움바 파스타 가격: 백원</b></td>
<td align="center"><b>토마토 파스타 가격: 삼백원</b></td>

</tr>
</table>
<p></p>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>






</body>
</html>