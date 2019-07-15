<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

                   <script type="text/javascript">
   	function setEmail() {

   		var selecteEmail = document.getElementById("emails");
		var optionEmail =selecteEmail.options[selecteEmail.selectedIndex].value;
		
		window.alert(optionEmail);
	

   }
</script>
</head>
<body>
   <%
      MemberDAO md = new MemberDAO();
      
      List<MemberBean> memberList = md.getMemberList();
   	String mail = "";
   	
   %>
   <div id="wrap">
      <!-- 헤더가 들어가는 곳 -->
      <jsp:include page="../inc/top.jsp" />
      <!-- 헤더가 들어가는 곳 -->

      <!-- 본문 들어가는 곳 -->
      <!-- 서브페이지 메인이미지 -->
      <div id="sub_img"></div>
      <!-- 서브페이지 메인이미지 -->
      <!-- 왼쪽메뉴 -->
      <nav id="sub_menu">
         <ul>
            <li><a href="#">Welcome</a></li>
            <li><a href="#">History</a></li>
            <li><a href="#">Newsroom</a></li>
            <li><a href="#">Public Policy</a></li>
         </ul>
      </nav>
      <!-- 왼쪽메뉴 -->
      <!-- 내용 -->
      <article>
   <form action="mail_fwritePro.jsp" method="post" name="fr" enctype="multipart/form-data">
      <table border="1">
         <tr><td>받는사람</td>
            <td>
               <select id="emails" onchange="setEmail()">
                  <%
                  if(memberList != null){
                     for(int i = 0; i < memberList.size(); i++){   // 리스트 
                         MemberBean mb = memberList.get(i);  
                   %>
                  <option value="<%=mb.getEmail() %>" ><%=mb.getName()%></option>
                  <%
                     }
                  }
                  %>
               </select>
            </td>
         </tr>
         <tr><td>Email</td><td><input type="text" id="Email" name="Email"></td></tr>
         <tr><td>제목</td><td><input type="text" name="title"></td></tr>
         <tr><td>첨부파일</td><td><input type="file" name="file"></td></tr>
         <tr><td>본문</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>   
         <tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
      </table>
   </form>
   </article>
      <!-- 내용 -->
      <!-- 본문 들어가는 곳 -->
      <div class="clear"></div>
      <!-- 푸터 들어가는 곳 -->
      <jsp:include page="../inc/bottom.jsp" />
      <!-- 푸터 들어가는 곳 -->
   </div>
</body>
</html>