<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div><!--  로그인/회원가입 메뉴바 -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			  <!-- Brand/logo -->
			  <!-- 로그아웃 상태 -->
			  
			  <%
			  	  if(session.getAttribute("loginMemberEmail")==null){
			  %>
			  		  <ul class="navbar-nav mr-auto"></ul>
					  <ul class="navbar-nav mr-right">
					  <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li> 
					  <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/signup.jsp">회원가입</a></li> 
			  		</ul>
			  <%
			  	  }else{
			  %><!--로그인 상태  -->
			 
			  		  <ul class="navbar-nav mr-auto"></ul>
					  <ul class="navbar-nav mr-right">
					  <li class="nav-item"><a class="nav-link" ><%=session.getAttribute("loginMemberName") %>님</a></li>
					  <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a></li> 
			  </ul>
			  <%		  
			  	  }
			  %> 
			</nav>
		</div>
</body>
</html>