<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>


<link rel="stylesheet" href="css/widget.css">
<script>
location.replace = ('http://www.naver.com');
</script>
</head>
<body>
	<div class="widgetfirst">
	
		<nav class="widget-nav">
			<ul>
				<li class="weather">
					<div class="menuicon fa fa-bars"></div>
					
					<div class="icon fa fa-newspaper-o fa-2x"></div> <span>교육 뉴스</span>
				</li>


				<li class="gallery active"  onclick="location.href='gallery.jsp';">
					<div class="menuicon fa fa-bars"></div>
					
					<div class="icon fa fa-photo fa-2x"></div> <span>갤러리</span>
				</li>


				<li class="likes">
					<div class="menuicon fa fa-bars"></div>
					
					<div class="icon fa fa-comment-o fa-2x"></div> <span>커뮤니티</span>
				</li>

				<li class="history" onclick="window.open('https://www.facebook.com/포스터디닷컴-507719639418391/?fref=ts')">
					<div class="menuicon fa fa-bars"></div>
					
					<div class="icon fa fa-facebook-official fa-2x" ></div><span>페이스북</span>
				</li>
				
				<li class="comments">
					<div class="menuicon fa fa-bars"></div>
					
					<div class="icon fa fa-heart-o fa-2x"></div> <span>후원</span>
				</li>
				
			</ul>
		</nav>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/widget.js"></script>



</body>
</html>