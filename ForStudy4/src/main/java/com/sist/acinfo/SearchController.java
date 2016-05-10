package com.sist.acinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.ACTIVE;
import org.springframework.validation.BindingResult;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller("SearchController")
public class SearchController {
	@RequestMapping("search.do")
	public String search(HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
			String search = req.getParameter("search");
	    	int curpage=0;
		    int totalpage=0;
		    String strPage=req.getParameter("page");
	    	if(strPage==null)
	    		strPage="1";
	    	curpage=Integer.parseInt(strPage);
	    	AcinfoDAO dao=AcinfoDAO.newInstance();
	    	List<AcinfoDTO> list=dao.AcinfoSearchPage(search,curpage);
	    	totalpage=dao.AcinfoTotal(search);
	    	req.setAttribute("search", search);
	    	req.setAttribute("list", list);
	    	req.setAttribute("curpage", curpage);
	    	req.setAttribute("totalpage", totalpage);
	    	req.setAttribute("jsp", "search/maptest6.jsp");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("map search에러");
		}
    	
		return "main";
	}
	
	@RequestMapping("searchdetail.do")
	   public String searchDetail(HttpServletRequest req){
	      
	       try {
	         //req.setCharacterEncoding("UTF-8");
	         AcinfoDAO dao=AcinfoDAO.newInstance();
	          //String Ac_name = req.getParameter("name");
	          String Ac_no=req.getParameter("no");
	          
	          int Ac_mst_no=Integer.parseInt(Ac_no);
	          AcinfoDTO d = dao.AcDetail2(Ac_mst_no);
	          List<AcinfoDTO> list = dao.AcDetail(Ac_mst_no);
	          List<AcreviewDTO> reviewList = dao.reviewAllData(Ac_mst_no);
	          int reviewCount = dao.mstReviewCount(Ac_mst_no);
	          double reviewAvg = dao.mstReviewAvg(Ac_mst_no);
	          dao.updateSearchCount(Ac_mst_no);
	          req.setAttribute("reviewCount", reviewCount);
	          req.setAttribute("reviewAvg", reviewAvg);
	          req.setAttribute("reviewList", reviewList);
	          req.setAttribute("vo", list);
	          req.setAttribute("d", d);
	          req.setAttribute("mstno", Ac_mst_no);
	          req.setAttribute("jsp", "search/searchdetailcopy.jsp");
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         System.out.println("상세검색 오류:");
	      }
	      return "main";
	   }
	@RequestMapping("compare.do")
	public String compareData(HttpServletRequest req){
		AcinfoDAO dao=AcinfoDAO.newInstance();
		List<AcinfoDTO> list=(ArrayList<AcinfoDTO>)req.getSession().getAttribute("cartlist");
		req.setAttribute("list",list);
		/*List<AcinfoDTO> list2=compareChart(list);
	
		req.setAttribute("list2", list2);*/
		
		req.setAttribute("jsp", "compare/compare.jsp");
		return "main";
	}
	
	@RequestMapping("chart.do")
	   public String compareChart(HttpServletRequest req){
	      AcinfoDAO dao=AcinfoDAO.newInstance();
	      List<AcinfoDTO> list=(ArrayList<AcinfoDTO>)req.getSession().getAttribute("cartlist");
	      
	      int[] ac_no=new int[list.size()];
	      for(int i=0;i<list.size();i++){
	         ac_no[i]=list.get(i).getAc_sub_no();
	      }
	      int[] maxVal = new int[5]; 
	      maxVal=dao.radarMax(ac_no);
	      List<AcinfoDTO> copylist = new ArrayList<AcinfoDTO>();
	      if(copylist!=null)
	         copylist.clear();
	      for(AcinfoDTO de:list){
	    	  AcinfoDTO dto = new AcinfoDTO();
	    	  int val1 = de.getAc_totalval();
	    	  int val2 = de.getAc_inwon();
	    	  int val3 =   de.getAc_time();         
	    	  int val4 =   de.getAc_teacher();           
	    	  double val5 = de.getAc_masterDTO().getAc_reviewavg();
	    	  if(maxVal[0]!=0)
	    		  dto.setAc_totalval((val1*100/maxVal[0]));    
	    	  else
	    		  dto.setAc_totalval(0);   
	    	  if(maxVal[1]!=0)
	    		  dto.setAc_inwon((val2*100/maxVal[1]));    
	    	  else
	              dto.setAc_inwon(0);
	    	  if(maxVal[2]!=0)     
	              dto.setAc_time((val3*100/maxVal[2]));    
	    	  else
	              dto.setAc_time(0);
	    	  if(maxVal[3]!=0)
	              dto.setAc_teacher((val4*100/maxVal[3]));    
	    	  else
	              dto.setAc_teacher(0);
	    	  if(maxVal[4]!=0)
	              dto.getAc_masterDTO().setAc_reviewavg(val5*10);    
	    	  else
	              dto.getAc_masterDTO().setAc_reviewavg(0);
	    	  copylist.add(dto);  
	      }
	      req.setAttribute("copylist", copylist);
	      return "/compare/chart";
	}
	@RequestMapping("reviewadd.do")
	   public String review_add(HttpServletRequest req) throws Exception{
	      req.setCharacterEncoding("UTF-8");
	       String mstno = req.getParameter("mstno");
	       String content = req.getParameter("review_text");
	       String score = req.getParameter("review_score");
	       String id="비회원";
	       if(req.getSession().getAttribute("id")!=null){
	    	   id = (String)req.getSession().getAttribute("id");
	       }
	       
	       
	      int master_no = Integer.parseInt(mstno);
	      int scoreint = Integer.parseInt(score);
	      
	       AcinfoDAO dao = AcinfoDAO.newInstance();
	       AcreviewDTO d = new AcreviewDTO();
	       d.setId(id);
	       d.setAc_mst_no(master_no);
	       d.setRv_content(content);
	       d.setAc_review_score(scoreint);
	       dao.insertReview(d);
	       req.setAttribute("mstno", master_no);
	       
	      return "search/review_ok";
	   }
}