package com.sist.dao;

import java.sql.*;
import java.util.*;

public class AcinfoDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   private final String URL = "jdbc:oracle:thin:@211.238.142.40:1521:ORCL";
   private static AcinfoDAO dao;

   public AcinfoDAO(){
      try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
      }catch(Exception ex){
         System.out.println("AcinfoDAO() 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 : "+ex.getMessage());
      }
   }

   public void getConnection(){
      try{
         conn = DriverManager.getConnection(URL, "scott", "tiger");
      }catch(Exception ex){
         System.out.println("getConntection() 占쏙옙占쏙옙 : "+ex.getMessage());
      }
   }

   public void disConnection(){
      try{
         if(ps != null) ps.close();
         if(conn != null) conn.close();
      }catch(Exception ex){
         System.out.println("disConnection() 占쏙옙占쏙옙 : "+ex.getMessage());
      }
   }

   public static AcinfoDAO newInstance(){
      if(dao == null)
         dao = new AcinfoDAO();
      return dao;
   }

   public List<AcinfoDTO> allData(){
      List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
      try {
         getConnection();
         String sql = "SELECT ac_no "
         				  + ",ac_name "
         				  + ",ac_address"
         				  + ",ac_class"
         				  + " FROM ac_info "
         				  + " WHERE ROWNUM<20";
         ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
         while(rs.next()){
            AcinfoDTO d = new AcinfoDTO();
            d.setAc_address(rs.getString(1));
            list.add(d);
         }
         rs.close();
      }catch(Exception ex){
         System.out.println("allData() 占쏙옙占쏙옙 : " + ex.getMessage());
      }finally{
         disConnection();
      }
      return list;
   }
   public List<AcinfoDTO> AcinfoSearch(String search){
		List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
		try{
			getConnection();
				System.out.println(search);
				search.trim();
				StringTokenizer st=new StringTokenizer(search);
				
				String data[]=new String[st.countTokens()];
				for(int i=0;i<data.length;i++){
					data[i]=st.nextToken();
					//System.out.println(data[i]);
				}
				
				//String search="AND ((ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%')
				String sql="SELECT distinct(ac_name),ac_address,ac_class,ac_tel FROM ac_info "
						+ "WHERE (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";
				
				
				int j=0;
				while(j<data.length-1){
					sql+="AND (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";
					j++;
				}
			
				ps=conn.prepareStatement(sql);
				for(int i=0;i<data.length*3;i++){
					ps.setString(i+1,"%"+data[i/3]+"%");
				}
				rs=ps.executeQuery();

				while (rs.next()) {
				AcinfoDTO d = new AcinfoDTO();
				d.setAc_name(rs.getString(1));
				d.setAc_address(rs.getString(2));
				d.setAc_class(rs.getString(3));
				d.setAc_tel(rs.getString(4));
				list.add(d);
			}
				
			rs.close();
			//System.out.println(search);
		}catch(Exception ex){System.out.println(ex.getMessage());}
		
		finally{
			disConnection();
		}
		return list;
   }
   public int AcinfoTotal(String search) {
		int total = 0;
		try {
			getConnection();
			search.trim();
			StringTokenizer st=new StringTokenizer(search);
			String data[]=new String[st.countTokens()];
			for(int i=0;i<data.length;i++){
				data[i]=st.nextToken();
			}
			String sql="SELECT CEIL(COUNT(*)/12) FROM "
					+ "(SELECT distinct ac_name,ac_address,ac_tel FROM "
					+ "(SELECT distinct ac_name,ac_address,ac_class,ac_tel,ac_no,rownum as num FROM "
					+ "(SELECT distinct ac_name,ac_address,ac_class,ac_tel,ac_no FROM ac_info "
					+ "WHERE (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";
			
			
			int j=0;
			while(j<data.length-1){
				sql+="AND (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";
				j++;
			}
				sql+="ORDER BY ac_no DESC )))";
			ps = conn.prepareStatement(sql);
			for(int i=0;i<data.length*3;i++){
				ps.setString(i+1,"%"+data[i/3]+"%");
			}
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println("BoardTotal占쌨소듸옙"+ex.getMessage());
		} finally {
			disConnection();
		}

		return total;

	}
   public List<AcinfoDTO> AcinfoSearchPage(String search,int page){
		List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
		try{
			getConnection();
				
				search.trim();
				int rowSize = 12;
				int start = (rowSize * page) - (rowSize - 1);
				int end = rowSize * page;
				
				StringTokenizer st=new StringTokenizer(search);
				
				String data[]=new String[st.countTokens()];
				for(int i=0;i<data.length;i++){
					data[i]=st.nextToken();
					//System.out.println(data[i]);
				}
				
				String sql="SELECT distinct ac_name,ac_address,ac_tel,num FROM "
				+ "(SELECT distinct ac_name,ac_address,ac_tel,rownum as num FROM "
				+"(SELECT distinct ac_name,ac_address,ac_tel FROM ac_info " 
				+"WHERE (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";
				
				/*SELECT distinct ac_name,ac_address,ac_tel,num FROM(
	SELECT distinct ac_name,ac_address,ac_tel,rownum as num FROM(SELECT distinct ac_name,ac_address,ac_tel FROM ac_info 
	WHERE (ac_address like '%占쏙옙占쏙옙%' OR ac_class LIKE '%占쏙옙占쏙옙%' OR ac_name LIKE '%占쏙옙占쏙옙%')
	)) WHERE num BETWEEN 1 AND 100 ORDER BY num ASC;*/
				
				//String search="AND ((ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%')
				/*String sql="SELECT distinct(ac_name),ac_address,ac_class,ac_tel FROM ac_info "
					+ "WHERE (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";*/
				
				
				int j=0;
				while(j<data.length-1){
					sql+="AND (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";
					j++;
				}
				
				sql+=")) WHERE num BETWEEN " +start+ " AND " +end+" ORDER BY num ASC";
			
				ps=conn.prepareStatement(sql);
				for(int i=0;i<data.length*3;i++){
					ps.setString(i+1,"%"+data[i/3]+"%");
				}
				rs=ps.executeQuery();
				
				while (rs.next()) {
						
						
						AcinfoDTO d = new AcinfoDTO();
						d.setAc_name(rs.getString(1));
						d.setAc_address(rs.getString(2));
//						d.setAc_class(rs.getString(3));
						d.setAc_tel(rs.getString(3));
						d.setAc_no(rs.getInt(4));
						list.add(d);
						
						
			}
				
			rs.close();
			//System.out.println(search);
			System.out.println(sql);
		}catch(Exception ex){
			System.out.println("search:"+ex.getMessage());
		}
		
		finally{
			disConnection();
		}
		return list;
  }
   /*
    * private int ac_no;
	private String ac_name;
	private String ac_address;
	private String ac_class;
	private String ac_tel;
	private String ac_field;
	private String ac_program;
	private int ac_inwon;
	private int ac_time;
	private int ac_totalval;
	private int ac_teacher;
    */
   public List<AcinfoDTO> AcDetail(String Ac_name){
	   List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
	   try{
		   getConnection();
		   String sql="SELECT ac_class,ac_inwon,ac_time,ac_totalval,ac_no "
		   		+ "FROM ac_info WHERE ac_name=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, Ac_name);
		   rs=ps.executeQuery();
		   while(rs.next()){
			   AcinfoDTO d= new AcinfoDTO();
			   d.setAc_class(rs.getString(1));
			   d.setAc_inwon(rs.getInt(2));
			   d.setAc_time(rs.getInt(3));
			   d.setAc_totalval(rs.getInt(4));
			   d.setAc_no(rs.getInt(5));
			   list.add(d);
			 
		   }
		   rs.close();
	   }catch(Exception ex){
		   System.out.println(ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   
	   return list;
   }
   
   public AcinfoDTO AcDetail2(int Ac_no){
	   AcinfoDTO d = new AcinfoDTO();
	   try{
		   getConnection();
		   String sql="SELECT ac_name,ac_field,ac_address,ac_tel,ac_program,ac_teacher "
		   		+ "FROM ac_info WHERE ac_no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, Ac_no);
		   rs=ps.executeQuery();
		   while(rs.next()){
			   d.setAc_name(rs.getString(1));
			   d.setAc_field(rs.getString(2));
			   d.setAc_address(rs.getString(3));
			   d.setAc_tel(rs.getString(4));
			   d.setAc_program(rs.getString(5));
			   d.setAc_teacher(rs.getInt(6));
			  
			   
		   }
		   rs.close();
	   }catch(Exception ex){
		   System.out.println(ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   
	   return d;
   }
   
   public int AcDetail3(String Ac_name){
	   int no = 0;
	   try{
		   getConnection();
		   String sql="SELECT ac_no "
		   		+ "FROM ac_info WHERE ac_name=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, Ac_name);
		   rs=ps.executeQuery();
		   rs.next();
		   no=rs.getInt(1);
			   
		   rs.close();
	   }catch(Exception ex){
		   System.out.println(ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   
	   return no;
   }
   
   public List<AcinfoDTO> cartCheckList(int[] no){
       List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
       try{
          getConnection();
          for(int i=0;i<no.length;i++){
             String sql = "SELECT ac_no, ac_name, ac_address, ac_tel, ac_class, ac_totalval, "
                   + "ac_inwon, ac_time, ac_field, ac_teacher, ac_reviewcnt "
                   + "FROM ac_info WHERE ac_no=?";
             ps = conn.prepareStatement(sql);
             ps.setInt(1, no[i]);
             rs = ps.executeQuery();
             rs.next();
             AcinfoDTO d = new AcinfoDTO();
             d.setAc_no(rs.getInt(1));
             d.setAc_name(rs.getString(2));
             d.setAc_address(rs.getString(3));
             d.setAc_tel(rs.getString(4));
             d.setAc_class(rs.getString(5));
             d.setAc_totalval(rs.getInt(6));
             d.setAc_inwon(rs.getInt(7));
             d.setAc_time(rs.getInt(8));
             d.setAc_field(rs.getString(9));
             d.setAc_teacher(rs.getInt(10));
             d.setAc_reviewcnt(rs.getInt(11));
             
             list.add(d);
             rs.close();
             ps.close();
          }
       }catch(Exception ex){
          System.out.println("cartCheckList() �뿉�윭 : "+ex.getMessage());
       }finally{
          disConnection();
       }
       return list;
    } 
   public int[] radarMax(int[] no){
       int[] maxVal = new int[5];
       try{
          
          getConnection();
      
          String noArr="";

          
              for(int i=0;i<no.length;i++){
                 if(i==no.length-1)
                    noArr += no[i]+"";
                 else
                 noArr += no[i]+",";
                 
              }
             String sql = "SELECT MAX(ac_totalval), MAX(ac_inwon), MAX(ac_time), MAX(ac_teacher), MAX(ac_reviewavg) "
                   + "FROM ac_info WHERE ac_no in ("+noArr+")";

             ps = conn.prepareStatement(sql);
             rs = ps.executeQuery();
             rs.next();
             for(int j=0; j<5; j++)
             {
                maxVal[j]=rs.getInt(j+1);
             }
             rs.close();
             ps.close();
          //maxVal[0] : 최대수강료
          //maxVal[1] : 최대정원
          //maxVal[2] : 최대시간
          //maxVal[3] : 최대강사수
          //maxVal[4] : 최대평점
       }catch(Exception ex){
          ex.printStackTrace();
          System.out.println("radarMax() 에러 : "+ex.getMessage());
       }finally{
          disConnection();
       }
       return maxVal;
    } 
}
   