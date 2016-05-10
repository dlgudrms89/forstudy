<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>후원하기</title>
    
  </head>
  <link rel="stylesheet" href="css/donation.css">
<!--   <script src="js/donation.js"></script> -->
<script src="js/prefixfree.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<script>
// $(document).ready(function() {
// 	$('.button').click(function() {
// 		var $input=$('.set-amount');
// 		$input.value="1234";
// 		alert($input.value);
// 	});
// });
// var val='';
// function inputString(str){
// 	val=str;
	
// }
// function changeSign(input)
// {
// 	document.input.value=val;
// 	alert(input.value);
// }

function input(str){
       $(".set-amount").val(str);
}

</script>
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,700italic,400italic' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="donation-container">
            
            <div class="donation-box">
	            <div class="title">포스터디닷컴 후원</div>
	            
	            <div class="fields">
		            <input type="text" id="lastName" placeholder="성"> </input>
		            <input type="text" id="firstName" placeholder="이름"> </input>
		            <input type="text" id="accountNumber" placeholder="계좌번호"></input>
		            <input type="text" id="accountPW" placeholder="계좌비밀번호"></input>
		            <input type="text" id="email" placeholder="이메일"> </input>
	            </div>
	            
	            <div class="amount" id="amount">
	            <form class="aaa">
		            <div class="button" onClick="input('10000');">￦ 10,000</div>
		            <div class="button" onClick="input('30000');">￦ 30,000</div>
		            <div class="button" onClick="input('50000');">￦ 50,000</div>
		            <div class="wonFont"><input type="text" class="set-amount"/>원 결제</div>
	            </form>
	            </div>
	            
	            <div class="switch">
					<input type="radio" class="switch-input" name="view" value="One-Time" id="one-time" checked="">
					<label for="one-time" class="switch-label switch-label-off">One-Time</label>
					<input type="radio" class="switch-input" name="view" value="Monthly" id="monthly">
					<label for="monthly" class="switch-label switch-label-on">Monthly</label>
					<span class="switch-selection"></span>
			    </div>
			    
			    <div class="checkboxes">
					<input type="checkbox" id="receipt" class="checkbox" />
					<label for="receipt">메일로 영수증 발급</label>
			    </div>
			    
			    <div class="accountNumber">
				    신한은행 110-257-656399
			    </div>
	            
	            <a href="donation_thanks.jsp"><div class="donate-button"><i class="fa fa-credit-card"></i> 후 원 하 기</div></a>
            </div>
            
        </div>

<script src="https://raw.githubusercontent.com/jerryluk/jquery.autogrow/master/jquery.autogrow-min.js"></script>
</body>
    
    
  </body>
</html>
