<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="css/booking.css">
</head>
<body>
<html>
<body>
	<div class="diamond"></div>
	<div class="form-wrap">
		<h2 class="mob">Hotel Booking Form</h2>
		<h3 class="mob">Mobile Version</h3>
		<h5 class="mob">view on a desktop for the full experience</h5>
		<form action="">
			<div class="location">
				<label for="location" style="float:none">학원명</label><br /> <input type="text"
					name="location" placeholder="New York, NY" /><br />
			</div>
			<div class="guests">
				<label for="guests" style="float:none">NUMBER OF GUESTS</label><br />
				<br />
				<button type="button" id="cnt-down" class="counter-btn">-</button>
				<input type="text" id="guestNo" name="guests" value="2" />
				<button type="button" id="cnt-up" class="counter-btn">+</button>
			</div>
			<div class="dates">
				<div class="arrival" style="float:none">
					<label for="arrival">시작</label><br /> <input name="arrival"
						type="text" onfocus="(this.type='date')"
						onblur="(this.type='text')" placeholder="10/03/2016" />
				</div>
			</div>
		</form>
		<button type="button" class="btn">결제</button>
		<div class="linkbox">
			<div class="links">
				<div class="origin">
					<p>Check out Seth Coelen's original design over on dribbble</p>
					<a
						href="https://dribbble.com/shots/2464177-Daily-UI-067-Hotel-Booking"><i
						class="fa fa-dribbble"></i></a>
				</div>
				<div class="me">
					<p>Why not take a look at my other pens while you're here</p>
					<a href="http://codepen.io/lewisvrobinson"><i
						class="fa fa-codepen"></i></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>

<script src="js/booking.js"></script>




</body>
</html>
