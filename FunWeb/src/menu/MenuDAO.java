package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.crypto.provider.RSACipher;

import board.BoardBean;

public class MenuDAO {

public Connection getDB() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
		Connection con = ds.getConnection();
		return con;
		
	}
public MenuBean getMenu(int ranNum) {
	MenuBean mb = new MenuBean();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = getDB();
		
		String sql = "select * from menu where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, ranNum);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			mb.setFile(rs.getString("file"));
			mb.setName(rs.getString("name"));
			mb.setNum(rs.getInt("num"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) try {rs.close();} catch (SQLException e2) {}
		if(pstmt!=null) try {pstmt.close();} catch (SQLException e2) {}
		if(con!=null) try {con.close();} catch (SQLException e2) {}
	}
	return mb;
	}

public int getBoardCount() {
	Connection con = null;
	PreparedStatement prst = null;
	ResultSet rs = null;
	int count = 0;
	try {
		con = getDB();
		
		String sql = "select count(*) from menu";
		prst = con.prepareStatement(sql);
		rs=prst.executeQuery();
		
		if(rs.next()) {
			count = rs.getInt("count(*)");
		}
				
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(con!=null) try {con.close();} catch(SQLException ex) {}
	}
	return count;
}

public List boardList(int startRow, int pageSize) {
	
	List boardList = new ArrayList();
	Connection con = null;
	PreparedStatement prst = null;
	ResultSet rs = null;
	try {
		con = getDB();
		
		String sql = "select * from menu order by num desc limit ?,?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, startRow-1);
		prst.setInt(2, pageSize);
		rs = prst.executeQuery();
		
		while(rs.next()) {
			MenuBean bb = new MenuBean();
			bb.setNum(rs.getInt("num"));
			bb.setName(rs.getString("name"));
			bb.setFile(rs.getString("file"));
			
			boardList.add(bb);
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (con!=null) try {con.close();} catch (SQLException ex){}
		if (prst!=null) try {prst.close();} catch (SQLException ex) {}
		if (rs!=null) try {rs.close();} catch (SQLException ex) {}
	}
	return boardList;
}

public void plusRead(int num) {
	Connection con = null;
	PreparedStatement prst = null;
	
	try {
		con = getDB();
		
		String sql = "update menu set readcount=readcount+1 where num=?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, num);
		prst.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if (con!=null) try {con.close();} catch (SQLException ex){}
		if (prst!=null) try {prst.close();} catch (SQLException ex) {}
	}
}

public MenuBean contentBoard(int num) {
	Connection con = null;
	PreparedStatement prst = null;
	ResultSet rs = null;
	MenuBean mb = new MenuBean();
	try {
		con = getDB();
		
		String sql = "select * from menu where num=?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, num);
		rs = prst.executeQuery();
		
		if(rs.next()) {
			mb.setNum(rs.getInt("num"));
			mb.setName(rs.getString("name"));
			mb.setReadcount(rs.getInt("readcount"));
			mb.setFile(rs.getString("file"));
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if (con!=null) try {con.close();} catch (SQLException ex){}
		if (prst!=null) try {prst.close();} catch (SQLException ex) {}
		if (rs!=null) try {rs.close();} catch (SQLException ex) {}
	}
	return mb;
}
}
