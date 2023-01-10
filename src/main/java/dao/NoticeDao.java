package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;
import vo.Notice;

public class NoticeDao {
	public int insertNotice(Connection conn, Notice notice) throws Exception { // addNotice
		int row = 0;
		String sql = "INSERT INTO notice(notice_title, notice_content, emp_id, createdate) VALUES(?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setString(3, notice.getEmpId());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int updateNotice(Connection conn, Notice notice) throws Exception { // modifyNotice
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
	public int deleteNotice(Connection conn, int noticeCode) throws Exception { // removeNotice
		int row = 0;
		String sql = "DELETE FROM notice WHERE notice_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public Notice selectNoticeOne(Connection conn, int noticeCode) throws Exception { // modifyNotice Form
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
	public ArrayList<Notice> selectNoticeList(Connection conn, String search, int beginRow, int rowPerPage) throws Exception { // noticeList
		ArrayList<Notice> list = new ArrayList<Notice>();
		String sql = "SELECT notice_code noticeCode, notice_title noticeTitle, notice_content noticeContent, emp_id empId, createdate FROM notice WHERE notice_title LIKE ? ORDER BY createdate DESC LIMIT ?,?";
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
}
