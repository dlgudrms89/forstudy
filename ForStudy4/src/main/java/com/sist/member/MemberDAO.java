package com.sist.member;

import java.sql.*;
import java.util.*;
import javax.sql.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String url="jdbc:oracle:thin:@211.238.142.40:1521:ORCL";
	private static MemberDAO dao;
	
	
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public static MemberDAO newInstance(){
		
		if(dao==null){
			dao=new MemberDAO();
	}
		return dao;
}
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,"scott","tiger");
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	// 사용후에 반환(재사용)
	public void disConnection(){
		try{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex){}
	}
	

	//LOGIN
	public String isLogin(String id, String pwd)
	{
		String result="";
		try
		{
			getConnection();
			//id 존재여부 확인
			String sql="SELECT COUNT(*) FROM for_member WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			ps.close();
		
			if(count==0)
			{
				result="NOID";
			}
			else
			{
				sql="SELECT pwd, name FROM for_member WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String db_name=rs.getString(2);
				rs.close();
				//password 검색
				if(pwd.equals(pwd))
				{
					//login
					result=id;
				}
				else
				{
					//password가 다르다
					result="NOPWD";
				}
			}
			
		}
		catch(Exception ex){
			System.out.println("로그인오류:"+ex.getMessage());
			
		}
		finally
		{
			disConnection();
		}
		return result;
	}
	//ID중복체크
	public int idCheck(String id)
	{
		int count=0;
		try{
			getConnection(); // 이미 생성된 Connection객체 얻기
			String sql="SELECT COUNT(*) FROM for_member WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			
		
		}catch(Exception ex){
			System.out.println("id중복체크:"+ex.getMessage());
		}finally{
			disConnection();
		}
	
		return count;
		
	}
	//NICK 중복체크
		public int nickCheck(String nick)
		{
			int count=0;
			try{
				getConnection(); // 이미 생성된 Connection객체 얻기
				String sql="SELECT COUNT(*) FROM for_member WHERE nick=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, nick);
				ResultSet rs=ps.executeQuery();
				rs.next();
				count=rs.getInt(1);
				rs.close();
				
			
			}catch(Exception ex){
				System.out.println("닉네임중복체크:"+ex.getMessage());
			}finally{
				disConnection();
			}
		
			return count;
			
		}
	
	public void memberJoin(MemberDTO d)
	{
		try{
			getConnection(); 
			String sql="INSERT INTO FOR_MEMBER(id, pwd, nick, email, m_agree) VALUES (?,?,?,?,1) ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, d.getId());
			ps.setString(2, d.getPwd());
			ps.setString(3, d.getNick());
			ps.setString(4, d.getEmail());
			ps.executeUpdate();
			
		
		}catch(Exception ex){
			System.out.println("회원가입오류:"+ex.getMessage());
		}finally{
			disConnection();
		}
	
	}
	
	
	 public MemberDTO getUser(String id){
		   MemberDTO d = new MemberDTO();
		   
		   try {
		     getConnection();
		     String sql = "select id,pwd,birth,gender,addr,phone,nick,email,m_agree,admin from for_member where id = ?";
		     ps = conn.prepareStatement(sql);
		     ps.setString(1, id);
		     ResultSet rs = ps.executeQuery();
		     while(rs.next()){
			     d.setId(rs.getString(1));
			     d.setPwd(rs.getString(2));
			     d.setBirth(rs.getDate(3));
			     d.setGender(rs.getString(4));
			     d.setAddr(rs.getString(5));
			     d.setPhone(rs.getString(6));
			     d.setNick(rs.getString(7));
			     d.setEmail(rs.getString(8));
			     d.setM_agree(rs.getInt(9));
			     d.setAdmin(rs.getInt(10));
		     }
		     rs.close();
		  } catch (Exception ex) {
		     System.out.println("memebrJoin : "+ex.getMessage());
		  } finally {
		     disConnection();
		  }
		   
		   return d;
	   }
	   
	  public void memberChange(String id,String pwd,String gender,
			  					String email,String phone,String addr){
		  try{
			  getConnection();
			  String sql="UPDATE for_member SET pwd = ?, gender=? "
			  		+ ",email=?,phone=?,addr=? "
			  		+ "WHERE id=? ";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, pwd);
			  ps.setString(2, gender);
			  ps.setString(3, email);
			  ps.setString(4, phone);
			  ps.setString(5, addr);
			  ps.setString(6, id);
			  ps.executeUpdate();
		  }catch(Exception ex){
			  System.out.println("memberChange:"+ex.getMessage());
		  }finally{
			  disConnection();
		  }
	  }
}




















