package com.sist.dao;

import java.sql.*;
import java.util.*;

import com.sist.board.ReplyBoardVO;



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
         System.out.println("AcinfoDAO() error : "+ex.getMessage());
      }
   }

   public void getConnection(){
      try{
         conn = DriverManager.getConnection(URL, "scott", "tiger");
      }catch(Exception ex){
         System.out.println("getConntection() error : "+ex.getMessage());
      }
   }

   public void disConnection(){
      try{
         if(ps != null) ps.close();
         if(conn != null) conn.close();
      }catch(Exception ex){
         System.out.println("disConnection() error : "+ex.getMessage());
      }
   }

   public static AcinfoDAO newInstance(){
      if(dao == null)
         dao = new AcinfoDAO();
      return dao;
   }
   
   // 전체 수
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
			/*String sql="SELECT CEIL(COUNT(*)/12) FROM "
					+ "(SELECT distinct ac_name,ac_address,ac_tel FROM "
					+ "(SELECT distinct ac_name,ac_address,ac_class,ac_tel,ac_no,rownum as num FROM "
					+ "(SELECT distinct ac_name,ac_address,ac_class,ac_tel,ac_no FROM ac_info "
					+ "WHERE (ac_address like '%'||?||'%' OR ac_class LIKE '%'||?||'%' OR ac_name LIKE '%'||?||'%') ";*/
			
			String sql="SELECT CEIL(COUNT(*)/12) "
					+ "FROM "
					+ "(SELECT distinct ac_name,ac_address,ac_tel "
					+ "FROM "
					+"(SELECT distinct ac_name,ac_address,ac_tel,ac_mst_no,rownum as num FROM"
					+ "(SELECT distinct b.ac_name,b.ac_address,b.ac_tel,b.ac_mst_no "
					+ "FROM ac_info_temp a, ac_master b "
					+ "WHERE a.ac_mst_no=b.ac_mst_no AND " 
					+" (b.ac_address like '%'||?||'%' OR a.ac_class LIKE '%'||?||'%' OR b.ac_name LIKE '%'||?||'%') ";
					
			int j=0;
			while(j<data.length-1){
				sql+="AND (b.ac_address like '%'||?||'%' OR a.ac_class LIKE '%'||?||'%' OR b.ac_name LIKE '%'||?||'%') ";
				j++;
			}
				sql+="ORDER BY ac_mst_no DESC )))";
			ps = conn.prepareStatement(sql);
			for(int i=0;i<data.length*3;i++){
				ps.setString(i+1,"%"+data[i/3]+"%");
			}
			rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println("BoardTotal() error"+ex.getMessage());
		} finally {
			disConnection();
		}

		return total;

	}
   // 검색
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
	            }
	            String sql="SELECT distinct ac_name,ac_address,ac_tel,ac_mst_no,ac_reviewavg,ac_review_count,num "
	                  + "FROM "
	                  + "(SELECT distinct ac_name,ac_address,ac_tel,ac_mst_no,ac_reviewavg,ac_review_count,rownum as num "
	                  + "FROM "
	                  +"(SELECT distinct b.ac_name,b.ac_address,b.ac_tel,b.ac_mst_no,b.ac_reviewavg,b.ac_review_count "
	                  + "FROM ac_info_temp a, ac_master b "
	                  + "WHERE a.ac_mst_no=b.ac_mst_no AND " 
	                  +" (b.ac_address like '%'||?||'%' OR a.ac_class LIKE '%'||?||'%' OR b.ac_name LIKE '%'||?||'%') ";
	            
	            int j=0;
	            while(j<data.length-1){
	               sql+="AND (b.ac_address like '%'||?||'%' OR a.ac_class LIKE '%'||?||'%' OR b.ac_name LIKE '%'||?||'%') ";
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
	               d.setAc_tel(rs.getString(3));
	               d.setAc_mst_no(rs.getInt(4));
	               d.getAc_masterDTO().setAc_reviewavg(rs.getDouble(5));
	               d.getAc_masterDTO().setAc_review_count(rs.getInt(6));
	               int ac_list_no=rs.getInt(7)%12;
	               if(ac_list_no==0)
	            	   ac_list_no=12;
	               d.setAc_list_no(ac_list_no);
	               list.add(d);
	            }
	         rs.close();
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
   // 한 학원 당 여러개 있는 것 검색
   public List<AcinfoDTO> AcDetail(int ac_mst_no){
	   List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
	   try{
		   getConnection();
		   String sql="SELECT distinct ac_class,ac_inwon,ac_time,ac_totalval,ac_sub_no "
		   		+ "FROM ac_info_temp WHERE ac_mst_no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, ac_mst_no);
		   rs=ps.executeQuery();
		   while(rs.next()){
			   AcinfoDTO d= new AcinfoDTO();
			   d.setAc_class(rs.getString(1));
			   d.setAc_inwon(rs.getInt(2));
			   d.setAc_time(rs.getInt(3));
			   d.setAc_totalval(rs.getInt(4));
			   d.setAc_sub_no(rs.getInt(5));
			   list.add(d);
			   
		   }
		   rs.close();
	   }catch(Exception ex){
		   System.out.println("여러개 에러"+ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   
	   return list;
   }
   
   
   // 한 학원 당 하나만 필요한 것 검색
   public AcinfoDTO AcDetail2(int ac_mst_no){
	   AcinfoDTO d = new AcinfoDTO();
	   try{
		   getConnection();
		   String sql="SELECT ac_name,ac_field,ac_address,ac_tel,ac_program,ac_teacher "
		   		+ "FROM ac_master WHERE ac_mst_no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, ac_mst_no);
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
		   System.out.println("한개씩 필요 에러"+ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   
	   return d;
   }
   
   // 학원 이름으로 번호 따오기
   /*public int AcDetail3(String Ac_name){
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
   }*/
   
   // 장바구니 담기
   public List<AcinfoDTO> cartCheckList(List<Integer> no){
	      List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
	      try{
	         getConnection();
	         for(int i=0;i<no.size();i++){
	            String sql = "SELECT b.ac_mst_no, b.ac_name, b.ac_address, b.ac_tel, a.ac_class, a.ac_totalval, "
	            		+ "a.ac_inwon, a.ac_time, b.ac_field, a.ac_teacher, b.ac_reviewavg,b.ac_review_count,a.ac_sub_no "
	            		+ "FROM ac_info_temp a, ac_master b "
	            		+ "WHERE a.ac_mst_no=b.ac_mst_no "
	            		+ "AND ac_sub_no=?";
	            ps = conn.prepareStatement(sql);
	            ps.setInt(1, no.get(i));
	            rs = ps.executeQuery();
	            rs.next();
	            AcinfoDTO d = new AcinfoDTO();
	            d.setAc_mst_no(rs.getInt(1));
	            d.setAc_name(rs.getString(2));
	            d.setAc_address(rs.getString(3));
	            d.setAc_tel(rs.getString(4));
	            d.setAc_class(rs.getString(5));
	            d.setAc_totalval(rs.getInt(6));
	            d.setAc_inwon(rs.getInt(7));
	            d.setAc_time(rs.getInt(8));
	            d.setAc_field(rs.getString(9));
	            d.setAc_teacher(rs.getInt(10));
	            d.getAc_masterDTO().setAc_reviewavg(rs.getDouble(11));
	            d.getAc_masterDTO().setAc_review_count(rs.getInt(12));
	            d.setAc_sub_no(rs.getInt(13));
	            d.setAc_list_no(i+1);
	            
	            list.add(d);
	            rs.close();
	            ps.close();
	         }
	      }catch(Exception ex){
	    	  ex.printStackTrace();
	         System.out.println("cartCheckList() 에러 : "+ex.getMessage());
	      }finally{
	         disConnection();
	      }
	      return list;
	   } 
   
   
   // 장바구니 비교용 최대값 구하기
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
             String sql = "SELECT MAX(a.ac_totalval), MAX(a.ac_inwon), MAX(a.ac_time), MAX(b.ac_teacher), CEIL(MAX(b.ac_reviewavg)) "
                   + "FROM ac_info_temp a,ac_master b "
                   + "WHERE a.ac_mst_no=b.ac_mst_no "
                   + "AND a.ac_sub_no in ("+noArr+")";

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
   

   
   
   public List<AcreviewDTO> reviewAllData(int master_no){
	   List<AcreviewDTO> list = new ArrayList<AcreviewDTO>();
	   try{
		   getConnection();
		   String sql = "SELECT rv_no,id,ac_review_score,rv_content,sympathy,reg_date,num "
			         + "FROM (SELECT rv_no,id,ac_review_score,rv_content,sympathy,reg_date,rownum as num "
			         + "FROM (SELECT rv_no,id,ac_review_score,rv_content,sympathy,reg_date FROM review WHERE ac_mst_no=? ORDER BY reg_date DESC)) WHERE num<6";
		   ps = conn.prepareStatement(sql);
		   ps.setInt(1, master_no);
		   rs=ps.executeQuery();
		   while(rs.next()){
			   AcreviewDTO d=new AcreviewDTO();
			   d.setRv_no(rs.getInt(1));
			   d.setId(rs.getString(2));
			   d.setAc_review_score(rs.getInt(3));
			   d.setRv_content(rs.getString(4));
			   d.setSympathy(rs.getInt(5));
			   d.setReg_date(rs.getDate(6));
			   list.add(d);
		   }
		   rs.close();
	   }catch(Exception ex){
		   System.out.println("리뷰 불러오기:"+ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   return list;
   }
   
   public void insertReview(AcreviewDTO d){
	   try{
		   getConnection();
		   String sql = "INSERT INTO review VALUES((SELECT NVL(MAX(rv_no)+1,1) FROM review),?,?,?,0,sysdate,?)";
		   ps = conn.prepareStatement(sql);
		   ps.setString(1, d.getId());
		   ps.setInt(2, d.getAc_mst_no());
		   ps.setString(3, d.getRv_content());
		   ps.setInt(4, d.getAc_review_score());
		   ps.executeUpdate();
		   ps.close();
		   sql = "UPDATE ac_master SET ac_review_count=ac_review_count+1 WHERE ac_mst_no=?";
		   ps = conn.prepareStatement(sql);
		   ps.setInt(1, d.getAc_mst_no());
		   ps.executeUpdate();
		   ps.close();
		   sql = "SELECT CEIL(AVG(ac_review_score)/0.5)*0.5 FROM review WHERE ac_mst_no=?";
		   ps = conn.prepareStatement(sql);
		   ps.setInt(1, d.getAc_mst_no());
		   ResultSet rs = ps.executeQuery();
		   rs.next();
		   double avg = rs.getDouble(1);
		   rs.close();
		   ps.close();
		   sql = "UPDATE ac_master SET ac_reviewavg=? WHERE ac_mst_no=?";
		   ps = conn.prepareStatement(sql);
		   ps.setDouble(1, avg);
		   ps.setInt(2, d.getAc_mst_no());
		   ps.executeUpdate();
		   
	   }catch(Exception ex){
		   ex.printStackTrace();
		   System.out.println("insertReview() 에러 : "+ex.getMessage());
	   }finally{
		   disConnection();
	   }
   }
   public double mstReviewAvg(int ac_master){
	      double avg = 0;
	      try{
	         getConnection();
	         String sql = "SELECT ac_reviewavg FROM ac_master WHERE ac_mst_no=?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, ac_master);
	         ResultSet rs = ps.executeQuery();
	         rs.next();
	         avg = rs.getDouble(1);
	         rs.close();
	      }catch(Exception ex){
	         System.out.println("mstReviewAvg() 에러 : "+ex.getMessage());
	      }finally{
	         disConnection();
	      }
	      return avg;
	   }
	   public int mstReviewCount(int ac_master){
	      int count = 0;
	      try{
	         getConnection();
	         String sql = "SELECT ac_review_count FROM ac_master WHERE ac_mst_no=?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, ac_master);
	         ResultSet rs = ps.executeQuery();
	         rs.next();
	         count = rs.getInt(1);
	         rs.close();
	      }catch(Exception ex){
	         System.out.println("mstReviewCount() 에러 : "+ex.getMessage());
	      }finally{
	         disConnection();
	      }
	      return count;
	   }
   // 등록
   public AcinfoDTO booking(int no){
	   	AcinfoDTO d = new AcinfoDTO();
	      try{
	         getConnection();
	            String sql = "SELECT b.ac_name, a.ac_class, a.ac_totalval, a.ac_tel "
	            		+ "FROM ac_info_temp a, ac_master b "
	            		+ "WHERE a.ac_mst_no=b.ac_mst_no "
	            		+ "AND a.ac_sub_no=?";
	            ps = conn.prepareStatement(sql);
	            ps.setInt(1, no);
	            rs = ps.executeQuery();
	            rs.next();
	            d.setAc_name(rs.getString(1));
	            d.setAc_class(rs.getString(2));
	            d.setAc_totalval(rs.getInt(3));
	            d.setAc_tel(rs.getString(4));
	            rs.close();
	            ps.close();
	            
	            getConnection();
	      }catch(Exception ex){
	         System.out.println("booking() 에러 : "+ex.getMessage());
	      }finally{
	         disConnection();
	      }
	      return d;
	   } 
   public List<ReplyBoardVO> boardSearch(String search, String op){
	      List<ReplyBoardVO> list = new ArrayList<ReplyBoardVO>();
	      try{
	         getConnection();
	         
	            String sql="SELECT no,name,subject,content,hit,regdate,replycount FROM reply_board "
	                  + "WHERE "+op+" like ? AND ROWNUM<=10 ORDER BY regdate ASC ";
	         
	            ps=conn.prepareStatement(sql);
	            ps.setString(1,"%"+search+"%");
	            rs=ps.executeQuery();
	         

	            while (rs.next()) {
	            ReplyBoardVO d = new ReplyBoardVO();
	            d.setNo(rs.getInt(1));
	            d.setName(rs.getString(2));
	            d.setSubject(rs.getString(3));
	            d.setContent(rs.getString(4));
	            d.setHit(rs.getInt(5));
	            d.setRegdate(rs.getDate(6));
	            d.setReplyCount(rs.getInt(7));
	            list.add(d);
	         }
	         rs.close();
	         System.out.println(search);
	      }catch(Exception ex){System.out.println(ex.getMessage());}
	      
	      finally{
	         disConnection();
	      }
	      return list;
	   }
   public void updateSearchCount(int ac_masterno){
	   try{
		   getConnection();
		   String sql = "UPDATE ac_master SET ac_search_count = ac_search_count+1 WHERE ac_mst_no=?";
		   ps = conn.prepareStatement(sql);
		   ps.setInt(1, ac_masterno);
		   ps.executeUpdate();
	   }catch(Exception ex){
		   System.out.println("updateSearchCount()에러 : "+ex.getMessage());
	   }finally{
		   disConnection();
	   }
   }
   
   public List<AcmasterDTO> topAcinfo(){
	   List<AcmasterDTO> list = new ArrayList<AcmasterDTO>();
	   try{
		   getConnection();
		   String sql = "SELECT ac_mst_no,ac_name,ac_address,ac_tel,ac_reviewavg,ac_review_count,ac_field,num FROM "
		   		+ "(SELECT ac_mst_no,ac_name,ac_address,ac_tel,ac_reviewavg,ac_review_count,ac_field,rownum as num FROM "
		   		+ "(SELECT ac_mst_no,ac_name,ac_address,ac_tel,ac_reviewavg,ac_review_count,ac_field FROM ac_master ORDER BY ac_reviewavg DESC)) ac_master WHERE "
		   		+ "num<6";
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()){
			   AcmasterDTO d = new AcmasterDTO();
			   d.setAc_mst_no(rs.getInt(1));
			   d.setAc_name(rs.getString(2));
			   d.setAc_address(rs.getString(3));
			   d.setAc_tel(rs.getString(4));
			   d.setAc_reviewavg(rs.getDouble(5));
			   d.setAc_review_count(rs.getInt(6));
			   d.setAc_field(rs.getString(7));
			   list.add(d);
		   }
		   rs.close();
	   }catch(Exception ex){
		   ex.printStackTrace();
		   System.out.println("topAcinfo() 에러 : "+ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   return list;
   }
   public List<ReplyBoardVO> topBoard(){
	   List<ReplyBoardVO> list = new ArrayList<ReplyBoardVO>();
	   try{
		   getConnection();
		   String sql = "SELECT no,subject,name,regdate,hit,replyCount,num FROM "
			   		+ "(SELECT no,subject,name,regdate,hit,replyCount,rownum as num FROM "
			   		+ "(SELECT no,subject,name,regdate,hit,replyCount FROM reply_board ORDER BY hit DESC)) reply_board WHERE "
			   		+ "num<6";
		   ps = conn.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   while(rs.next()){
			   ReplyBoardVO d = new ReplyBoardVO();
			   d.setNo(rs.getInt(1));
			   d.setSubject(rs.getString(2));
			   d.setName(rs.getString(3));
			   d.setRegdate(rs.getDate(4));
			   d.setHit(rs.getInt(5));
			   d.setReplyCount(rs.getInt(6));
			   list.add(d);
		   }
		   rs.close();
	   }catch(Exception ex){
		   ex.printStackTrace();
		   System.out.println("topBoard() 에러 : "+ex.getMessage());
	   }finally{
		   disConnection();
	   }
	   return list;
   }
}
   