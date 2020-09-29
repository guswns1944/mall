package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Product;

public class ProductDao {
	public Product selectProductOne(int productId) throws Exception {
		Product product = null;
		String sql = "select product_id, product_pic, product_content, product_name, product_price, product_soldout from product where product_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductPic(rs.getString("product_pic"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
		}
		conn.close();
		return product;
	}
	//상품 목록 
	public ArrayList<Product> selectProductList() throws Exception {
		ArrayList<Product> list = new ArrayList<Product>();
		String sql = "select product_id, product_pic, product_name, product_price, product_soldout from product limit 0,6";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
}
