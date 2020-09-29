<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	if(session.getAttribute("loginMemberEmail")==null){
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
		return;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<OrdersAndProductAndMember> list = ordersDao.selectOrdersList(session.getAttribute("loginMemberEmail").toString());
%>
<div class="container">
<br>
	<div style="margin-top: 30px;"></div>
		<div> <!-- 최상단 검색 바 -->	
			<div class="row" style="text-align:center;">
			<div class="col-sm-4">
			<h1>
				<a style="text-decoration: none; color: black;" href="/mall/index.jsp">Goodee Shop</a>
			</h1>
			</div>
			<div class="col-sm-4">
				<h2>
				<a style="text-decoration: none; color: black;" href="<%=request.getContextPath() %>/orders/myOrdersList.jsp">주문 목록</a>
				</h2>
			</div>
			<!-- 마이페이지, 장바구니 -->
			  <div class="col-sm-4">
			  <a>	
			  <i class="fa fa-user-alt" style="font-size:36px"></i></a>		
			  &nbsp;&nbsp;&nbsp;
			  <a style= "color:black;" href="<%=request.getContextPath()%>/orders/myOrdersList.jsp">
			  <i class='fas fa-shopping-cart' style='font-size:36px'></i></a>
			  </div>
			</div>
		</div>
		<br>
	<table class="table table-hover">
		<thead>
			<tr>
				<td>orders_id</td>
				<td>product_name</td>
				<td>orders_amount</td>
				<td>orders_price</td>
				<td>member_name</td>
				<td>orders_addr</td>
				<td>orders_state</td>
				<td>orders_date</td>
			</tr>
		</thead>
		<tbody>
		<%
			for(OrdersAndProductAndMember o : list){
		%>
			<tr>
				<td><%=o.getOrders().getOrdersId() %></td>
				<td><%=o.getProduct().getProductName() %></td>
				<td><%=o.getOrders().getOrdersAmount() %></td>
				<td><%=o.getOrders().getOrdersPrice() %></td>
				<td><%=o.getMember().getMemberName() %></td>
				<td><%=o.getOrders().getOrdersAddr() %></td>
				<td><%=o.getOrders().getOrdersState() %></td>
				<td><%=o.getOrders().getOrdersDate() %></td>
			</tr>
		<%	
			}
		%>
		</tbody>
	</table>
</div>
</body>
</html>