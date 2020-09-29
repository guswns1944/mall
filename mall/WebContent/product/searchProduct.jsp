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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<div class= "container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
	</div>
	<br>
<%
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	ArrayList<Product> list = new ArrayList<Product>();
	ProductDao productDao = new ProductDao();
	list = productDao.selectProductSearch(search);
%>
		<table style="margin: auto;">
			<tr>
			<%
				int i = 0;
				for(Product p : list){
					i+=1;
			%>
					<td>
					<div class="card" style="width:350px">
					  	<img class="card-img-top" src="/mall-admin/images/<%=p.getProductPic() %>" alt="Card image">
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
		<%
			if(i==0){
				out.print("검색된 상품이 없습니다.");
			}
		%>
		
</div>
</body>
</html>