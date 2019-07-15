<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// num 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
//BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// 조회수 증가
// updateReadcount(num)
bdao.updateReadcount(num);
//BoardBean bb  =  getBoard(num) 메서드호출
BoardBean bb=bdao.getBoard(num);
%>
<h1>board/content.jsp</h1>
<h2>게시판 글내용보기</h2>
<table border="1">
<tr><td>글번호</td><td><%=bb.getNum() %></td>
<td>조회수</td><td><%=bb.getReadcount() %></td></tr>
<tr><td>작성자</td><td><%=bb.getName() %></td>
<td>작성일</td><td><%=bb.getDate() %></td></tr>
<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>첨부파일</td>
<td colspan="3">
<a href="../upload/<%=bb.getFile()%>"><%=bb.getFile() %></a>
<img src="../upload/<%=bb.getFile()%>" width="100" height="100">
</td></tr>
<tr><td>내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" 
    onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="글삭제" 
    onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="답글쓰기" 
    onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq()%>'">    
<input type="button" value="글목록" 
    onclick="location.href='notice.jsp'"></td></tr>
</table>
</body>
</html>







