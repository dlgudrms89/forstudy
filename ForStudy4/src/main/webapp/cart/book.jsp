<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학원등록</title>
<link rel="stylesheet" href="css/booking.css">
<script type="text/javascript" src="search/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#reserveBtn').click(function(){
// 		console.log("로그 내용");
// 		var ac_name=$('#ac_name').val();
//     	  var ac_class=$('#ac_class').val();
//     	  var ac_tel=$('#ac_tel').val();
//     	  var ac_totalval=$('#ac_totalval').val();
//     	  var day=$('#day').val();
//     	  var param="ac_name="+encodeURIComponent(ac_name)+"&ac_class="+encodeURIComponent(ac_class)
//     	  			+"&ac_tel="+encodeURIComponent(ac_tel)+"&price="+encodeURIComponent(ac_totalval)+"&day="+encodeURIComponent(day);
    	  				
//     	  sendMessage("POST", "reserve_ok.do", param, reserve);
    	  $('#res_frm').submit();
	});
});
// function reserve(){
// 	if(httpRequest.readyState==4){
// 		if(httpRequest.status==200){
// 			location.reload();
// 		}
// 	}
// }
</script>
</head>
<body>
	<div class="diamond"></div>
	<div class="form-wrap">
		<form method="post" action="reserve_ok.do" id="res_frm">
<!-- 			<div class="location"> -->
<!-- 					<label for="location" style="float:none">학원명</label> -->
					<input id="ac_name" name="ac_name" value="${booklist.ac_name}" readonly = "readonly" >
<!-- 					<label for="location" style="float:none">과목명</label> -->
					<input id="ac_class" name="ac_class" value="${booklist.ac_class}" readonly = "readonly" >
						<input type=hidden name="ac_tel" id="ac_tel" value="${booklist.ac_tel }">
<!-- 					<label for="location" style="float:none">교습비</label> -->
					<input id="ac_totalval" name="price" value="${booklist.ac_totalval}" readonly = "readonly" >
<!-- 			</div> -->
<!-- 			<div class="dates"> -->
<!-- 				<div class="arrival" style="float:none"> -->
<!-- 					<label for="arrival">교습시작일</label><br />  -->
					<input name="day"
						type="text" onfocus="(this.type='date')"
						onblur="(this.type='text')" id="day" value="2016-05-06" />
<!-- 				</div> -->
<!-- 			</div> -->
		</form>
		<button type="submit" class="btn" id="reserveBtn">Sign Up</button>
		<div class="linkbox">
			<div class="links">
				<div class="origin">
				<p>등록되었습니다.<br>등록현황에서 확인해주십시오.</p>
					<a
						href="https://dribbble.com/shots/2464177-Daily-UI-067-Hotel-Booking"><i
						class="fa fa-dribbble"></i></a>
				</div>
			</div>
		</div>
	</div>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>

<script src="js/booking.js"></script>




</body>
</html>
