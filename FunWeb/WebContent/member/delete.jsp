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
<body background="../images/wood-2045380_1920.jpg">
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp" />
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
		<script type="text/javascript">
		
// 		function fun() {
// 			if(document.fr.pass.value!=document.fr.pass2.value){
// 				alert("비밀번호가 일치하지 않습니다!");
// 				return false;
// 			}else{
// 				return true;
// 			}
			
// 		}
		
		</script>

	
		<article>
			<h1>Information</h1>
<%

	String id = (String)session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(id);
	if(id==null){
		response.sendRedirect("loginForm.jsp");

	}

%>
<form action="deletePro.jsp" method="post">
<table>

<tr><td>아이디 :</td><td><input type="text" name="id" value="<%=mb.getId()%>" readonly></td></tr>
<tr><td>비밀번호 :</td><td><input type="password" name="pass"></td></tr>
<tr><td><input type="submit" value="회원정보삭제"></td><td><input type="button" value="돌아가기" onclick="location.href='../main/main.jsp'"></td></tr>
</table>
</form>

			


		</article>
		<!-- 게시판 -->

		<!-- 본문들어가는 곳 -->

		<div class="clear"></div>

		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는곳 -->

	</div>
</body>
</html>




