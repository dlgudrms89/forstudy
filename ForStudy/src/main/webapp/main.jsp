<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String mode=request.getParameter("mode");
	String req_jsp="";
	if(mode==null)
		mode="0";
	req_jsp=JspChange.jspChange(Integer.parseInt(mode)); 
	
%>
<!DOCTYPE html>
<html class="no-js">
<meta http-equiv="Content-Type" CONTENT="text/html; charset=UTF-8"/>
<style>
html {
	height: 100%;
	/*   	background: linear-gradient(180deg, rgb(173, 255, 214), rgb(255,255,255)); */
	background-image: url("img/back.jpg");
	background: #F0F0F0;
}
</style>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>4STUDY | MAIN</title>
</head>

<body>
	<jsp:include page="leftmenu.jsp"></jsp:include>
	<jsp:include page="<%=req_jsp %>"></jsp:include>
	<jsp:include page="cart.jsp"></jsp:include>
</body>

</html>