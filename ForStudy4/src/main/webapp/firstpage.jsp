<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


          
<!DOCTYPE HTML>

<html>
   <head>
      <title>4STUDY</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta name="keywords" content="blueprint, template, html, css, menu, responsive, mobile-friendly" />
      <link rel="stylesheet" href="css/firstpage.css" />
      <script src="js/modernizr-custom.js"></script>
      <link rel="stylesheet" href="css/firstpage2.css" />
   <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
   <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700&Open+Sans:300,400' rel='stylesheet' type='text/css'>
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="css/mainlogo2.css">
    <link rel="stylesheet" href="css/mainlogo.css">
    <link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#logBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()==""){
			//$('#status').text("ID를 입력하세요");
			alert("ID를 입력하세요");
			$('#id').focus();
			location.reload();
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()==""){
			//$('#status').text("비밀번호를 입력하세요");
			alert("비밀번호를 입력하세요");
			$('#pwd').focus();
			location.reload();
			return;
		}
		param="id="+id+"&pwd="+pwd;
		sendMessage("POST", "firstlogin.do", param, loginCallback);
		$('#status').text("");
	});
	
	
	      $('#joinBtn').click(function() {
	          
	          //alert("ok");
	          if ($('#join_id').val() == "") {
	              alert("아이디를 입력하세요");
	              $('#join_id').focus();
	              return;
	          } else if ($('#join_pwd').val() == "") {
	              alert("비밀번호를 입력하세요");
	              $('#join_pwd').focus();
	              return;
	          } else if ($('#join_nick').val() == "") {
	              alert("닉네임을 입력하세요!");
	              $('#join_nick').focus();
	              return;
	          } else if ($('#join_email').val() == "") {
	              alert("이메일을 입력하세요!");
	              $('#join_email').focus();
	              return;
	          } else if ($('#join_m_agree').is(':checked')==false) {
	              alert("약관동의에 체크하세요");
	              $('#join_m_agree').focus();
	              return;
	          } else {
	        	  var id=$('#join_id').val();
	        	  var pwd=$('#join_pwd').val();
	        	  var nick=$('#join_nick').val();
	        	  var email=$('#join_email').val();
	        	  
	        	 
	        	  var param="id="+encodeURIComponent(id)+"&pwd="+encodeURIComponent(pwd)+"&nick="+encodeURIComponent(nick)+"&email="+encodeURIComponent(email);
	        	  				
	        	  sendMessage("POST", "join.do", param, memberjoin);
	              
	          }
	      });
     

	      $('#idCheck').click(function(){
	  		var id=$('#join_id').val();
	  		
	  		if(id.trim()==""){
	  			$('#join_id').focus();
	  			return;
	  		}
	  		var param="id="+id;
	  		sendMessage("POST", "idcheck.do", param, idcheck);
	  	});
	      $('#nickCheck').click(function(){
	  		var nick=$('#join_nick').val();
	  		
	  		if(nick.trim()==""){
	  			$('#join_nick').focus();
	  			return;
	  		}
	  		var param="nick="+nick;
	  		sendMessage("POST", "nickcheck.do", param, nickcheck);
	  	});
});
function idcheck(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var res=httpRequest.responseText;
			if(res.trim()=="0"){
				var r=$('#join_id').val()+"는(은) 사용 가능한 ID입니다"
				$('#idcheckmsg').text(r);
			}else{
				var r=$('#join_id').val()+"는(은) 이미 사용중인 ID입니다";
				$('#idcheckmsg').text(r);
			}
		}
	}
}
function nickcheck(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var res=httpRequest.responseText;
			if(res.trim()=="0"){
				var r=$('#join_nick').val()+"는(은) 사용 가능한  닉네임 입니다"
				$('#nickcheckmsg').text(r);
			}else{
				var r=$('#join_nick').val()+"는(은) 이미 사용중인 닉네임 입니다";
				$('#nickcheckmsg').text(r);
			}
		}
	}
}
function loginCallback(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){	
			var res=httpRequest.responseText;
			if(res.trim()=="NOID"){
				//$('#status').text("ID가 존재하지 않습니다");
				alert("ID가 존재하지 않습니다");
				location.reload();
			}
			else if(res.trim()=="NOPWD"){
				//$('#status').text("비밀번호가 틀립니다");
				alert("비밀번호가 틀립니다");
				location.reload();
			}else{
				//$('#status').text("");
				location.href="main.do";
				
			}
		}
	}
}
function memberjoin(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			alert("회원가입이 완료되었습니다");
			location.reload();
		}
	}
}
function policies() {
	   var left=( screen.availWidth - 500 ) / 2;
	   var top=( screen.availHeight - 500 ) / 2;
	   var state="status=0,toolbar=no,location=no,menubar=no,resizable=0,width=500,height=500,left="
	            +left+",top="+top;
	   var win = window.open('policies.jsp','popup',state);         
	   win.focus();  
	 };

</script>

   <style type="text/css">
   html{
      background-image:url("img/back2.gif");
   }
      .pic{
          text-align : center
      }
     .help-block{
          top: -75px;
      }
      label{
      top:-120px;
      }
      h1,
        label,
        p {
            color: #fff;
            font-style: inherit;
            
        }
        .page-header{
           text-indent : 15%;
        }
        .form-horizontal{
           text-indent : 20%;
        }
        p {
           font-size: 9pt;
        }
        #joinfont
        {
           top: -88px;
           font-size: 14pt;
           color: #fff;
        }
        #join_m_agree{
        top:65px;
        }
         /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      main {
  
  overflow: hidden;
  background-color: white;
  border-radius: .4rem .4rem .2rem .2rem;
}
main section {
margin-left:auto;
        margin-right:auto;

  padding: 3rem;
  min-height: 15rem;
  background-size: cover;
  background-attachment: fixed;
  background-repeat: no-repeat;
  background-position: center center;
  background-image:url("img/back.jpg");
}
main section p {
  max-width: 75%;
  margin: 0 auto;
  margin-bottom: 4rem;
  font-size: 1.412rem;
  line-height: 1.618;
  font-family: "Open Sans", sans-serif;
}
main section .img, main section + .img {
  min-height: 45rem;
  background-color: gainsboro;
  background-size: cover;
  background-attachment: static;
  background-repeat: no-repeat;
  background-position: center center;
}
main section.includes-dimming {
  min-height: 45rem;
}
main section.includes-dimming:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 130, 158, 0.65);
  z-index: 0;
}
main section.includes-dimming * {
  color: white !important;
}
main section.includes-dimming .section__title {
  display: inline-block;
}
main section.includes-dimming .section__subtitle {
   
  display: block;
}
main section .section__title,
main section .section__subtitle {
 font-family: 'Lobster', cursive;
  font-weight: 700;

}
main section .section__title {

  text-align: center;
  margin-bottom: 1.618rem;
  font-size: 3.2rem;
  text-transform: uppercase;
}
main section .section__title.includes-animated-border {
align-items: center;
  padding: 2rem;
  letter-spacing: 10px;
  text-indent: 10px;
  box-shadow: inset -.4rem 0 0 0 transparent, inset .4rem 0 0 0 transparent;
  animation: fadeInBorders 0.48s 1.9s ease-in-out forwards;
}
main section .section__title.includes-animated-border:before, main section .section__title.includes-animated-border:after {
  align:center;
  content: "";
  position: absolute;
  height: .4rem;
  width: 0%;
  background-color: white;
}
main section .section__title.includes-animated-border:before {
  left: 0;
  top: 0;
  animation: grow 2s ease-in-out forwards;
}
main section .section__title.includes-animated-border:after {
  bottom: 0;
  right: 0;
  animation: grow 2s ease-in-out forwards;
}
@keyframes grow {
  to {
    width: 100%;
  }
}
@keyframes fadeInBorders {
  to {
    box-shadow: inset -.4rem 0 0 0 white, inset .4rem 0 0 0 white;
  }
}
        
        
   </style>
   </head>
   <nav id="main-nav">
   
   </nav>
   <div id="page-wrapper">

         <!-- Header -->
            <div id="header">
               <div class="container">

                  <!-- Logo -->
                     <div id="logo">
                        <h1 class="logofont"><a href="main.do">4STUDY</a></h1>
                        <ul>
                           <li id="notice"><b><i class="fa fa-volume-up" aria-hidden="true"></i>&nbsp;&nbsp;전국 모든 학원을 한눈에! 학원검색 전문 사이트 '포스터디 닷컴'</b></li>
                        </ul>
                        <ul class="login_join">
                        
                          <c:if test="${sessionScope.id==null }">
                           <li id="cd-cart-trigger2"><b>로그인</b></li>
                           <li id="cd-cart-trigger"><b>간편회원가입</b></li>
                           </c:if>
                            
                          <c:if test="${sessionScope.id!=null }">
                          <form action="firstpagelogout.do">
	                           <li><b style="right:50px;">${sessionScope.nick }님 환영합니다</b></li>
	                           <button id="logoutBtn" style="border:1;padding:1px;border-color:#FFF;cursor:pointer;font-size:16px;top:-35px;right:-28px;padding:5px;"><b>로그아웃</b></button>
                           </form>
                           </c:if>
                       
                        </ul>
                     </div>

                  
               </div>
            </div>
      </div>
   <body class="homepage">

      
         <!-- Banner -->
            <div id="banner">
               <div class="container">
               <div class="logo">
                  
                   <main class="boxed" >
                   
           <section class="includes-dimming"  >
           
             <div class="centered-container" >
             
               <div class="section__title includes-animated-border">
                 4STUDY
               </div>
               <div class="section__subtitle" text-align="center">
                  Never put off till tomorrow what you can do today.
               </div>
             </div>
           </section>
         </main>
               </div>
                  
               </div>
            </div>
            <div class="searchdiv">
     <form class="search" method="post" id="frm" action="search.do">
      <input type="text" class="searchTerm" placeholder="검색 예 : 강남구 수학, 신촌 피아노" id="search" name="search"/>
      <input class="searchButton" type="submit" value="검색" id="searchbtn"/>
      </form>
   </div>
      
         <!-- Main -->


         <!-- Footer -->
            <div id="footer">
               <div class="container">
                  <section>
                     <a href="main.do" class="button"><b>홈페이지 바로가기</b></a>                        
                  </section>
               </div>   
            </div>   
            
         <!-- Copyright -->
                     <div class="copyright">
                        &copy; 4STUDY | 서울시 마포구 백범로 18 미화빌딩 2층 A강의장 <a href="#"></a>                        
                     </div>
                     

      

      <!-- Scripts -->
         <script src="js/jquery.min.js"></script>
         <script src="js/jquery.dropotron.min.js"></script>
         <script src="js/skel.min.js"></script>
         <script src="js/util.js"></script>
         <script src="js/main.js"></script>
         <script src="js/join.js"></script>
         <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
         <script src="js/firstpage.js"></script>
           <script src="js/login.js"></script>
           <script src="js/login2.js"></script> 
   </body>
   
   <!-- <header>
      <div id="cd-cart-trigger"><a class="cd-img-replace" href="#0"></a></div> 
   </header>-->
   <div id="cd-shadow-layer2"></div>

    <div id="cd-cart2">
     <div class="demo">
    <div class="login">
      <div class="login__check"></div>
      <div class="login__form">
         
        <div class="login__row">
          <i class="fa fa-user fa-lg fa-inverse" aria-hidden="true"></i>
          <input type="text" class="login__input name" placeholder="ID" name="id" id="id"/>
        </div>
        <div class="login__row">
          <i class="fa fa-lock fa-lg fa-inverse" aria-hidden="true"></i>
          <input type="password" class="login__input pass" placeholder="Password" name="pwd" id="pwd"/>
        </div>
        <div id=status></div>
       
        <button id="logBtn" name="logBtn" class="login__submit">Login</button>
         </div>
       </div>
    
      </div>
      
   </div>  <!-- cd-cart -->
   
   <!-- <header>
      <div id="cd-cart-trigger"><a class="cd-img-replace" href="#0"></a></div> 
   </header>-->
   <div id="cd-shadow-layer"></div>

   <div id="cd-cart">
      
          <!-- <div id="main"> -->
              <!--   <article class="container"> -->
                    <div class="page-header">
                    <div id="logo">
                    <span><img src="img/simplelogo.png" width="50" height="40"></span>
                    <b id="joinfont">간편회원가입</b>
                    </div>
                    </div>
                     
                        <div class="form-group">
                            <div class="col-sm-6"> 
                                <input type="id" class="form-control" id="join_id" name="join_id" placeholder="아이디">
                                <span class="input-group-btn">
                        <button class="btn btn-success" id="idCheck" name="idCheck">중복체크</button>
                       </span>
                        <p class="help-block" id="idcheckmsg">아이디</p>
                             </div> 
                        </div>
                        <p></p>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="join_pwd" name="join_pwd" placeholder="비밀번호">
                                 <p class="help-block">8자 이상 입력하세요</p>
                          </div> 
                        </div>
                                                                      
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="join_nick" name="join_nick" placeholder="닉네임">
                                  <span class="input-group-btn">
                        <button class="btn btn-success" name="nickCheck" id="nickCheck">중복체크</button>
                         <p class="help-block" id="nickcheckmsg">닉네임</p>
                       </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="join_email" name="join_email" placeholder="이메일">
                              
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6 checkbox">
                     <label> 
                    <input id="join_m_agree" type="checkbox" name="join_m_agree" value="1"> 
                   
                    <a href="#" onclick="policies()" class="m_agree_text"> 이용약관</a> <a class="m_agree_text">에 동의합니다.</a>
               </label>
                            </div>
                        </div>
                        <p></p>
                       <p></p>
                                
                  <input type="submit" class="checkout-btn" name="joinBtn" id="joinBtn" value=회원가입>
                
               <!--  </article> -->
            <!-- </div> -->
           
   </div> <!-- cd-cart -->
   <jsp:include page="main/widget.jsp"></jsp:include>
</html>