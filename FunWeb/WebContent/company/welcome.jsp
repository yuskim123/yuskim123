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
<li><a href="welcome.jsp">SBACK 소개</a></li>
<li><a href="map.jsp">오시는길</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>SBACK </h1>
<figure class="ceo"><img src="../images/company/CEO.jpg" width="196" height="226" 
alt="CEO"><figcaption><b>SBACK CEO YoungSu</b></figcaption>
</figure>
<p>
<br>2019년, 한국에 첫 번째 SBACK이 소개된 해입니다.<br>
국내 최초 단일브랜드 최대 매장, 최대 매출의 기록을 세우며<br>
지금은 전국 10여개의 매장이 운영되고 있습니다.<br><br>

SBACK은 캐주얼한 분위기에서<br>
질 좋은 스테이크를 제공하고자 했던 초심을 중요하게 생각합니다.<br>
최고의 음식은 최상의 재료와 최선을 다하는 태도에 있습니다.<br><br>

최소 3주 이상 숙성한 스테이크<br>
매일 아침 6시간 이상 끓여내는 수프까지<br>
철저하게 지켜온 음식의 맛과 온도<br>
그리고 타협하지 않는 노하우는 지금 이 순간까지<br>
SBACK이 당신에게 최고의 맛을 제공할 수 있는 이유입니다.<br>
2019. 6. 24.</p>
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



