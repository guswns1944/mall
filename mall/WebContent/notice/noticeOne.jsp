<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeId);
	
%>
	<div class="container">
		<!-- 공지 상세내용 -->
		<table class="table table-bordered">
			<tr>
				<td>제목 : </td>
				<td><%=notice.getNoticeTitle() %></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><%=notice.getNoticeContent() %></td>
			</tr>
			<tr>
				<td>작성 날짜 : </td>
				<td><%=notice.getNoticeDate() %></td>
			</tr>
		</table>
	</div>
</body>
</html>