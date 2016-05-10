<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학원등록현황</title>
<link rel="stylesheet" href="css/mypage.css">
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
</head>
<body>
	<div id="notebooks">
		<!-- 유저  -->
		${sessionScope.id }님의 학원등록현황
	  <ul id="notebook_ul" style="height: 295px;">
	  <c:forEach var="vo" items="${userlist }">
	    <li>
	      <i class="fa fa-building-o"></i>&nbsp; <b>${vo.ac_name }</b><br/>
	      <i class="fa fa-pencil"></i>&nbsp; <b>${vo.ac_class }</b><br/>
	      <i class="fa fa-calendar"></i>&nbsp; <b>${vo.day }</b><br/>
	      <i class="fa fa-phone"></i>&nbsp; <b>${vo.ac_tel }</b><br/>
	      <c:if test="${vo.reserve_check==0 }"><i class="fa fa-check-square-o "></i>&nbsp; <b id="reserve_check">등록대기</b></c:if>
		  <c:if test="${vo.reserve_check==1 }"><i class="fa fa-check-square "></i>&nbsp; <b>등록완료</b></c:if><br/>
<!-- 	      <div class="right top"><input type="submit" value="X" id="btn-del" class="btn-del"/></div> -->
	    </li>
	    </c:forEach>
	  </ul>
	  <span onclick="window.close()">닫    기</span>
	</div>
</body>
</html>