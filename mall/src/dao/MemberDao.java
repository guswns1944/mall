package dao;
import java.sql.*;
import vo.*;
import commons.*;
public class MemberDao {
	//로그인 
	public String login(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String m = null;
		String sql = "select member_email, member_name from member where member_email = ? and member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { 
			//결과가 있다면 로그인 성공
			m = rs.getNString("member_email");
		}
		conn.close();
		return m;
	}
	//회원가입
	public void insertMember(Member member) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into member(member_email, member_pw, member_name, member_date) values (?,?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.executeUpdate();
		conn.close();
	}
	// 중복 회원가입 확인
	public Member selectMemberEmailCk(String memberEmail) throws Exception {
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select id from (select member_email id from member union select admin_id id from admin) t where id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			// 값이 들어오면 이미 가입된 아이디
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		conn.close();
		return member;
	}
}
