package com.sist.acinfo;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.sist.board.ReplyBoardVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
import com.sist.dao.*;
import com.sist.news.NewsDTO;
import com.sist.news.NewsManager;
import com.sist.reserve.*;

@Controller("MainController")
public class MainController {
	@RequestMapping("firstpage.do")
	   public String first_page(HttpServletRequest req){
	      
	      return "firstpage";
	   }
	
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req){
		AcinfoDAO dao=AcinfoDAO.newInstance();
		List<AcmasterDTO> list = dao.topAcinfo();
		List<ReplyBoardVO> list2 = dao.topBoard();
		req.setAttribute("topBoard", list2);
		req.setAttribute("topAcinfo", list);
		for(int i=0;i<list2.size();i++){
			System.out.println(list2.get(i).getSubject());
		}
		
		
		req.setAttribute("jsp", "main/home.jsp");
		return "main";
	}
	
	@RequestMapping("cart.do")
	public String cartmain(HttpServletRequest req){
		HttpSession session=req.getSession();
		List<AcinfoDTO> list=(ArrayList<AcinfoDTO>)req.getSession().getAttribute("cartlist");
		session.setAttribute("cartlist",list);
		return "/cart/cart_ok";
	}
	
	@RequestMapping("cartadd.do")
	public String cart_page(HttpServletRequest req){
	      try {
	         String no = req.getParameter("no");
	         StringTokenizer st = new StringTokenizer(no, ",");
	         List<Integer> ino = new ArrayList<Integer>();
	         int noLength = st.countTokens();
	         for(int i=0;i<noLength;i++){
	            ino.add(Integer.parseInt(st.nextToken()));
	         }
	         
	          String mode = req.getParameter("mode");
	          HttpSession session=req.getSession();
	         if(mode==null)
	            mode="0";
	         
	         String name = req.getParameter("name");
	         List<AcinfoDTO> cartlist = new ArrayList<AcinfoDTO>();
	         
	         if((session.getAttribute("cartlist")) != null){
	            cartlist = (ArrayList<AcinfoDTO>)session.getAttribute("cartlist");
	            for(int i=0;i<cartlist.size();i++){
	            	for(int j=0;j<ino.size();j++){
	            		if(cartlist.get(i).getAc_sub_no()==ino.get(j)){
	            			ino.remove(j);
	            			break;
	            		}
	            	}
	            }
	         }
	         
	         if(no!=null){
	            AcinfoDAO dao=AcinfoDAO.newInstance();
	            List<AcinfoDTO> aclist = dao.cartCheckList(ino);
	            for(int i=0;i<aclist.size();i++){
	               cartlist.add(aclist.get(i));
	            }
	            for(int i=0;i<cartlist.size();i++){
	               System.out.println(cartlist.get(i).getAc_class());  
	            }
	            
	            session.setAttribute("cartlist",cartlist);
	           req.setAttribute("name", name );
	            req.setAttribute("mode", mode );
	           
	         }
	      } catch (Exception e1) {
	    	  
	         e1.printStackTrace();
	      }
	      return "cart/cart_ok";
	   }
	@RequestMapping("cartremove_ok.do")
	public String cartremove_ok(HttpServletRequest req){
		 try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 HttpSession session=req.getSession();
		   
		   String no = req.getParameter("removeno");
		   int ino = Integer.parseInt(no);
		   List<AcinfoDTO> list=(ArrayList<AcinfoDTO>)req.getSession().getAttribute("cartlist");
		   for(int i=0;i<list.size();i++){
		      if(list.get(i).getAc_sub_no()==ino){
		         list.remove(i);
		      }
		   }
		   session.setAttribute("cartlist",list); 
		   
		return "/cart/cart_ok";
	}
	@RequestMapping("gallery.do")
	public String gallery_page(HttpServletRequest req){
		req.setAttribute("jsp", "gallery.jsp");
		return "main";
	}
	
	@RequestMapping("book.do")
	public String book_page(HttpServletRequest req){
		try{
			AcinfoDAO dao=AcinfoDAO.newInstance();
			int book_no=Integer.parseInt(req.getParameter("no"));
			AcinfoDTO booklist = dao.booking(book_no);
			req.setAttribute("booklist", booklist);
			req.setAttribute("jsp", "cart/book.jsp");
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "cart/book";
	}
	
	@RequestMapping("newsList.do")
	public String news_page(HttpServletRequest req){
		try{
			NewsManager m = new NewsManager();
			List<NewsDTO> newsList = m.newsAllData();
			req.setAttribute("newsList", newsList);
			req.setAttribute("jsp", "news/newsList.jsp");
		}catch(Exception ex){
			System.out.println("news_page error : "+ex.getMessage());
		}
		return "main";
	}
	
	
	@RequestMapping("reserve_ok.do")
	   public String reserve_ok(HttpServletRequest req)
	   throws Exception
	   {
		   req.setCharacterEncoding("EUC-KR");
		   String ac_name=req.getParameter("ac_name");
		   String ac_class=req.getParameter("ac_class");
		   String ac_tel=req.getParameter("ac_tel");
		   String price=req.getParameter("price");
		   String day=req.getParameter("day");
		   
		   HttpSession session=req.getSession();
		   String id=(String)session.getAttribute("id");
		   System.out.println("id?"+id);
		   AcreserveVO vo=new AcreserveVO();
		   vo.setId(id);
		   vo.setAc_name(ac_name);
		   vo.setAc_class(ac_class);
		   vo.setAc_tel(ac_tel);
		   vo.setDay(day);
		   vo.setPrice(Integer.parseInt(price));
		   ReserveDAO.reserveInsert(vo);
		   return "reserve/reserve_ok";
	   }
	   @RequestMapping("mypage.do")
	   public String mypage(HttpServletRequest req)
	   {
		   try
		   {
			   HttpSession session=req.getSession();
			   String id=(String)session.getAttribute("id");
			   List<AcreserveVO> userlist=ReserveDAO.reserveUserAllData(id);
			   req.setAttribute("userlist", userlist);
			   req.setAttribute("jsp", "../reserve/mypage.jsp");
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   return "reserve/mypage";
	   }
	   @RequestMapping("adminpage.do")
	   public String admin(HttpServletRequest req)
	   {
		   List<AcreserveVO> adminlist=ReserveDAO.reserveAdminAllData();
		   req.setAttribute("adminlist", adminlist);
		   req.setAttribute("jsp", "../reserve/adminpage.jsp");
		   return "reserve/adminpage";
	   }
	   @RequestMapping("admin_ok.do")
	   public String admin_ok(HttpServletRequest req)
	   {
		   String no=req.getParameter("no");
		   ReserveDAO.reserveCheckUpdate(Integer.parseInt(no));
		   return "reserve/admin_ok";
	   }
}