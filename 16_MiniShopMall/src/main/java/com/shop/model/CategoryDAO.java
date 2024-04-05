package com.shop.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CategoryDAO {

	// DB와 연동하는 객체.
	Connection con = null;
	
	// DB에 SQL문을 전송하는 객체.
	PreparedStatement pstmt = null;
	
	// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
	ResultSet rs, rs1 = null;
	
	// 쿼리문을 저장할 변수
	String sql = null;
	
	
	// CategoryDAO 클래스를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로
	//        기본생성자의 접근제어자를 public 이 아니라
	//        private 으로 바꾸어 주어야 한다.
	//        즉, 외부에서는 직접적으로 기본생성자를 호출하지
	//        못하게 하는 방식이다.
	
	// 2단계 : CategoryDAO 클래스를 정적(static) 멤버로 
	//        선언을 해 주어야 한다.
	private static CategoryDAO instance;
	
	private CategoryDAO() {  }  // 기본 생성자
	
	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는
	//        getInstance() 메서드를 만들어서 해당 
	//        getInstance() 메서드를 외부에서 접근할 수 있도록
	//        해 주면 됨.
	public static CategoryDAO getInstance() {
		
		if(instance == null) {
			instance = new CategoryDAO();
		}
		
		return instance;
	}  // getInstance() 메서드 end
	
	
	// DB를 연동하는 작업을 진행하는 메서드.
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			// 자바의 네이밍 서비스(JNDI)애서 이름과 실제 객체를
			// 연결해 주는 개념이 Context 객체이며, InitialContext
			// 객체는 네이밍 서비스를 이용하기 위한 시작점이 됨.
			Context initCtx = new InitialContext();
			
			// 2단계 : Context 객체를 얻어와야 함.
			// "java:comp/env" 라는 이름의 인수로 Context 객체를
			// 얻어옴. "java:comp/env"는 현재 웹 애플리케이션에서
			// 네이밍 서비스를 이용 시 루트 디렉토리라고 생각하면 됨.
			// 즉, 현재 웹 애플리케이션이 사용할 수 있는 모든 자원은
			// "java:comp/env" 아래에 위치를 하게 됨.
			Context ctx = 
				(Context)initCtx.lookup("java:comp/env");
			
			// 3단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을
			//        찾게 됨.
			// "java:comp/env" 아래에 위치한 "jdbc/myoracle"
			// 자원을 얻어옴, 이자원이 바로 데이터소스(커넥션풀)임.
			// 여기서 "jdbc/myoracle" 은 context.xml 파일에
			// 추가했던 <Resource> 태그 안에 있던 name 속성의 값임.
			DataSource ds = 
					(DataSource)ctx.lookup("jdbc/myoracle");
			
			// 4단계 : DataSource 객체를 이용하여 커넥션을
			//        하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}  // openConn() 메서드 end
		
	
	// DB에 연결되어 있던 자원 종료하는 메서드.
	public void closeConn(ResultSet rs,
			PreparedStatement pstmt, Connection con) {
		
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}  // closeConn() 메서드 end
	
	
	// DB에 연결되어 있던 자원 종료하는 메서드.
	public void closeConn(
			PreparedStatement pstmt, Connection con) {
		
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}  // closeConn() 메서드 end
	
	
	// 카테고리 테이블에 카테고리를 추가해 주는 메서드.
	public int insertCategory(CategoryDTO dto) {
		
		int result = 0, count = 0;
		
		
		try {
			openConn();
			
			sql = "select max(category_num) "
					+ " from shop_category";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into shop_category "
					+ " values(?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getCategory_code());
			pstmt.setString(3, dto.getCategory_name());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // insertCategory() 메서드 end
	
	
	// shop_category 테이블에 있는  카테고리 전체 목록을 조회하는 메서드.
	public List<CategoryDTO> getCategoryList() {
		
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		
		try {
			openConn();
			
			sql = "select * from shop_category "
					+ " order by category_num desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CategoryDTO dto = new CategoryDTO();
				
				dto.setCategory_num(rs.getInt("category_num"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}  // getCategoryList() 메서드 end
	
	
	
	
	
	
}
