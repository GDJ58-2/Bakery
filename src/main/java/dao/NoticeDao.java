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
	public HashMap<String, Object> selectNoticeOne(Connection conn, int rownum, String search) throws Exception { 
		HashMap<String, Object> map = null;
		String sql = "SELECT rownum, notice_code noticeCode, notice_title noticeTitle, notice_content noticeContent, emp_id empId, createdate"
				+ "		FROM (SELECT ROW_NUMBER() over(ORDER BY notice_code asc) rownum , notice_code, notice_title, notice_content, emp_id, createdate"
				+ "				FROM (SELECT notice_code, notice_title, notice_content, emp_id, createdate"
				+ "						FROM notice"
				+ "						WHERE notice_title LIKE ?) t) t2"
				+ "	   WHERE t2.rownum = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		stmt.setInt(2, rownum);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			map = new HashMap<String, Object>();
			map.put("rownum", rs.getInt("rownum"));
			map.put("noticeCode", rs.getInt("noticeCode"));
			map.put("noticeTitle", rs.getString("noticeTitle"));
			map.put("noticeContent", rs.getString("noticeContent"));
			map.put("empId", rs.getString("empId"));
			map.put("createdate", rs.getString("createdate"));
		}
		DBUtil.close(rs, stmt, null);
		return map;
	}
	
	// list 
	public ArrayList<HashMap<String, Object>> selectNoticeList(Connection conn, String search, int beginRow, int rowPerPage) throws Exception { 
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT ROW_NUMBER() over(ORDER BY notice_code asc) rownum, notice_code noticeCode, notice_title noticeTitle, notice_content noticeContent, emp_id empId, DATE_FORMAT(createdate, '%Y-%m-%d') createdate "
				+ "		FROM notice "
				+ 	  "WHERE notice_title LIKE ?"
				+ " ORDER BY rownum desc"
				+ "	   LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map= new HashMap<String, Object>();
			map.put("rownum", rs.getInt("rownum"));
			map.put("noticeCode", rs.getInt("noticeCode"));
			map.put("noticeTitle", rs.getString("noticeTitle"));
			map.put("noticeContent", rs.getString("noticeContent"));
			map.put("empId", rs.getString("empId"));
			map.put("createdate", rs.getString("createdate"));			
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 페이징 - 전체 행 수 
	public int selectNoticeCount(Connection conn, String search) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(*) count FROM notice WHERE notice_title LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		DBUtil.close(rs, stmt, null);
		return count;
	}
}
