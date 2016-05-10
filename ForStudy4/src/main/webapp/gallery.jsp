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
						<h3>���� �ƴϴ� ���԰� �Ѵ�</h3>
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
						<h3>���� ����������</h3>
						<p>�ٵ�<br>����.</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/pick me.gif'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/pick me.gif" alt="Manhattan">
					<div class="text-copy wrapper">
						<h3>���̿�����</h3>
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
						<h3>���İ� ����</h3>
						<p>�ڵ� �������� ����</p>
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
						<h3>��ȣ</h3>
						<p>������Ʈ�ϴµ� �� �� �Ծ�?</br>������? �𸣴µ� ��� ����!</p>
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
						<h3>�糪���� �糪����</h3>
						
						<p>������ �������� ������</p>
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
						<h3>��������</h3>
						<p>�ѳ��ѽÿ� ȸ��</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/piano.gif'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/piano.gif" alt="Ocean beach">
					<div class="text-copy wrapper">
						<h3>�������ļֶ�õ�</h3>
						<p>�� �� �ٸ� ��</p>
					</div>
				</div>
		</a></li>

		<li><a href="#"
			style="background: url('img/kim.jpg'); background-size: cover;"
			aria-controls="aside" aria-expanded="false">
				<div class="details visually-hidden">
					<img src="img/kim.jpg" alt="Manhattan">
					<div class="text-copy wrapper">
						<h3>�迩��.jpg</h3>
						<p>�ܷο� �迩��</p>
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