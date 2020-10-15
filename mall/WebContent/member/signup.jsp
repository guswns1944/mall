<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#memberEmail").val().length<1){
				alert("이메일 확인");
				return;
			}else if($("#memberPw").val().length<1){
				alert("비밀번호 확인");
				return;
			}else if($("#memberName").val().length<1){
				alert("이름 확인");
				return;
			}
			$("#signupForm").submit();
		});
	});
</script>
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
	<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp" id="signupForm">
		<table class="table">
			<tr>
				<td>member_email</td>
				<td><input class="form-control" type="text" name="memberEmail"id="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input class="form-control" type="password" name="memberPw" id="memberPw"></td>
			</tr>
			<tr>
				<td>member_name</td>
				<td><input class="form-control" type="text" name="memberName"id="memberName"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><button class="btn btn-secondary" style=float:right; type="button"id="btn">회원가입</button></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>