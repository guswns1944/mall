<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<%
	request.setCharacterEncoding("utf-8");
	CategoryDao categoryDao = new CategoryDao();
	// 전체 카테고리 리스트
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
	// 추천 카테고리 이미지 리스트 (4개)
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
%>
<body>
	<div class="container">
		<div style="margin-top: 30px;"></div>
		<div> <!-- 최상단 검색 바 -->	
			<div class="row" style="text-align:center;">
			 <div class="col-sm-4">
			<h1>
				<a style="text-decoration: none; color: black;" href="/mall/index.jsp">Goodee Shop</a>
			</h1>
		</div>
		<div class="col-sm-5">
			<form>
				<table>
					<tr>
						<td width="400px">
							<input type="text" class="form-control col-sm-15" name="search">
						</td>
						<td width="100px">
							<button type="submit" class="btn btn-dark">검색</button>
						</td>
					</tr>
				</table>
				
			</form>
		</div>
			<!-- 마이페이지, 장바구니 -->
			  <div class="col-sm-3">
			  <a>	
			  <i class="fa fa-user-alt" style="font-size:36px"></i></a>		
			  &nbsp;&nbsp;&nbsp;
			  <a style= "color:black;" href="<%=request.getContextPath()%>/orders/myOrdersList.jsp">
			  <i class='fas fa-shopping-cart' style='font-size:36px'></i></a>
			   </div>
			</div>
		</div>
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
					  <p><%=session.getAttribute("loginMemberEmail") %>님 반갑습니다.</p>
					  <li class="nav-item"><a class="nav-link" href="#">회원정보</a></li> 
					  <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a></li> 
			  </ul>
			  <%		  
			  	  }
			  %> 
			</nav>
		</div>
		<br>
	<!-- 전체 카테고리3 이미지 배너 6 -->
		<div>
			<div class="row">
			  <div class="col-sm-3">
			  `	<div class = "btn-group-vertical"> 
			   <%
			   		for(Category c : categoryList1){
			   	%>	
			   			<a href="" class="btn btn-secondary"><%=c.getCategoryName() %></a>
			   	<%			
			   			
			   		}
			   %>
			  	</div>
			  </div>
			  <div class="col-sm-9">
			  		<img src="<%=request.getContextPath() %>/images/default.jpg" width="600" height="400">
			  </div>
			</div>
		</div>
		<br>
		<!-- 추천 카테고리 --> 
		<div class="row">
			<%
				for(Category c : categoryList2){
			%>
					<div class="col-sm-3">
					<a href=""><img class="rounded-circle" alt="Cinque Terre" src="<%=request.getContextPath() %>/images/<%=c.getCategoryPic()%>"width= "200" height="200"></a>
					</div>
			<%		
				}
			%>
		</div>
		<%
			Calendar today = Calendar.getInstance();
			
		%>
		<br>
		<!-- 카테고리별 추천상품 -->
		<div>
			<h3>오늘의 추천 상품<span class="badge badge-secondary"><%=today.get(Calendar.YEAR) %>.<%=today.get(Calendar.MONTH)+1 %>.<%=today.get(Calendar.DATE) %></span></h3>
			<%
			   		for(Category c : categoryList1){
			   	%>
			   			<a href="" class="btn btn-secondary"><%=c.getCategoryName() %></a>
			   	<%		
			   		}
			   %>
		</div>
		<%
			ProductDao productDao = new ProductDao();
			ArrayList<Product> productList = productDao.selectProductList();
		%>
		<!-- 상품 목록 6개 -->
		<table>
			<tr>
			<%
				int i = 0;
				for(Product p : productList){
					i+=1;
			%>
					<td>
					<div class="card" style="width:350px">
					  	<img class="card-img-top" src="/mall-admin/images/<%=p.getProductPic() %>" alt="Card image">
					  	<div class="card-body">
					    <h4 class="card-title"><a href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName() %></a></h4>
					    <p class="card-text"><%=p.getProductPrice() %></p>

						</div>
					</div>
					
					</td>
			<%		
				if(i%3==0){
			%>
					</tr><tr>
			<%			
					}
			}
			%>
				
			</tr>
		</table>
		<!-- 최근 공지 2개 -->
		<%
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
		%>
		<div>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Notice n : noticeList){
				%>
						<tr>
							<td><%=n.getNoticeId() %></td>
							<td>
							<a href="<%=request.getContextPath() %>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>">
							<%=n.getNoticeTitle() %></a>
							</td>
						</tr>
				<%		
					}
				%>
					
				</tbody>
			</table>
		</div>
		
	</div>
</body>
</html>