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
<link rel="stylesheet" href="css/gallery.css">
<link rel="stylesheet" href="css/gallery2.css">
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
	<main role="main" id="main"> <section class="tiles-a">
	<ul>

		<li><a href="#"
			style="background: url('img/rktrb.jpg'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/rktrb.jpg"
						alt="Starry Night">
					<div class="text-copy wrapper">
						<h3>Name Here</h3>
						<p>��Ż����Ʈ �ѹ����� �Ѱܶ�. �̹� ������Ʈ�� �ݵ�� �ٲ��ְڴ�.<br>�װ� ������.<br>�����ƴϴ�.<br><br>���԰� �Ѵ�.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/tjffp.jpg'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/tjffp.jpg" alt="Ocean beach">
					<div class="text-copy wrapper">
						<h3>Cool Title Here</h3>
						<p>�ٵ�<br>����.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('https://unsplash.it/600/600?image=238'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="https://unsplash.it/1900/800?image=238" alt="Manhattan">
					<div class="text-copy wrapper">
						<h3>Cool Title Here</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('https://unsplash.it/600/600?image=206'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="https://unsplash.it/1900/800?image=206"
						alt="Large bridge">
					<div class="text-copy wrapper">
						<h3>Cool Title Here</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('https://unsplash.it/600/600?image=134'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="https://unsplash.it/1900/800?image=134"
						alt="Large bridge">
					<div class="text-copy wrapper">
						<h3>Cool Title Here</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('https://unsplash.it/600/600?image=200'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="https://unsplash.it/1900/800?image=200"
						alt="Goat-like animal">
					<div class="text-copy wrapper">
						<h3>Cool Title Here</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('https://unsplash.it/600/600?image=120'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="https://unsplash.it/1900/800?image=120"
						alt="Starry Night">
					<div class="text-copy wrapper">
						<h3>Name Here</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('https://unsplash.it/600/600?image=640'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="https://unsplash.it/1900/800?image=640" alt="Ocean beach">
					<div class="text-copy wrapper">
						<h3>Cool Title Here</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('https://unsplash.it/600/600?image=238'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="https://unsplash.it/1900/800?image=238" alt="Manhattan">
					<div class="text-copy wrapper">
						<h3>Cool Title Here</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ex porro tempore, rerum ullam quae rem tenetur officiis eveniet
							voluptate reprehenderit quibusdam maiores nihil nam, sequi
							molestias explicabo non quos. Deserunt.</p>
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