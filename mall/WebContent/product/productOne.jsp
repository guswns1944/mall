<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginMemberEmail")==null){
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<br>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+"<-productId");
	Product product = new ProductDao().selectProductOne(productId);
%>
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
			<h2>
				<a style="text-decoration: none; color: black;" href="">상품 상세보기</a>
			</h2>
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
<br>
	<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp">
		<input type="hidden" value="<%=product.getProductId() %>" name="productId">
		<input type="hidden" value="<%=product.getProductPrice() %>" name="productPrice">
		<div> 수량 :
		<select name="ordersAmount">
			<%
			for(int i=1;i<11;i++){
			%>
				<option value="<%=i%>"><%=i%></option>
			<%	
			}
			%>
		</select>개
		</div>
		<div>
			배송주소 : 
			<input type= "text" name="ordersAddr" >
		</div>
		<button type="submit">주문</button>
	</form>
	<table class="table-sm table-bordered">
		<tr>
			<td>product_pic</td>
			<td><img src="<%=request.getContextPath() %>/images/<%=product.getProductPic()%>" width="300px" height="300px"></td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId() %></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName() %></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPrice() %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.getProductContent() %></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td><%=product.getProductSoldout() %></td>
		</tr>
	</table>
</div>
</body>
</html>