<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String mode=request.getParameter("mode");
	String req_jsp="";
	if(mode==null)
		mode="0";
	//req_jsp=JspChange.jspChange(Integer.parseInt(mode)); 
	
%>
<!DOCTYPE html>
<html class="no-js">
<meta http-equiv="Content-Type" CONTENT="text/html; charset=UTF-8"/>
<link rel="stylesheet" href="css/gallery.css">
<link rel="stylesheet" href="css/gallery2.css">
<style>
html {
	height: 100%;
	/*   	background: linear-gradient(180deg, rgb(173, 255, 214), rgb(255,255,255)); */
	background-image: url("img/back.jpg");
	background: #F0F0F0;
}
.text-copy p{
	color: #000;
}
</style>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>4STUDY | MAIN</title>
</head>

<body>
	<main role="main" id="main"> <section class="tiles-a">
	<ul>

		<li><a href="#"
			style="background: url('img/rktrb.jpg'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/rktrb.jpg"
						alt="Starry Night">
					<div class="text-copy wrapper">
						<h3>내가 아니다 갓규가 한다</h3>
						<p>포탈사이트 넘버원을 넘겨라. 이번 프로젝트에 반드시 바꿔주겠다.<br>네겐 무리다.<br>내가아니다.<br><br>갓규가 한다.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/tjffp.jpg'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/tjffp.jpg" alt="Ocean beach">
					<div class="text-copy wrapper">
						<h3>신촌 서른즈음에</h3>
						<p>근데<br>설레.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/pick me.gif'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/pick me.gif" alt="Manhattan">
					<div class="text-copy wrapper">
						<h3>아이오아이</h3>
						<p>pick me pick me pick me up</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/alphago.png'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/alphago.png"
						alt="Large bridge">
					<div class="text-copy wrapper">
						<h3>알파고 에러</h3>
						<p>코딩 안쪽으로 접근</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/seho.png'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/seho.png"
						alt="Large bridge">
					<div class="text-copy wrapper">
						<h3>세호</h3>
						<p>프로젝트하는데 왜 안 왔어?</br>누구요? 모르는데 어떻게 가요!</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/shashasha.gif'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/shashasha.gif"
						alt="Goat-like animal">
					<div class="text-copy wrapper">
						<h3>사나없이 사나마나</h3>
						
						<p>면접관 만나느라 샤샤샤</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/dowon.png'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/dowon.png"
						alt="Starry Night">
					<div class="text-copy wrapper">
						<h3>도원결의</h3>
						<p>한날한시에 회식</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/piano.gif'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/piano.gif" alt="Ocean beach">
					<div class="text-copy wrapper">
						<h3>도레미파솔라시도</h3>
						<p>손 반 다리 반</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/kim.jpg'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/kim.jpg" alt="Manhattan">
					<div class="text-copy wrapper">
						<h3>김여사.jpg</h3>
						<p>외로운 김여사</p>
					</div>
				</div>
		</a></li>

	</ul>
	</section> </main>

	<aside role="complementary" id="aside" aria-hidden="true"
		aria-expanded="false"> <a href="#" class="close"><img
		src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/15309/close-white-thin.svg"
		alt="Close button"><span class="visually-hidden">Return
			to main content</span></a>
	<div class="aside--details" tabindex="0" aria-live="polite"
		aria-atomic="true" aria-label="Image details"></div>
	</aside>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/15309/toggleAria.js'></script>

	<script src="js/gallery.js"></script>
	
</body>

</html>