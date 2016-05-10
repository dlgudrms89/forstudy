<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css" />

<script type="text/javascript">
	$(document).ready(
			function() {

				setTimeout(function() {

					$("#name").removeClass("larger");

					$("#name span").each(
							function() {
								$(this).css("-webkit-transition-delay",
										$(this).data("delay") + "ms").css(
										"transition-delay",
										$(this).data("delay") + "ms");
								$(this).addClass("visible");
							});

				}, 1000);

			});
</script>

</head>
<body>
<div id="top-bar">
		<div id="small-logo">학원 정보 공유 커뮤니티</div>
	</div>
	<div id="intro">
		<div id="name" class="larger">
			<span data-delay="500">4</span> <span data-delay="800">S</span> <span
				data-delay="0" class="darker visible">T</span> <span data-delay="0"
				class="darker visible">U</span> <span data-delay="1000">D</span> <span
				data-delay="700">Y</span>
		</div>
		<div class="section-arrow">
			<div class="block"></div>
			<div class="triangle left"></div>
			<div class="triangle right"></div>
			<div class="block"></div>
		</div>
	</div>


	<div class="content-back">
	<center>
	<h3>글 쓰기</h3>
	<table id="table_content">
		<form method="post" action="boardupdateok.do">
		<tr>
		 <td class="tdcenter" width=20%>이름</td>
		 <td class="tdcenter" width=30%><input type="text" name="id" value="${sessionScope.id }" readonly="readonly"></td>
		 <td class="tdcenter" width=20%>비밀번호</td>
		 <td class="tdcenter" width=30%><input type="password" size="15" id="boardpwd" name="pwd"></td>
		</tr>
		<tr>
		 <td class="tdcenter" width=20%>제목</td>
		 <td class="tdleft" colspan="3"><input type="text" size=60 id="boardsubject" name="subject" value="${vo.subject }"></td>
		</tr>
		<tr>
		 <td class="tdleft" colspan="4" valign="top" height="100" border=1>
		   <textarea rows="10" cols="60" id="boardcontent" name="content">${vo.content }</textarea>
		  <pre></pre>
		 </td>
		</tr>
		<tr>
			<input type="hidden" value="${no }" name="no">
			<input type="hidden" value="${page }" name="page">
		  <td><input type="submit" value="등록"></td>
		</tr>
		</form>
	</table>
	</center>
	</div>
	
	
	<section class="four">
	<div class="wrapper-content"></div>
	</section>

	
</body>
</html>