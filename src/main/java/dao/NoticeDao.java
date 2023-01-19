package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.Notice;

public class NoticeDao {
	// insert
	public HashMap<String, Object> insertNotice(Connection conn, Notice notice) throws Exception { 
		HashMap<String, Object> map = new HashMap<String, Object>();
		int noticeCode = 0;
		int row = 0;
		String sql = "INSERT INTO notice(notice_title, notice_content, emp_id, createdate) VALUES(?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); // Statement.RETURN_GENERATED_KEYS : DB상에 AUTO_INCREMENT로 인해 자동으로 생성되어진 key(=id)를 가져오는 쿼리
		stmt.setString(1,notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setString(3, notice.getEmpId());
		row = stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			noticeCode = rs.getInt(1);
		}
		map.put("row", row);
		map.put("noticeCode", noticeCode);
		DBUtil.close(rs, stmt, null);
		return map;
	}
	
	// update
	public int updateNotice(Connection conn, Notice notice) throws Exception { 
		int row = 0;
		String sql = "UPDATE notice SET notice_title=?, notice_content=? WHERE notice_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setInt(3, notice.getNoticeCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// delete
	public int deleteNotice(Connection conn, int noticeCode) throws Exception { 
		int row = 0;
		String sql = "DELETE FROM notice WHERE notice_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 상세보기
	public Notice selectNoticeOne(Connection conn, int noticeCode) throws Exception { 
		Notice notice = null;
		String sql = "SELECT notice_code noticeCode, notice_title noticeTitle, notice_content noticeContent, emp_id empId, createdate FROM notice WHERE notice_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			notice = new Notice(rs.getInt("noticeCode"),rs.getString("noticeTitle"),rs.getString("noticeContent"),rs.getString("empId"),rs.getString("createdate"));
		}
		DBUtil.close(rs, stmt, null);
		return notice;
	}
	
	// list 
	public ArrayList<Notice> selectNoticeList(Connection conn, String search, int beginRow, int rowPerPage) throws Exception { 
		ArrayList<Notice> list = new ArrayList<Notice>();
		String sql = "SELECT notice_code noticeCode, notice_title noticeTitle, notice_content noticeContent, emp_id empId, DATE_FORMAT(createdate, '%Y-%m-%d') createdate FROM notice WHERE notice_title LIKE ? ORDER BY createdate DESC LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice notice = new Notice(rs.getInt("noticeCode"),rs.getString("noticeTitle"),rs.getString("noticeContent"),rs.getString("empId"),rs.getString("createdate"));
			list.add(notice);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 페이징 - 전체 행 수 
	public int selectNoticeCount(Connection conn) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(*) count FROM notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		DBUtil.close(rs, stmt, null);
		return count;
	}
}
