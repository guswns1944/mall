<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>

<body>
<div class="container">	
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
	</div>
	<br>
		<div style="text-align:center">
			<h1>회원가입</h1>
		</div>
	<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp">
		<table class="table">
			<tr>
				<td>member_email</td>
				<td><input class="form-control" type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input class="form-control" type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>member_name</td>
				<td><input class="form-control" type="text" name="memberName"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><button class="btn btn-secondary" style=float:right; type="submit">회원가입</button></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>