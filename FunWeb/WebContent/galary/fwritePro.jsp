<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="galary.BoardDAO"%>
<%@page import="galary.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContents/board/writePro.jsp</h1><br>

<%
	request.setCharacterEncoding("utf8");

	//파일 업로드
	//업로드 물리적 경로
	String uploadPath = request.getRealPath("/upload");
	System.out.println("upload 물리적 위치 : "+uploadPath);
	//업로드할 파일 최대크기
	int maxSize=5*1024*1024;//5Mb
	
	//MultipartRequest multi = new MultipartRequest(request, 업로드할 경로, 최대파일크기, 인코딩방식, 중복이름 변경);
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,"utf8", new DefaultFileRenamePolicy());
	
	
	BoardBean bb = new BoardBean();
	BoardDAO bdao = new BoardDAO();
	
	bb.setNum(0);
	bb.setName(multi.getParameter("name"));
	bb.setPass(multi.getParameter("pass"));
	bb.setSubject(multi.getParameter("subject"));
	bb.setContent(multi.getParameter("content"));
	
	//업로드된 파일 이름
	String file = multi.getFilesystemName("file");
	bb.setFile(file);
	 
	int readcount = 0;
	Date date = new Date(System.currentTimeMillis());
	
	bb.setNum(bdao.boardNum());
	
	bdao.insertBoard(bb); 
	
%>

	<script type="text/javascript">
		alert("글이 등록 되었습니다!");
		location.href="notice.jsp";
	</script>

</body>
</html>