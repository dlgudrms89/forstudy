<span class=""></span><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
    <jsp:useBean id="dao" class="com.sist.dao.AcinfoDAO"/>
	<jsp:useBean id="dto" class="com.sist.dao.AcinfoDTO"></jsp:useBean>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id=(String)session.getAttribute("id");
    String nick=(String)session.getAttribute("nick");
%>
<%
   	 	request.setCharacterEncoding("UTF-8");
    	//BoardDAO dao=BoardDAO.newInstance();
    	String search = request.getParameter("search");
    	int curpage=0;
	    int totalpage=0;
	    String strPage=request.getParameter("page");
    	if(strPage==null)
    		strPage="1";
    	curpage=Integer.parseInt(strPage);
    	List<AcinfoDTO> list=dao.AcinfoSearchPage(search,curpage);
    	totalpage=dao.AcinfoTotal(search);
    	System.out.println(search);
%> 
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
<script type="text/javascript">
function policies(){
	
	window.open("policies.jsp")
}
</script>
	<script type="text/javascript">
	$(function(){
		
		$('#logBtn').click(function(){
			var id=$('#id').val();
			if(id.trim()=="")
			{
				$('#id').focus();
				return;
			}
			
			var pwd=$('#pwd').val();
			if(pwd.trim()=="")
			{
				$('#pwd').focus();
				return;
			}
			
			$('#logfrm').submit();
		});
	});
</script>
<script type="text/javascript">
    $(function() {
 
    $("#joinBtn").click(function() {
       
            //alert("ok");
            if ($('#id').val() == "") {
                alert("아이디를 입력하세요");
                $('#id').focus();
                return;
            } else if ($('#pwd').val() == "") {
                alert("비밀번호를 입력하세요");
                $('#pwd').focus();
                return;
            } else if ($('#nick').val() == "") {
                alert("닉네임을 입력하세요!");
                $('#nick').focus();
                return;
            } else if ($('#email').val() == "") {
                alert("이메일을 입력하세요!");
                $('#email').focus();
                return;
            } else if ($('#m_agree').val() == "") {
                alert("약관동의에 체크하세요");
                $('#m_agree').focus();
                return;
            } else {
                alert("회원가입이 완료되었습니다");
            }
 
        });
  
    });
   
</script>
<script type="text/javascript">
	$(function(){
		$('#logoutBtn').click(function(){
			$('#logfrm').submit();
		});
	});
</script>
	<style type="text/css">
	html{
		background-image:url("img/back2.gif");
	}
		.pic{
			 text-align : center
		}
		h1,
        label,
        p {
            color: #fff;
            font-style: inherit;
            top: -112px;
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
								<h1 class="logofont"><a href="main.jsp">4STUDY</a></h1>
								<ul>
									<li id="notice"><b><i class="fa fa-volume-up" aria-hidden="true"></i>&nbsp;&nbsp;전국 모든 학원을 한눈에! 학원검색 전문 사이트 '포스터디 닷컴'</b></li>
								</ul>
								<ul class="login_join">
								<%
									if(id==null)
									{
								%>
									<li id="cd-cart-trigger2"><b>로그인</b></li>
									<li id="cd-cart-trigger"><b>간편회원가입</b></li>
								<%
									}else{
								%>		
									<form method=post action="firstlogout_ok.jsp" id="logfrm">
									<li><b><%=nick %>님 환영합니다</b></li>
									<button id="logoutBtn" style="border: 1; padding:1px; border-color: #fff; cursor: pointer; font-size: 11px;"><b>로그아웃</b></button>
									</form>
								<%	
									}
								%>
			    					
								</ul>
							</div>

						
					</div>
				</div>
		</div>
	<body class="homepage">

		<div class='video'></div>
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
			    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>		
					</div>
						
					</div>
				</div>
				<div class="searchdiv">
	  <form class="search" method="post" id="frm" action="main.jsp?mode=1">
		<input type="text" class="searchTerm" placeholder="검색 예 : 강남구 수학, 신촌 피아노" id="search" name="search"/>
		<input class="searchButton" type="submit" value="검색" id="searchbtn"/>
      
	</div>
		
			<!-- Main -->


			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<section>
							<a href="main.jsp" class="button"><b>홈페이지 바로가기</b></a>								
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
      	<form method=post action="firstlogin_ok.jsp" id="logfrm" name="logfrm">
        <div class="login__row">
          <i class="fa fa-user fa-lg fa-inverse" aria-hidden="true"></i>
          <input type="text" class="login__input name" placeholder="ID" name="id" id="id"/>
        </div>
        <div class="login__row">
          <i class="fa fa-lock fa-lg fa-inverse" aria-hidden="true"></i>
          <input type="password" class="login__input pass" placeholder="Password" name="pwd" id="pwd"/>
        </div>
       
        <button id="logBtn" name="logBtn" class="login__submit">Login</button>
	       </form>
	      </div>
	    </div>
    
      </div>
		
	</div> <!-- cd-cart -->
	
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
                    <form class="form-horizontal" name="joinfrm" id="joinfrm" action="join_ok.jsp">
                        <div class="form-group">
                            <div class="col-sm-6"> 
                                <input type="id" class="form-control" id="id" name="id" placeholder="아이디">
                                <span class="input-group-btn">
						      <button class="btn btn-success" id="idCheck" name="idCheck" onclick="idCheck()">중복체크</button>
						     </span>
                             </div> 
                        </div>
                        <p></p>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호">
                                <p class="help-block">8자 이상으로 작성하세요.</p>
                          </div> 
                        </div>
                                                                      
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임">
                                  <span class="input-group-btn">
						      <button class="btn btn-success" name="nickCheck" id="nickCheck" onclick="nickCheck()">중복체크</button>
						     </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
                               <p></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6 checkbox">
                                <label>
				        <input id="m_agree" type="checkbox" name="m_agree" value="1"> 
				        <a href="#" onclick="policies()" class="m_agree_text"> 이용약관</a> <a class="m_agree_text">에 동의합니다.</a>
				    </label>
                            </div>
                        </div>
                        <p></p>
                       <p></p>
                                
				 <input type="submit" class="checkout-btn" name="joinBtn" id="joinBtn" value=회원가입>
                    </form>
               <!--  </article> -->
            <!-- </div> -->
           
	</div> <!-- cd-cart -->
	<jsp:include page="widget.jsp"></jsp:include>
</html>