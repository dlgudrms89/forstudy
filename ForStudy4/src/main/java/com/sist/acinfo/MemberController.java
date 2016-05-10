package com.sist.acinfo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.board.ReplyBoardVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AcinfoDAO;
import com.sist.dao.AcinfoDTO;
import com.sist.dao.AcmasterDTO;
import com.sist.member.*;

@Controller("MemberController")
public class MemberController {
	@RequestMapping("firstlogin.do")
	public String firstlogout_ok(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		System.out.println(id+"          "+pwd);
		MemberDAO dao=new MemberDAO();
		String result=dao.isLogin(id, pwd);
		String answer="";
		HttpSession session =req.getSession();
		int key=1;
		if(result.equals("NOID"))
		{
			key=0;
		}
		else if(result.equals("NOPWD"))
		{
			key=0;
		}
		else
		{	
			session.setAttribute("id", id);
			
		}
		MemberDTO mlist=dao.getUser(id);
		System.out.println(result);
		req.setAttribute("key", key);
		session.setAttribute("nick", result);
		session.setAttribute("mlist", mlist);
		return "member/login_ok";
		
	}
	@RequestMapping("logout.do")
	public String memberLogout(HttpServletRequest req){
		AcinfoDAO dao=AcinfoDAO.newInstance();
		List<AcmasterDTO> list = dao.topAcinfo();
		req.setAttribute("topAcinfo", list);
		List<ReplyBoardVO> list2 = dao.topBoard();
		req.setAttribute("topBoard", list2);
		HttpSession session=req.getSession();
		session.invalidate();
		req.setAttribute("jsp", "main/home.jsp");
		return "main";
	}
	@RequestMapping("firstpagelogout.do")
	public String firstpagememberLogout(HttpServletRequest req){
		HttpSession session=req.getSession();
		session.invalidate();
		return "firstpage";
	}
	@RequestMapping("idcheck.do")
	public String idcheck(HttpServletRequest req){
		String id=req.getParameter("id");
		MemberDAO dao=new MemberDAO();
		int count=dao.idCheck(id);
		req.setAttribute("count", count);
		return "member/idcheck_ok";
	}
	@RequestMapping("nickcheck.do")
	public String nickcheck(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		String nick=req.getParameter("nick");
		MemberDAO dao=new MemberDAO();
		int count=dao.nickCheck(nick);
		req.setAttribute("count", count);
		return "member/idcheck_ok";
	}
	@RequestMapping("join.do")
	public String join(HttpServletRequest req) throws Exception{
		System.out.println("¼³·¹!");
		req.setCharacterEncoding("EUC-KR");
		MemberDTO d=new MemberDTO();
		MemberDAO dao=new MemberDAO();
		String join_id=req.getParameter("id");
		String join_pwd= req.getParameter("pwd");
		String join_nick= req.getParameter("nick");
		String join_email= req.getParameter("email");
		System.out.println(join_id+" "+join_pwd+" "+join_nick+" "+join_email);
		d.setId(join_id);
		d.setPwd(join_pwd);
		d.setNick(join_nick);
		d.setEmail(join_email);
		dao.memberJoin(d);
		
		return "firstpage";
	}
	@RequestMapping("mainjoin.do")
	public String mainJoin(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		MemberDTO d=new MemberDTO();
		MemberDAO dao=new MemberDAO();
		String join_id=req.getParameter("id");
		String join_pwd= req.getParameter("pwd");
		String join_nick= req.getParameter("nick");
		String join_email= req.getParameter("email");
		AcinfoDAO Acdao=AcinfoDAO.newInstance();
		List<AcmasterDTO> list = Acdao.topAcinfo();
		req.setAttribute("topAcinfo", list);
		List<ReplyBoardVO> list2 = Acdao.topBoard();
		req.setAttribute("topBoard", list2);
		System.out.println(join_id+" "+join_pwd+" "+join_nick+" "+join_email);
		d.setId(join_id);
		d.setPwd(join_pwd);
		d.setNick(join_nick);
		d.setEmail(join_email);
		dao.memberJoin(d);
		req.setAttribute("jsp", "main/home.jsp");
		return "main";
	}
	@RequestMapping("memberchange.do")
	public String memberchange(HttpServletRequest req) throws Exception{
		req.setCharacterEncoding("UTF-8");
		MemberDTO d=new MemberDTO();
		MemberDAO dao=new MemberDAO();
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String gender=req.getParameter("gender");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String addr=req.getParameter("addr");
		d.setId(id);
		d.setPwd(pwd);
		d.setGender(gender);
		d.setEmail(email);
		d.setPhone(phone);
		d.setAddr(addr);
		AcinfoDAO acdao=AcinfoDAO.newInstance();
		List<AcmasterDTO> list = acdao.topAcinfo();
		req.setAttribute("topAcinfo", list);
		List<ReplyBoardVO> list2 = acdao.topBoard();
		req.setAttribute("topBoard", list2);
		dao.memberChange(id, pwd, gender, email, phone, addr);
		req.setAttribute("jsp", "main/home.jsp");
		return "main";
	}
	
}
