<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<%
	request.setCharacterEncoding("euc-kr");

%>
<jsp:useBean id="dao" class="com.sist.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.sist.member.MemberDTO">
<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%
	dao.memberJoin(dto);
	response.sendRedirect("firstpage.jsp");
%>
<script type="text/javascript">
	alert("4STUDY 회원가입이 완료되었습니다.")
</script>
