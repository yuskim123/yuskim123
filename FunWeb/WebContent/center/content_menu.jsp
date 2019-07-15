<%@page import="menu.MenuDAO"%>
<%@page import="menu.MenuBean"%>
<%@page import="member.MemberBean"%>
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
<body>
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
<li><a href="#">Notice</a></li>
<li><a href="gal.jsp">gallery</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<%
	
	MenuBean bb = new MenuBean();
	MenuDAO bdao = new MenuDAO();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	bdao.plusRead(num);
	bb = bdao.contentBoard(num);  
	 
	String id = (String)session.getAttribute("id");
			
	%>
<h1><%=bb.getName() %></h1>
	<article>
	<img src="../images/menu/<%=bb.getFile() %>" width="250">
	
	<td colspan="2"><input type="button" value="글목록" onclick="location.href='gal.jsp'"></td></tr>
	 
	 
	
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















