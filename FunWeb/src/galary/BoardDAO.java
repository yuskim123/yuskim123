package galary;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import galary.BoardBean;
import member.MemberBean;

public class BoardDAO {
	
	//디비연결 메서드 
	public Connection getConnection() throws Exception{
//		//1단계 드라이버 로더
//		Class.forName("com.mysql.jdbc.Driver");
//		//2단계 디비연결
//		String dbUrl="jdbc:mysql://localhost:3306/jspdb5";
//		 String dbUser="jspid";
//		 String dbPass="jsppass";
//		 Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//		return con;
		
		//context.xml 불러오기 위한 자바파일 객체생성 
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB"); //위치/이름
		Connection con=ds.getConnection();
		return con;
	}
	// insertBoard(bb) 메서드
	public void insertBoard(BoardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		try {
			//1단계 드라이버 로더			//2단계 디비연결
			con=getConnection();
			 //3단계 sql
			 String sql="select max(num) from galary";
			 pstmt=con.prepareStatement(sql);
			 //4단계 
			 rs=pstmt.executeQuery();
			 //5단계
			 if(rs.next()) {
				 num=rs.getInt("max(num)")+1;
			 }
			//3단계 sql (insert) now()
			 sql="insert into galary(num,name,pass,subject,content,readcount,date,file) values(?,?,?,?,?,?,now(),?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, num); //첫번째 물음표,값
			 pstmt.setString(2, bb.getName());//두번째물음표,값
			 pstmt.setString(3, bb.getPass());//세번째물음표,값
			 pstmt.setString(4, bb.getSubject());
			 pstmt.setString(5, bb.getContent());
			 pstmt.setInt(6, 0); //readcount
			 pstmt.setString(7, bb.getFile());
			//4단계 실행
			 pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리작업 // 기억장소  con pstmt  rs 정리
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
	}
public List boardList(int startRow, int pageSize) {
		
		List boardList = new ArrayList();
		Connection con = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			String sql = "select * from galary order by re_ref desc, re_seq asc limit ?,?";
			prst = con.prepareStatement(sql);
			prst.setInt(1, startRow-1);
			prst.setInt(2, pageSize);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getDate("date"));
				bb.setSubject(rs.getString("subject"));
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
	//getBoardList()
	public List getBoardList(int startRow,int pageSize) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List boardList=new ArrayList();
		try {
			//1단계 드라이버 로더			//2단계 디비연결
			con=getConnection();
			 // 3단계 sql(select) 만들고 실행할 객체 생성
//			 String sql="select * from board order by num desc";
			String sql="select * from galary order by num desc limit ?,?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, startRow-1);
			 pstmt.setInt(2, pageSize);
			 // 4단계 : 결과저장 <= sql  구문 실행 select
			 rs=pstmt.executeQuery();
			 // 5단계  rs -> 첫행이동 => 한개의 글 정보를 저장할 공간 
		 // BoardBean mb 객체생성  id변수 에 rs에서 가져온 id열 데이터저장 
			// boardList 한칸에 한사람의 정보를 저장
			 while(rs.next()) {
				 // 한개의 글 정보를 저장할 객체생성
				 BoardBean bb=new BoardBean();
				 // 한개의 글 객체생성한 기억장소에 저장
				 bb.setNum(rs.getInt("num"));
				 bb.setSubject(rs.getString("subject"));
				 bb.setName(rs.getString("name"));
				 bb.setDate(rs.getDate("date"));
				 bb.setReadcount(rs.getInt("readcount"));
				 bb.setFile(rs.getString("file"));
				 // 한개의 글 정보를 배열 한칸에 저장
				 boardList.add(bb);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return boardList;
	}
	
	//getBoard(num)
	public BoardBean getBoard(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardBean bb=null;
		try {
			//1단계 드라이버 로더			//2단계 디비연결
			con=getConnection();
			// 3단계 sql(select) 만들고 실행할 객체 생성
			String sql="select * from galary where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 : 결과저장 <= sql  구문 실행 select
			rs=pstmt.executeQuery();
			//5단계 : select 결과를 화면출력
			 // rs위치 다음행 이동
			if(rs.next()) {
				bb=new BoardBean();
				bb.setNum(rs.getInt("num"));
				 bb.setSubject(rs.getString("subject"));
				 bb.setName(rs.getString("name"));
				 bb.setDate(rs.getDate("date"));
				 bb.setReadcount(rs.getInt("readcount"));
				 bb.setContent(rs.getString("content"));
				 bb.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return bb;
	}
	
	//updateReadcount(num)
	public void updateReadcount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1단계 드라이버 로더			//2단계 디비연결
			con=getConnection();
			// 3단계 sql update   set  readcount=readcount+1
			String sql="update galary set readcount=readcount+1 where num=?";
	 		pstmt=con.prepareStatement(sql);
	 		pstmt.setInt(1, num);
			//4단계 실행
	 		pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
	}
	//numCheck(num,pass)
	public int numCheck(int num,String pass) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		// num 비밀번호 일치 1,비밀번호틀림 0, num없음 -1
		int check=-1;
		try {
			//1단계 드라이버 로더			//2단계 디비연결
			con=getConnection();
			// 3단계 sql(select 조건 id=?) 만들고 실행할 객체 생성
			String sql="select * from galary where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 : 결과저장 <= sql  구문 실행 select
			rs=pstmt.executeQuery();
			// 5단계 : select 결과를 비교 해서 일치여부 확인
			if(rs.next()){ //true이면 
				//다음행 이동시 데이터가 있으면, num가 있으면
				if(pass.equals(rs.getString("pass"))){
					// 비밀번호 일치하면  
					check=1;
				}else{
					// "비밀번호 틀림" 뒤로이동
					check=0;
				}
			}else{
				// "num없음"  뒤로이동
				check=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외발생 상관없이 처리되는 문장
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return check;
	}
	//updateBoard(bb)
	public void updateBoard(BoardBean bb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1단계 드라이버 로더			//2단계 디비연결
			con=getConnection();
			//3단계 sql update
			String sql="update galary set name=?,subject=?,content=?,file=? where num=?";
	 		pstmt=con.prepareStatement(sql);
	 		pstmt.setString(1, bb.getName());
	 		pstmt.setString(2, bb.getSubject());
	 		pstmt.setString(3, bb.getContent());
	 		pstmt.setString(4, bb.getFile());
	 		pstmt.setInt(5, bb.getNum());
	 		//4단계 실행
	 		pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리작업
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
	}
	//getBoardCount()
	public int getBoardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			//1,2 디비연결메서드 호출
			con=getConnection();
			//3 sql select 객체생성
			String sql="select count(*) from galary";
			pstmt=con.prepareStatement(sql);
			//4 rs = 실행
			rs=pstmt.executeQuery();
			//5  rs 첫행이동  count = rs count(*) 가져와서 저장
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return count;
	}
	public int getBoardCount(String search) {
		Connection con = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			
			String sql = "select count(*) from galary where subject like ?";
			prst = con.prepareStatement(sql);
			prst.setString(1, "%"+search+"%");
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
public List boardList(int startRow, int pageSize, String search) {
		
		List boardList = new ArrayList();
		Connection con = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			String sql = "select * from galary where subject like ? order by num desc limit ?,?";
			prst = con.prepareStatement(sql);
			prst.setString(1, "%"+search+"%");
			prst.setInt(2, startRow-1);
			prst.setInt(3, pageSize);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setName(rs.getString("name"));
				bb.setDate(rs.getDate("date"));
				bb.setSubject(rs.getString("subject"));
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
public BoardBean contentBoard(int num) {
	Connection con = null;
	PreparedStatement prst = null;
	ResultSet rs = null;
	BoardBean bb = new BoardBean();
	try {
		con = getConnection();
		
		String sql = "select * from galary where num=?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, num);
		rs = prst.executeQuery();
		
		if(rs.next()) {
			bb.setNum(rs.getInt("num"));
			bb.setName(rs.getString("name"));
			bb.setPass(rs.getString("pass"));
			bb.setSubject(rs.getString("subject"));
			bb.setContent(rs.getString("content"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setDate(rs.getDate("date"));
			bb.setFile(rs.getString("file"));
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if (con!=null) try {con.close();} catch (SQLException ex){}
		if (prst!=null) try {prst.close();} catch (SQLException ex) {}
		if (rs!=null) try {rs.close();} catch (SQLException ex) {}
	}
	return bb;
}
public BoardBean updateForm(int num) {
	Connection con = null;
	PreparedStatement prst = null;
	ResultSet rs = null;
	BoardBean bb = new BoardBean();
	try {
		con = getConnection();
		
		String sql = "select * from galary where num=?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, num);
		rs = prst.executeQuery();
		
		if(rs.next()) {
			bb.setNum(rs.getInt("num"));
			bb.setName(rs.getString("name"));
			bb.setSubject(rs.getString("subject"));
			bb.setContent(rs.getString("content"));
			bb.setFile(rs.getString("file"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (con!=null) try {con.close();} catch (SQLException ex){}
		if (prst!=null) try {prst.close();} catch (SQLException ex) {}
		if (rs!=null) try {rs.close();} catch (SQLException ex) {}
	}
	return bb;
}
public int updatePro(BoardBean bb) {
	Connection con = null;
	PreparedStatement prst = null;
	PreparedStatement prst2 = null;
	ResultSet rs = null;
	int ch = 0;
	
	try {
		con = getConnection();
		
		String sql = "select * from galary where num=?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, bb.getNum());
		rs = prst.executeQuery();
		
		if(rs.next()) {//1 - 성공  2 -비번틀림 0 - 정보없음
			if(bb.getPass().equals(rs.getString("pass"))) {
				sql = "update galary set subject=?, file=?, content=? where num=?";
				prst2 = con.prepareStatement(sql);
				prst2.setString(1, bb.getSubject());
				prst2.setString(2, bb.getFile());
				prst2.setString(3, bb.getContent());
				prst2.setInt(4, bb.getNum());
				prst2.executeUpdate();
				
				ch=1;
			}else {
				ch=2;
			}
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (con!=null) try {con.close();} catch (SQLException ex){}
		if (prst!=null) try {prst.close();} catch (SQLException ex) {}
		if (prst2!=null) try {prst2.close();} catch (SQLException ex) {}
		if (rs!=null) try {rs.close();} catch (SQLException ex) {}
	}
	return ch;
}
public int deletePro(int num, String pass) {
	Connection con = null;
	PreparedStatement prst = null;
	PreparedStatement prst2 = null;
	ResultSet rs = null;
	int ch = 0;
	
	
	try {
		con = getConnection();
		
		String sql = "select pass from galary where num=?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, num);
		rs = prst.executeQuery();
		
		if(rs.next()) {
			if(rs.getString("pass").equals(pass)) {
				sql = "delete from galary where num=? and pass=?";
				prst2 = con.prepareStatement(sql);
				prst2.setInt(1, num);
				prst2.setString(2, pass);
				prst2.executeUpdate();
				ch = 1;
			}else {
				ch=2;
			}
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (con!=null) try {con.close();} catch (SQLException ex){}
		if (prst!=null) try {prst.close();} catch (SQLException ex) {}
		if (prst2!=null) try {prst2.close();} catch (SQLException ex) {}
		if (rs!=null) try {rs.close();} catch (SQLException ex) {}
	}
	return ch;
	
}
public void plusRead(int num) {
	Connection con = null;
	PreparedStatement prst = null;
	
	try {
		con = getConnection();
		
		String sql = "update galary set readcount=readcount+1 where num=?";
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
public int boardNum() {
	
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement prst = null;
	int plusNum = 0;
	try {
		con = getConnection();
		String sql = "select max(num) from galary";
		
		prst = con.prepareStatement(sql);
		rs = prst.executeQuery();
		
		if(rs.next()) {
			plusNum = (rs.getInt("max(num)"))+1;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) try {rs.close();} catch (SQLException ex) {}
		if(con!=null) try {con.close();} catch (SQLException ex) {}
		if(prst!=null) try {prst.close();} catch (SQLException ex) {}
		
		
	}
	return plusNum;
}
public List reboardList(int startRow, int pageSize) {
	
	List boardList = new ArrayList();
	Connection con = null;
	PreparedStatement prst = null;
	ResultSet rs = null;
	try {
		con = getConnection();
		
		String sql = "select * from galary order by re_ref desc, re_seq asc limit ?,?";
		prst = con.prepareStatement(sql);
		prst.setInt(1, startRow-1);
		prst.setInt(2, pageSize);
		rs = prst.executeQuery();
		
		while(rs.next()) {
			BoardBean bb = new BoardBean();
			bb.setNum(rs.getInt("num"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setName(rs.getString("name"));
			bb.setDate(rs.getDate("date"));
			bb.setSubject(rs.getString("subject"));
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
public void reinsertBoard(BoardBean bb) {
	
	Connection con = null;
	PreparedStatement prst = null;
	PreparedStatement prst2 = null;
	try {
		
		con = getConnection();
		
		String sql = "update galary set re_seq=re_seq+1 where re_ref=? and re_seq>?";
		prst = con.prepareStatement(sql);	
		prst.executeUpdate();
		
		sql = "insert into galary(num,name,pass,subject,content,readcount,date,file,re_ref,re_lev,re_seq) "
				+ "values(?,?,?,?,?,?,now(),?,?,?,?)";
		prst2 = con.prepareStatement(sql);
		prst2.setInt(1, boardNum());
		prst2.setString(2, bb.getName());
		prst2.setString(3, bb.getPass());
		prst2.setString(4, bb.getSubject());
		prst2.setString(5, bb.getContent());
		prst2.setInt(6, bb.getReadcount());
		prst2.setString(7, bb.getFile());
		
		prst2.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(prst!=null) try {prst.close();} catch (SQLException ex) {}
		if(con!=null) try {con.close();} catch (SQLException ex) {}
		if(prst2!=null) try {prst.close();} catch (SQLException ex) {}
	}
}
}//클래스
