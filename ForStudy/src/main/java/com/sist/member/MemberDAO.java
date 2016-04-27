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
	
	// ����Ŀ� ��ȯ(����)
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
			//id ���翩�� Ȯ��
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
				sql="SELECT pwd, nick FROM for_member WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String db_nick=rs.getString(2);
				rs.close();
				ps.close();
				//password �˻�
				if(pwd.equals(db_pwd))
				{
					 // Login
					   result=db_nick;
					 
				}
				else
				{
					//password�� �ٸ���
					result="NOPWD";
				}
			}
			
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			
		}
		finally
		{
			disConnection();
		}
		return result;
	}
	//ID�ߺ�üũ
	public int idCheck(String id)
	{
		int count=0;
		try{
			getConnection(); // �̹� ������ Connection��ü ���
			String sql="SELECT COUNT(*) FROM for_member WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			
		
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
	
		return count;
		
	}
	//NICK �ߺ�üũ
		public int nickCheck(String nick)
		{
			int count=0;
			try{
				getConnection(); // �̹� ������ Connection��ü ���
				String sql="SELECT COUNT(*) FROM for_member WHERE nick=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, nick);
				ResultSet rs=ps.executeQuery();
				rs.next();
				count=rs.getInt(1);
				rs.close();
				
			
			}catch(Exception ex){
				System.out.println(ex.getMessage());
			}finally{
				disConnection();
			}
		
			return count;
			
		}
	
	public void memberJoin(MemberDTO d)
	{
		try{
			getConnection(); 
			String sql="INSERT INTO FOR_MEMBER(id, pwd, nick, email, m_agree) VALUES (?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, d.getId());
			ps.setString(2, d.getPwd());
			ps.setString(3, d.getNick());
			ps.setString(4, d.getEmail());
			ps.setInt(5, d.getM_agree());
			ps.executeUpdate();
		
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
	
	}
	
	
	 public MemberDTO getUser(String id){
		   MemberDTO d = new MemberDTO();
		   
		   try {
		     getConnection();
		     String sql = "select * from for_member where id = ?";
		     ps = conn.prepareStatement(sql);
		     ps.setString(1, id);
		     ResultSet rs = ps.executeQuery();
		     
		     rs.next();	     
		     d.setId(rs.getString(1));
		     d.setPwd(rs.getString(2));
		     d.setNick(rs.getString(3));
		     d.setEmail(rs.getString(4));
		     d.setM_agree(rs.getInt(5));
		     rs.close();
		  } catch (Exception ex) {
		     System.out.println("memebrJoin : "+ex.getMessage());
		  } finally {
		     disConnection();
		  }
		   
		   return d;
	   }
	   
	  
}




















