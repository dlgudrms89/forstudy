<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>left menu</title>
<meta name="description"
	content="Blueprint: A basic template for a responsive multi-level menu" />
<meta name="keywords"
	content="blueprint, template, html, css, menu, responsive, mobile-friendly" />
<meta name="author" content="Codrops" />

<!-- demo styles -->
<link rel="stylesheet" type="text/css" href="css/content.css" />
<!-- menu styles -->
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<script src="js/modernizr-custom.js"></script>
<!-- 아이콘 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<%
	request.setCharacterEncoding("EUC-KR");
	String id=(String)session.getAttribute("id");
	String log_jsp="";
	if(id==null)
	{
		log_jsp="mainlogin.jsp";
	}
	else
	{
		log_jsp="mainlogout.jsp";
	}
%>
</head>
<body>
<!-- Main container -->
	<div class="container">
		<!-- Blueprint header -->
		<header class="bp-header cf">
			<div class="dummy-logo">
<!-- 				<div class="logo"> -->
					<a href="firstpage.jsp"><img src="img/simplelogo.png" border="0" width=100%
						height=100% align=top></a>
<!-- 				</div> -->
			</div>
<!-- 			<div class="logo-shadow"></div> -->
		</header>
		<button class="action action--open" aria-label="Open Menu">
			<span class="icon icon--menu"></span>
		</button>

		<nav id="ml-menu" class="menu">
		<section>
		 <jsp:include page="<%=log_jsp %>"></jsp:include>
	   	</section>
		<section>
			<div id="search_news">
				<ul>
					<a href="main.jsp"><li class="menu__search_news"><i class="fa fa-home fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;홈
						</li></a>
					<a href="main.jsp?mode=1"><li class="menu__search_news"><i class="fa fa-search"></i>&nbsp;&nbsp;학원
						검색</li></a>
					<li class="menu__search_news"><i class="fa fa-newspaper-o"></i>&nbsp;&nbsp;교육
						뉴스</li>
					<a href="gallery.jsp"><li class="menu__search_news"><i class="fa fa-photo"></i>&nbsp;&nbsp;갤러리</li></a>
				</ul>
			</div>
		</section>
			<button class="action action--close" aria-label="Close Menu">
				<span class="icon icon--cross"></span>
			</button>
		<section>
			<div class="menu__wrap">
				<ul data-menu="main" class="menu__level">
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-1" href="#">초등</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-2" href="#">중등</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-3" href="#">고등</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-4" href="#">일반 &amp; 취미</a></li>
				</ul>
				<!-- Submenu 1 -->
				<ul data-menu="submenu-1" class="menu__level">
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-1-1" href="#" href="#">동부<br>강동,광진,성동,중랑,동대문
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-1-2" href="#" href="#">서부<br>강서,양천,금천,구로,마포
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-1-3" href="#" href="#">남부<br>관악,동작,강남,서초,송파,용산
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-1-4" href="#" href="#">북부<br>종로,강북,도봉,노원,성북
					</a></li>
				</ul>
				<!-- Submenu 1-1 -->
				<ul data-menu="submenu-1-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 1-2 -->
				<ul data-menu="submenu-1-2" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 1-3 -->
				<ul data-menu="submenu-1-3" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 1-4 -->
				<ul data-menu="submenu-1-4" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>

				<!-- Submenu 2 -->
				<ul data-menu="submenu-2" class="menu__level">
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-2-1" href="#" href="#">동부<br>강동,광진,성동,중랑,동대문
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-2-2" href="#" href="#">서부<br>강서,양천,금천,구로,마포
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-2-3" href="#" href="#">남부<br>관악,동작,강남,서초,송파,용산
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-2-4" href="#" href="#">북부<br>종로,강북,도봉,노원,성북
					</a></li>
				</ul>
				<!-- Submenu 2-1 -->
				<ul data-menu="submenu-2-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 2-2 -->
				<ul data-menu="submenu-2-2" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 2-3 -->
				<ul data-menu="submenu-2-3" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 2-4 -->
				<ul data-menu="submenu-2-4" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 3 -->
				<ul data-menu="submenu-3" class="menu__level">
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-3-1" href="#" href="#">동부<br>강동,광진,성동,중랑,동대문
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-3-2" href="#" href="#">서부<br>강서,양천,금천,구로,마포
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-3-3" href="#" href="#">남부<br>관악,동작,강남,서초,송파,용산
					</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-3-4" href="#" href="#">북부<br>종로,강북,도봉,노원,성북
					</a></li>
				</ul>
				<!-- Submenu 3-1 -->
				<ul data-menu="submenu-3-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 3-2 -->
				<ul data-menu="submenu-3-2" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 3-3 -->
				<ul data-menu="submenu-3-3" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 3-4 -->
				<ul data-menu="submenu-3-4" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">학생
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">학부모
							게시판</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 4 -->
				<ul data-menu="submenu-4" class="menu__level">
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-4-1" href="#">일반</a></li>
					<li class="menu__item"><a class="menu__link"
						data-submenu="submenu-4-2" href="#">취미</a></li>
				</ul>
				<!-- Submenu 4-1 -->
				<ul data-menu="submenu-4-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">공무원학원</a></li>
					<li class="menu__item"><a class="menu__link" href="#">어학</a></li>
					<li class="menu__item"><a class="menu__link" href="#">IT</a></li>
					<li class="menu__item"><a class="menu__link" href="#">자격증</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
				<!-- Submenu 4-2 -->
				<ul data-menu="submenu-4-2" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">댄스</a></li>
					<li class="menu__item"><a class="menu__link" href="#">음악</a></li>
					<li class="menu__item"><a class="menu__link" href="#">요리</a></li>
					<li class="menu__item"><a class="menu__link" href="#">DIY</a></li>
					<li class="menu__item"><a class="menu__link" href="#">익명게시판</a></li>
				</ul>
			</div>
			</section>
		</nav>
		
<%-- 		<jsp:include page="search_contents.jsp"></jsp:include> --%>
	</div>
	<!-- /view -->
	<script src="js/classie.js"></script>
	<script src="js/dummydata.js"></script>
	<script src="js/main.js"></script>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
	<script>
   (function() {
      var menuEl = document.getElementById('ml-menu'),
         mlmenu = new MLMenu(menuEl, {
            // breadcrumbsCtrl : true, // show breadcrumbs
            // initialBreadcrumb : 'all', // initial breadcrumb text
            backCtrl : false, // show back button
            // itemsDelayInterval : 60, // delay between each menu item sliding animation
            onItemClick: loadDummyData // callback: item that doesn´t have a submenu gets clicked - onItemClick([event], [inner HTML of the clicked item])
         });

      // mobile menu toggle
      var openMenuCtrl = document.querySelector('.action--open'),
         closeMenuCtrl = document.querySelector('.action--close');

      openMenuCtrl.addEventListener('click', openMenu);
      closeMenuCtrl.addEventListener('click', closeMenu);

      function openMenu() {
         classie.add(menuEl, 'menu--open');
      }

      function closeMenu() {
         classie.remove(menuEl, 'menu--open');
      }

      // simulate grid content loading
      var gridWrapper = document.querySelector('.content');

      function loadDummyData(ev, itemName) {
         ev.preventDefault();

         closeMenu();
         gridWrapper.innerHTML = '';
         classie.add(gridWrapper, 'content--loading');
         setTimeout(function() {
            classie.remove(gridWrapper, 'content--loading');
            gridWrapper.innerHTML = '<ul class="products">' + dummyData[itemName] + '<ul>';
         }, 700);
      }
   })();
   </script>
</body>
</html>