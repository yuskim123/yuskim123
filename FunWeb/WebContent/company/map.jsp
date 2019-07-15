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
<h1>오시는길</h1>
<div id="map" style="width:500px;height:400px;"></div>
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7d6dbcbf82ac99a9d807915835e4d22"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6442ba18828b87fe21881fa3ac8322dd&libraries=services,clusterer,drawing"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6442ba18828b87fe21881fa3ac8322dd"></script> -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6442ba18828b87fe21881fa3ac8322dd"></script> -->
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(35.158490, 129.062031),
			level: 3
		
		};
		var map = new kakao.maps.Map(container, options);
		var markerPosition = new kakao.maps.LatLng(35.158490, 129.062031);
		
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		var infowindow= new kakao.maps.InfoWindow({
			content: '<div style="width:150px;text-align:center;padding:6px 0;">SBACK 레스토랑</div>'
		});
		infowindow.open(map, marker);
		marker.setMap(map);
	</script>
	<div>
<h3>자차로 오시는 경우</h3>
부산광역시 부산진구 부전동 112-3번지<br>
삼한골든게이트 7층  ( 도로명주소 : 부산광역시 부산진구 동천로 109
삼한골든게이트 7층  )<br>
	</div>
<h3>지하철을 이용하시는 경우</h3>
서면역 하차 : (도보4분) 서면역 8번 출구 직진 180m -> 미니스탑에서 좌회전 70m (쉐보레자동차 7층)
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




