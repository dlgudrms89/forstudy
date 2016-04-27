<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/main_logout.css" />
<title>Insert title here</title>


<script type="text/javascript">
	$(function(){
		$('#logoutBtn').click(function(){
			$('#logfrm').submit();
		});
	});
</script>


</head>
<body>
<div id="logout">
			<form method=post action="logout_ok.jsp" id="logfrm">
			  <h2><span class="entypo-heart"></span> Welcome!</h2>
			  <button class="inputUserIcon" id="logoutBtn"><span class="entypo-lock-open"></span></button>
			  <span class="entypo-rocket inputPassIcon"></span>
			  <input type="text" class="entypo-rocket" id="id" value="<%=session.getAttribute("nick") %>님" style="border:0" READONLY/>
			  <span></span>
			  <input type="text" value="환영합니다" style="border:0" READONLY/>
			</form>
			<button>회원정보수정</button>
</div> 
</body>
</html>