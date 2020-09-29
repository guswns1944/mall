package dao;
import vo.Notice;
import java.util.*;
import commons.DBUtil;
import java.sql.*;
public class NoticeDao {
	// 공지사항 목록
	public ArrayList<Notice> selectNoticeList(int currentPage, int rowPerPage) throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title from notice order by notice_date desc limit ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, (currentPage-1)*10);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			list.add(n);
		}
		conn.close();
		return list;
		}
	//메인에 보여줄 공지사항 최신 2개
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title from notice order by notice_date desc limit 0,2";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			list.add(n);
		}
		conn.close();
		return list;
	}
	// 공지사항 세부내용
	public Notice selectNoticeOne(int noticeId) throws Exception{
		Notice n = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_title, notice_content, notice_date from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			n = new Notice();
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getNString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
		}
		conn.close();
		return n;
	}
	//페이징을 위한 전체 count
		public int count() throws Exception{
			String sql = "select count(*) as cnt from notice";
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
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
