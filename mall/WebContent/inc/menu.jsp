<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top: 30px;"></div>
		<div> <!-- 최상단 검색 바 
					홈페이지 로고-->	
			<div class="row" style="text-align:center;">
			 <div class="col-sm-4">
			<h1>
				<a style="text-decoration: none; color: black;" href="/mall/index.jsp">Goodee Shop</a>
			</h1>
			</div>
		<div class="col-sm-6">
			<!-- 상품 검색 -->
			<form method = "post" action="<%=request.getContextPath()%>/product/searchProduct.jsp">
				<table>
					<tr>
						<td width="500px">
							<input type="text" class="form-control col-sm-15" name="search" placeholder="상품 검색">
						</td>
						<td width="100px">
							<button type="submit" class="btn btn-dark">검색</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
			<!-- 마이페이지, 장바구니 -->
			  <div class="col-sm-2" style="text-align: center;">
			  <a style= "color:black;" href="<%=request.getContextPath()%>/orders/myOrdersList.jsp">	
			  <i class="fa fa-user-alt" style="font-size:36px"></i></a>		 
			  </div>
		</div>
		</div>
</body>
</html>