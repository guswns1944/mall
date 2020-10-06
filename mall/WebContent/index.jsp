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
		<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		<div>
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
		</div>	
		<br>
	<!-- 전체 카테고리3 이미지 배너 6 -->
		<div>
			<div class="row">
			  <div class="col-sm-4">
			 
			  		<div class="row">
			   <%
			   		for(Category c : categoryList1){
			   %>	
			   		<div class="col-sm-6 text-center">
			   			<a href="<%=request.getContextPath() %>/product/productList.jsp?categoryId=<%=c.getCategoryId() %>" class="btn btn-secondary btn-block"><%=c.getCategoryName() %></a>
			   			<br>
			   		</div>	
			   <%	
			   		}
			   %>
			   </div>
			  </div>
			  
			  <div class="col-sm-8">
			  		<img src="<%=request.getContextPath() %>/images/goodee.jpg" width="600" height="400">
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
					  	<a href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId()%>"><img class="card-img-top" src="/mall-admin/images/<%=p.getProductPic() %>" alt="Card image" width = "300px" height="300px"></a>
					  	<div class="card-body">
					    <h4 class="card-title"><a href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName() %></a></h4>
					    <p class="card-text"><%=p.getProductPrice() %>원</p>

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
		<br>
		<div>
			<h1>
			<a style="text-decoration: none; color: black;" href="<%=request.getContextPath() %>/notice/noticeList.jsp">공지사항</a>
			</h1>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th width="20%">notice_no</th>
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
							<a style="text-decoration: none; color: black;" href="<%=request.getContextPath() %>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>">
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