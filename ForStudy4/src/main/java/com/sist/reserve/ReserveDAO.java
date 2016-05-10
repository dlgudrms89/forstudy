package com.sist.reserve;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;

public class ReserveDAO {
	private static SqlSessionFactory ssf;
	static{
		try{
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public static void reserveInsert(AcreserveVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("reserveInsert",vo);
		session.close();
	}
	public static List<AcreserveVO> reserveAdminAllData()
	{
		SqlSession session=ssf.openSession();
		List<AcreserveVO> list=session.selectList("reserveAdminAllData");
		session.close();
		return list;
	}
	public static List<AcreserveVO> reserveUserAllData(String id)
	{
		SqlSession session=ssf.openSession();
		List<AcreserveVO> list=session.selectList("reserveUserAllData",id);
		session.close();
		return list;
	}
	public static void reserveCheckUpdate(int no)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("reserveCheckUpdate",no);
		session.close();
	}
}
