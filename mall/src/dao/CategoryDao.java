package dao;
import java.util.*;

import commons.DBUtil;
import vo.Category;
import java.sql.*;
public class CategoryDao {
	
	//category를 검색하는 코드
	public ArrayList<Category> selectCategoryList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		String sql = "select category_id, category_name from category";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getNString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	// 추천 Category 목록
	public ArrayList<Category> selectCategoryCkList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		String sql = "select category_id, category_pic from category where category_ck = 'Y' limit 0,4";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryPic(rs.getNString("category_pic"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	//페이징을 위한 전체 count
	public int count(int categoryId) throws Exception{
		String sql = "select count(*) as cnt from product where category_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,categoryId);
		ResultSet rs = stmt.executeQuery();
		//게시글 수 구하기
		int count = 0;
		if(rs.next()) {
			count=rs.getInt("cnt");
		}
		conn.close();
		return count;
	}
}
