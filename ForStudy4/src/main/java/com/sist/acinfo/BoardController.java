package com.sist.acinfo;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.board.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AcinfoDAO;

@Controller("BoardController")
public class BoardController {
	@RequestMapping("boardlist.do")
	public String boardlist(HttpServletRequest req){
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=15;
		int start=(curpage*rowSize)-rowSize;
		int end=curpage*rowSize;
		map.put("start", start);
		map.put("end", end);
		List<ReplyBoardVO> list=ReplyBoardDAO.boardAllData(map);
		for(ReplyBoardVO vo:list){
			vo.setReplyCount(ReplyBoardDAO.boardReplyCount(vo.getNo()));
		}
		int totalpage=ReplyBoardDAO.boardTotalPage();
		
		int block=5;
		int fromPage=((curpage-1)/block*block)+1;
		int toPage=((curpage-1)/block*block)+block;
		if(toPage>totalpage)
			toPage=totalpage;
		
		req.setAttribute("list", list);
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("block", block);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("toPage", toPage);
		req.setAttribute("jsp", "board/list.jsp");
		return "main";
	}
	@RequestMapping("boardcontent.do")
	public String boardContent(HttpServletRequest req){
		//HttpSession session=req.getSession();
		//session.setAttribute("id", "hong");
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		ReplyBoardVO vo=ReplyBoardDAO.boardContentData(Integer.parseInt(no));
		String rp=req.getParameter("rp");
		if(page==null){
			page="1";
		}
		if(rp==null)
			rp="1";
		int crp=Integer.parseInt(rp);
		int rowSize=10;
		int start=(rowSize*crp)-rowSize;
		int end=rowSize*crp;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("bno", Integer.parseInt(no));
		List<ReplyVO> list=ReplyBoardDAO.replyAllData(map);
		req.setAttribute("vo", vo);
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		req.setAttribute("jsp", "board/content.jsp");
		return "main";
	}
	@RequestMapping("boarddelete.do")
	public String boardDelete(HttpServletRequest req){
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		String pwd=req.getParameter("pwd");
		boolean bCheck=false;
		String db_pwd=ReplyBoardDAO.boardGetPwd(Integer.parseInt(no));
		if(pwd.equals(db_pwd)){
			ReplyBoardDAO.boardDelete(Integer.parseInt(no));
			bCheck=true;
		}else{
			bCheck=false;
		}
		req.setAttribute("bCheck", bCheck);
		req.setAttribute("page", page);
		
		return "board/delete";
	}
	@RequestMapping("boardinsert.do")
	public String boardInsert(HttpServletRequest req){
		req.setAttribute("jsp", "board/insert.jsp");
		return "main";
	}
	@RequestMapping("boardinsertok.do")
	public String boardInsertOk(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		ReplyBoardVO vo=new ReplyBoardVO();
		vo.setName(id);
		vo.setPwd(pwd);
		vo.setSubject(subject);
		vo.setContent(content);
		ReplyBoardDAO.boardInsert(vo);
		req.setAttribute("jsp", "board/list.jsp");
		return "board/insert_ok";
	}
	@RequestMapping("boardupdate.do")
	public String boardUpdate(HttpServletRequest req)throws Exception{
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		ReplyBoardVO vo=ReplyBoardDAO.boardContentData(Integer.parseInt(no));
		req.setAttribute("no", no);
		req.setAttribute("page", page);
		req.setAttribute("vo", vo);
		req.setAttribute("jsp", "board/update.jsp");
		return "main";
	}
	@RequestMapping("boardupdateok.do")
	public String boardUpdateok(HttpServletRequest req)throws Exception{
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		ReplyBoardVO vo=new ReplyBoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		boolean bCheck=false;
		String db_pwd=ReplyBoardDAO.boardGetPwd(Integer.parseInt(no));
		if(pwd.equals(db_pwd)){
			ReplyBoardDAO.boardUpdate(vo);
			bCheck=true;
		}else{
			bCheck=false;
		}
		req.setAttribute("bCheck", bCheck);
		req.setAttribute("no", no);
		req.setAttribute("page", page);
		return "board/update_ok";
	}
	@RequestMapping("replydelete.do")
	public String replyDelete(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("utf-8");
		String bno=req.getParameter("bno");
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		// DB연동
		ReplyVO vo=ReplyBoardDAO.replyInfoData(Integer.parseInt(no));
		if(vo.getDepth()==0){
			ReplyBoardDAO.replyDelete(Integer.parseInt(no));
		}else{
			ReplyBoardDAO.replyMsgUpdate(Integer.parseInt(no));
		}
		ReplyBoardDAO.replyReDepthDecrement(vo.getRoot());
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_insert";
	}
	@RequestMapping("replyinsert.do")
	public String replyInsert(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("utf-8");
		String bno=req.getParameter("bno");
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		String msg=req.getParameter("reply_data");
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		// DB연동
		ReplyVO vo=new ReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		ReplyBoardDAO.replyInsert(vo);
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_insert";
	}
	@RequestMapping("replyreinsert.do")
	public String replyReInsert(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("utf-8");
		String bno=req.getParameter("bno");
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		String msg=req.getParameter("reply_data");
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		// DB연동
		// 상위 댓글의 정보 읽는다
		ReplyVO pvo=ReplyBoardDAO.replyParentData(Integer.parseInt(no));
		// group_step 변경
		ReplyBoardDAO.replyDataModify(pvo);
		
		ReplyVO vo=new ReplyVO();
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tab(pvo.getGroup_tab()+1);
		vo.setRoot(Integer.parseInt(no));
		vo.setBno(Integer.parseInt(bno));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		ReplyBoardDAO.replyReInsert(vo);
		ReplyBoardDAO.replyReDepthIncrement(Integer.parseInt(no));
		//ReplyBoardDAO.replyInsert(vo);
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_insert";
	}
	@RequestMapping("replyupdate.do")
	public String replyUpdate(HttpServletRequest req)throws Exception{
		req.setCharacterEncoding("utf-8");
		String bno=req.getParameter("bno");
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		String msg=req.getParameter("reply_data");
		ReplyVO vo=new ReplyVO();
		vo.setNo(Integer.parseInt(no));
		vo.setMsg(msg);
		ReplyBoardDAO.replyUpdate(vo);
		
		// content.jsp
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_insert";
	}
	@RequestMapping("boardsearch.do")
	   public String boardSearch(HttpServletRequest req)throws Exception{
	      req.setCharacterEncoding("UTF-8");
	      String op=req.getParameter("fs");
	      String search=req.getParameter("search");
	      AcinfoDAO dao=new AcinfoDAO();
	      List<ReplyBoardVO> list=dao.boardSearch(search, op);
	      req.setAttribute("boardsearchlist", list);
	      req.setAttribute("jsp", "board/search.jsp");
	      
	      return "main";
	   }
}
