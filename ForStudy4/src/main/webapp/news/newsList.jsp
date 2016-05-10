<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/news.css" />
<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
 <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700&Open+Sans:300,400' rel='stylesheet' type='text/css'>
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
		<div id="small-logo">4STUDY</div><div id="small-logo2">가 전해드리는 교육뉴스</div>
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
	<ul id="newsul">
	<c:forEach var="vo" items="${newsList}">
	  <li class="newsli">
	    <img src="${vo.newsImage}" alt="">
	    <a href="${vo.newsLink}"><h5>${vo.newsTitle}</h5></a>
	    <p id="newsp">${vo.newsContent}</p>
	    <span id="newsa">${vo.newsWriter} &#187;</span> ${vo.newsDate}
	  </li>
	 </c:forEach>
	</ul>
	</div>
	
	
	
	<section class="four">
	<div class="wrapper-content"></div>
	</section>
	
	<img src="img/ad4.gif" style="position:fixed; right:20px; top:365px; height:550px; cursor:pointer;" onclick="window.open('http://www.eduwill.net')">
</body>
</html>