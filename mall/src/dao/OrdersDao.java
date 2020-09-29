package dao;
import vo.Orders;
import vo.OrdersAndProductAndMember;
import vo.Product;
import vo.Member;
import commons.DBUtil;
import java.sql.*;
import java.util.ArrayList;
public class OrdersDao {
	//주문자의 목록을 보여주는 쿼리
	public ArrayList<OrdersAndProductAndMember> selectOrdersList(String memberEmail) throws Exception {
		ArrayList<OrdersAndProductAndMember> list = new ArrayList<OrdersAndProductAndMember>();
		String sql = "select o.orders_id, p.product_name, o.orders_amount, o.orders_price, m.member_name, o.orders_addr, o.orders_state, o.orders_date "
				+ "from orders o, member m, product p where o.member_email=m.member_email AND o.product_id=p.product_id AND m.member_email= ?"; 
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,memberEmail);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			OrdersAndProductAndMember oap = new OrdersAndProductAndMember();
			oap.setOrders(new Orders());
			oap.setProduct(new Product());
			oap.setMember(new Member());
			oap.getOrders().setOrdersId(rs.getInt("orders_id"));
			oap.getProduct().setProductName(rs.getString("product_name"));
			oap.getOrders().setOrdersAmount(rs.getInt("orders_amount"));
			oap.getOrders().setOrdersPrice(rs.getInt("orders_price"));
			oap.getMember().setMemberName(rs.getString("member_name"));
			oap.getOrders().setOrdersAddr(rs.getString("orders_addr"));
			oap.getOrders().setOrdersState(rs.getString("orders_state"));
			oap.getOrders().setOrdersDate(rs.getString("orders_date"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
	//주문 추가
	public void insertOrders(Orders orders) throws Exception {
		String sql= "insert into orders(product_id, orders_amount, orders_price, member_email, orders_addr, orders_state, orders_date) values (?,?,?,?,?,'결제완료',now())";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2, orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMemberEmail());
		stmt.setString(5, orders.getOrdersAddr());
		stmt.executeUpdate();
		conn.close();
		
	}
}
