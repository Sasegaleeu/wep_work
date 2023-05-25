package test.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.guest.dto.GuestDto;
import test.util.DbcpBean;

public class GuestDao {
	
	private static GuestDao dao;
	
	private GuestDao() {}
	
	public static GuestDao getInstance() {
		if(dao==null){
		dao=new GuestDao();
		
	}
	return dao;
	}
	
	public List<GuestDto> getList(){
		List<GuestDto> list=new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql 문 
			String sql = "SELECT num, writer, content, regdate"
					+ " FROM board_guest"
					+ " ORDER BY num ASC";
			
			pstmt = conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 완성

			//select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				//ResultSet 에 cursor 가 위치 한곳의 칼럼 정보를 얻어와서 MemberDto 객체에 담고
				GuestDto dto=new GuestDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));

			
				//ArrayList 객체에 누적 시키기
				list.add(dto);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 이 Connection Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		//회원목록이 담긴 ArrayList 객체 리턴해 주기 
		return list;
	}
	
	public boolean insert(GuestDto dto) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int rowCount = 0;
	    try {
	        conn = new DbcpBean().getConn();
	        String sql = "INSERT INTO board_guest (num, writer, content, pwd, regdate)"
	                + " VALUES (board_guest_seq.NEXTVAL, ?, ?, ?, SYSDATE)";

	        pstmt = conn.prepareStatement(sql);
	        // 실행할 SQL 문이 미완성이라면 여기서 완성
	        pstmt.setString(1, dto.getWriter());
	        pstmt.setString(2, dto.getContent());
	        pstmt.setString(3, dto.getPwd());

	        // SQL 문을 수행하고 변화된(추가, 수정, 삭제된) row의 개수 리턴 받기
	        rowCount = pstmt.executeUpdate();

	    } catch (SQLException se) {
	        se.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null)
	                pstmt.close();
	            if (conn != null)
	                conn.close();
	        } catch (Exception e) {
	        }
	    }
	    // 만일 변화된 row의 개수가 0보다 크면 작업 성공
	    return rowCount > 0;
	}
	
	public boolean delete(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rowCount = 0;

        try {
            conn = new DbcpBean().getConn();
            String sql = "DELETE FROM board_guest WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rowCount = pstmt.executeUpdate();
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            //...
        }

        return rowCount > 0;
    }
	

	public GuestDto getData(int num) {
        GuestDto dto = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = new DbcpBean().getConn();
            String sql = "SELECT num, writer, content, pwd, regdate" 
                    + " FROM board_guest" 
                    + " WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new GuestDto();
                dto.setNum(num);
                dto.setWriter(rs.getString("writer"));
                dto.setContent(rs.getString("content"));
                dto.setPwd(rs.getString("pwd"));
                dto.setRegdate(rs.getString("regdate"));
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            //...
        }

        return dto;
    }
	
	
	public boolean update(GuestDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE board_guest"
					+" SET writer=?, content=?"
					+" WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount=pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if(rowCount>0) {
			return true;
		}else {
			return false;
		}
	}
	
}



