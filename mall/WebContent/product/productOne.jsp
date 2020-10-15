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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#ordersAddr").val().length<1){
				alert("배송주소 확인");
				return;
			}
			$("#ordersForm").submit();
		});
	});
</script>
</head>
<body>
<br>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+"<-productId");
	Product product = new ProductDao().selectProductOne(productId);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
	</div>	
<br>
	
	<table class="table table-bordered" style="text-align: center;">
		<tr>
			<td width="20%">product_pic</td>
			<td width="80%"><img src="/mall-admin/images/<%=product.getProductPic()%>" width="300px" height="300px"></td>
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
	<%
	if(product.getProductSoldout().equals("N")){
	%>
	<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp" id="ordersForm">
		<input type="hidden" value="<%=product.getProductId() %>" name="productId">
		<input type="hidden" value="<%=product.getProductPrice() %>" name="productPrice">
		<table class="table table-bordered" style="text-align: center;">
			<tr> 
				<td>수량 </td>
				<td>
				<select class="form-control" name="ordersAmount">
				<%
				for(int i=1;i<11;i++){
				%>
					<option value="<%=i%>"><%=i%>개</option>
				<%	
				}
				%>
				</select>
				</td>
			</tr>
			<tr>
				<td>배송주소  </td>
				<td><input type= "text" class="form-control" name="ordersAddr" id="ordersAddr"></td>
			</tr>		
		</table>
		<button class="btn btn-outline-secondary" style=float:right; id="btn" type="button">주문</button>
	</form>
	<%
	}else{
	%>
	<form method="post" action="<%=request.getContextPath()%>/index.jsp">
		<button class="btn btn-outline-secondary" type="submit">돌아가기</button>
	</form>
	<%
	}
	%>
</div>
</body>
</html>