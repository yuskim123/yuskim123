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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function opcheck(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
    	
    	
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
//                     document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
//                     document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").value = "";
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
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

		<%
			String id = (String) session.getAttribute("id");
			MemberDAO mdao = new MemberDAO();
			MemberBean mb = mdao.getMember(id);
		%>
		<article>
			<h1>Information</h1>

			<form action="updatePro.jsp" name="fr" method="post" onsubmit="return fun()">
				<table id="member">
					<tr>
						<th class="tmember">아이디</th>
						<td><input type="text" name="id" value="<%=mb.getId()%>" readonly></td>
					</tr>
					<tr>
						<th class="tmember">이름</th>
						<td><input type="text" name="name" value="<%=mb.getName()%>"></td>
					</tr>
					<tr>
						<th class="tmember">현재 비밀번호</th>
						<td><input type="text" name="pass" value=""></td>
					</tr>
					<tr>
						<th class="tmember">변경할비밀번호</th>
						<td><input type="text" name="pass2" value=""></td>
					</tr>
					<tr>
						<th class="tmember">E-MAIL</th>
						<td><input type="text" name="email" value="<%=mb.getEmail()%>"></td>
					</tr>
					<tr>
						<th class="tmember">우편번호</th>
						 <td><input type="text" name="post" id="sample6_postcode" value="<%=mb.getPost()%>" readonly></td>
						
					</tr>
					<tr>
						<th class="tmember">주소<br></th>
						
						<td><input type="text" name="address" id="sample6_address"  value="<%=mb.getAddress()%>" readonly>
						<input type="text" name="address1" id="sample6_detailAddress" value="<%=mb.getAddress1()%>">
						<input type="button" onclick="sample6_execDaumPostcode()" value="주소 변경"></td>
						
					</tr>
					<tr>
						<th class="tmember">phone</th>
						<td><input type="text" name="phone" value="<%=mb.getPhone()%>"></td>
					</tr>
					<tr>
						<th class="tmember">Mobilephone</th>
						<td><input type="text" name="mobile" value="<%=mb.getMobile()%>"></td>
					</tr>
				</table>
				<input type="submit" value="수정"> 
				<input type="reset"	value="수정취소">
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















