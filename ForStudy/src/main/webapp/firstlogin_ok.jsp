<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
    
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	MemberDAO dao=new MemberDAO();
	String result=dao.isLogin(id, pwd);
	if(result.equals("NOID"))
	{
%>
		<script>
		alert("id�� �������� �ʽ��ϴ�");
		history.back();
		</script>

<%		
	}
	else if(result.equals("NOPWD"))
	{
%>
		<script>
		alert("��й�ȣ�� Ʋ���ϴ�");
		history.back();
		</script>

<%	
	}
	else
	{
		
		session.setAttribute("id", id);
		session.setAttribute("nick", result);
		response.sendRedirect("firstpage.jsp");
	}
	
%>
