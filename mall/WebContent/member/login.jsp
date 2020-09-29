<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<%
if(session.getAttribute("loginMemberEmail")!=null){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
	</div>
		<br>
			<div style="text-align:center">
				<h1>로그인</h1>
			</div>
	<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp">
		<table class="table-md" style="margin: auto;">
			<tr>
				<td>member_email : </td>
				<td><input class="form-control" type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw : </td>
				<td><input class="form-control" type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><button class="btn btn-secondary" style=float:right; type="submit">로그인</button></td>
			</tr>
		</table>
		
	</form>
</div>
</body>
</html>