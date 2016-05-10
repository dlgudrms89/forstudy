<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>

   	
<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
* 
div .searchdiv {
	left: 100px;
	position: relative;
}

#map {
	position: relative;
	left: 15px;
	top: 10px;
	box-shadow: 5px 5px 5px #AAAAAA;
}

{
-moz-box-sizing
:
 
border-box
;

   
-webkit-box-sizing
:
 
border-box
;

   
box-sizing
:
 
border-box
;


}
section .wrapper, .content, .expander, .arrow-down, .toggle-all span {
	-webkit-transition: all .22s linear;
	-moz-transition: all .22s linear;
	-o-transition: all .22s linear;
	transition: all .22s linear;
}

.expander {
	width: 130px;
	top: 309px;
	height: 40px;
	background: #00829E;
	color: rgba(255, 255, 255, 0.8);
	padding-top: 8px;
	padding-left: 13px;
	float: left;
	cursor: pointer;
	position: absolute;
	left: 290px;
	box-shadow: 5px 5px 5px #AAAAAA;
}

section .expander:hover {
	color: rgba(255, 255, 255, 1);
	background: #038dab;
}

section .expander.active {
	color: #fff;
}

section .expander.active:hover {
	background: #038dab;
	color: rgba(255, 255, 255, 0.8);
}

section .active .arrow-down {
	-moz-transform: rotate(180deg);
	-ms-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	-webkit-transform: rotate(180deg);
	transform: rotate(180deg);
}

section .arrow-down {
	width: 0;
	height: 0;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
	border-top: 8px solid rgba(255, 255, 255, 0.8);
	position: absolute;
	right: 10px;
	top: 17px;
	margin-right: 3px;
}

section .expander:hover .arrow-down {
	border-top: 8px solid rgba(255, 255, 255, 1);
}

/* the magic */
.wrapper {
	float: left;
	width: 770px;
	overflow: hidden;
	background: #FFFFFF; /*라디오버튼 배경*/
	margin-bottom: 2em;
	margin-top: -380px;
	margin-left: 290px;
	box-shadow: 5px 5px 5px #AAAAAA;
	z-index: 9;
	position: relative;
}

section .content {
	margin-top: -100%;
}

section .wrapper.open .content {
	margin-top: 0;
}

div .searchdiv {
	left: 100px;
	position: relative;
}

</style>

<script src="js/prefixfree.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<script src='js/ac_total_count.js'></script>
<script>

var val1='';
var val2='';
var val3='';

function inputString1(str)
{
	//var val='';
	if(str!='')
	{
		val1=str;	
	}
}
function inputString2(str)
{
	//var val='';
	if(str!='')
	{
		val2=str;	
	}
}
function inputString3(str)
{
	//var val='';
	if(str!='')
	{
		val3=str;	
	}
}
function changeSign(input){
	input.value = val1+' '+val2+' '+val3;
}
</SCRIPT>
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/ac_list_normalize.css">
<link rel="stylesheet" href="css/ac_list.css">
<link rel="stylesheet" href="css/starStyle.css">
 
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
</head>
<link rel="stylesheet" type="text/css" href="css/search_radiobutton.css" />
<link rel="stylesheet" type="text/css" href="css/user_count.css" />
<script src="js/recommend.js"></script>

<script type="text/javascript"></script>
<link rel="stylesheet" href="css/recommend.css">
<link rel="stylesheet" href="css/weather.css">
</head>
<body>
 
      
	<div>
 		<jsp:include page="../map.jsp"></jsp:include>
 	</div>

	<div class="searchdiv">
	  <form class="search" method="post" id="frm" action="search.do">
		<input type="text" class="searchTerm" placeholder="검색 예 : 강남구 수학, 신촌 피아노" id="search" name="search"/>
		<input class="searchButton" type="submit" value="검색" id="searchbtn"/>
      
	</div>
	<section id="search_radio">

      <h3 class="expander">
         	상세검색
         <div class="arrow-down"></div>
      </h3>
      
      <div class="wrapper">
         <div class="content">
            <div class="container">
           	   	<div class="radio-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	   	<i class="fa fa-globe"></i>&nbsp;&nbsp;지역</div> 
               <ul id="rb0">
                  <li><input id="cba1" name="selector1" type="radio" onClick="inputString1('강남구');changeSign(this.form.search)"><label
                     for="cba1">강남</label>
                     <div class="check"></div></li>
                  <li><input id="cba2" name="selector1" type="radio" onClick="inputString1('강동구');changeSign(this.form.search)"><label
                     for="cba2">강동</label>
                     <div class="check"></div></li>
                  <li><input id="cba3" name="selector1" type="radio" onClick="inputString1('강북구');changeSign(this.form.search)"><label
                     for="cba3">강북</label>
                     <div class="check"></div></li>
                  <li><input id="cba4" name="selector1" type="radio" onClick="inputString1('강서구');changeSign(this.form.search)"><label
                     for="cba4">강서</label>
                     <div class="check"></div></li>
                  <li><input id="cba5" name="selector1" type="radio" onClick="inputString1('관악구');changeSign(this.form.search)"><label
                     for="cba5">관악</label>
                     <div class="check"></div></li>
                  <li><input id="cba6" name="selector1" type="radio" onClick="inputString1('광진구');changeSign(this.form.search)"><label
                     for="cba6">광진</label>
                     <div class="check"></div></li>
                  <li><input id="cba7" name="selector1" type="radio" onClick="inputString1('구로구');changeSign(this.form.search)"><label
                     for="cba7">구로</label>
                     <div class="check"></div></li>
                  <li><input id="cba8" name="selector1" type="radio" onClick="inputString1('금천구');changeSign(this.form.search)"><label
                     for="cba8">금천</label>
                     <div class="check"></div></li>
                  <li><input id="cba9" name="selector1" type="radio" onClick="inputString1('노원구');changeSign(this.form.search)"><label
                     for="cba9">노원</label>
                     <div class="check"></div></li>
                  <li><input id="cba10" name="selector1" type="radio" onClick="inputString1('도봉구');changeSign(this.form.search)"><label
                     for="cba10">도봉</label>
                     <div class="check"></div></li>
                  <li><input id="cba11" name="selector1" type="radio" onClick="inputString1('동대문구');changeSign(this.form.search)"><label
                     for="cba11">동대문</label>
                     <div class="check"></div></li>
                  <li><input id="cba12" name="selector1" type="radio" onClick="inputString1('동작구');changeSign(this.form.search)"><label
                     for="cba12">동작</label>
                     <div class="check"></div></li>
                  <li><input id="cba13" name="selector1" type="radio" onClick="inputString1('마포구');changeSign(this.form.search)"><label
                     for="cba13">마포</label>
                     <div class="check"></div></li>
                  <li><input id="cba14" name="selector1" type="radio" onClick="inputString1('서대문구');changeSign(this.form.search)"><label
                     for="cba14">서대문</label>
                     <div class="check"></div></li>
                  <li><input id="cba15" name="selector1" type="radio" onClick="inputString1('서초구');changeSign(this.form.search)"><label
                     for="cba15">서초</label>
                     <div class="check"></div></li>
                  <li><input id="cba16" name="selector1" type="radio" onClick="inputString1('성동구');changeSign(this.form.search)"><label
                     for="cba16">성동</label>
                     <div class="check"></div></li>
                  <li><input id="cba17" name="selector1" type="radio" onClick="inputString1('성북구');changeSign(this.form.search)"><label
                     for="cba17">성북</label>
                     <div class="check"></div></li>
                  <li><input id="cba18" name="selector1" type="radio" onClick="inputString1('송파구');changeSign(this.form.search)"><label
                     for="cba18">송파</label>
                     <div class="check"></div></li>
                  <li><input id="cba19" name="selector1" type="radio" onClick="inputString1('양천구');changeSign(this.form.search)"><label
                     for="cba19">양천</label>
                     <div class="check"></div></li>
                  <li><input id="cba20" name="selector1" type="radio" onClick="inputString1('영등포구');changeSign(this.form.search)"><label
                     for="cba20">영등포</label>
                     <div class="check"></div></li>
                  <li><input id="cba21" name="selector1" type="radio" onClick="inputString1('용산구');changeSign(this.form.search)"><label
                     for="cba21">용산</label>
                     <div class="check"></div></li>
                  <li><input id="cba22" name="selector1" type="radio" onClick="inputString1('은평구');changeSign(this.form.search)"><label
                     for="cba22">은평</label>
                     <div class="check"></div></li>
                  <li><input id="cba23" name="selector1" type="radio" onClick="inputString1('종로구');changeSign(this.form.search)"><label
                     for="cba23">종로</label>
                     <div class="check"></div></li>
                  <li><input id="cba24" name="selector1" type="radio" onClick="inputString1('중구');changeSign(this.form.search)"><label
                     for="cba24">중구</label>
                     <div class="check"></div></li>
                  <li><input id="cba25" name="selector1" type="radio" onClick="inputString1('중랑구');changeSign(this.form.search)"><label
                     for="cba25">중랑</label>
                     <div class="check"></div></li>
               </ul>
               	<div class="radio-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               	<i class="fa fa-male"></i>&nbsp;&nbsp;연령</div>
               <ul id="rb0-1">
<!--                   <li><input type="radio" id="rb1" name="selector"> <label -->
<!--                      for="rb1">유아</label> -->
<!--                      <div class="check"></div></li> -->
                  <li><input type="radio" id="rb2" name="selector" onClick="inputString2('초등');changeSign(this.form.search)"> <label
                     for="rb2">초등</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb3" name="selector" onClick="inputString2('중등');changeSign(this.form.search)"> <label
                     for="rb3">중등</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb4" name="selector" onClick="inputString2('고등');changeSign(this.form.search)"> <label
                     for="rb4">고등</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb5" name="selector"> <label
                     for="rb5">일반</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb6" name="selector"> <label
                     for="rb6">취미</label>
                     <div class="check"></div></li>
                  
               </ul>
               <div class="radio-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	   	<i class="fa fa-pencil"></i>&nbsp;&nbsp;과목</div> 
<!--                <ul id="rb1-1" style="display:none"> -->
<!--                   <li><input type="radio" id="rb1-1-1" name="selector2" onClick="inputString3('유치원');changeSign(this.form.search)"> <label -->
<!--                      for="rb1-1-1">유치원</label> -->
<!--                      <div class="check"></div></li> -->
<!--                   <li><input type="radio" id="rb1-1-2" name="selector2" onClick="inputString3('영어 유치원');changeSign(this.form.search)"> <label -->
<!--                      for="rb1-1-2">영어유치원</label> -->
<!--                      <div class="check"></div></li> -->
<!--                   <li><input type="radio" id="rb1-1-3" name="selector2" onClick="inputString3('보육원');changeSign(this.form.search)"> <label -->
<!--                      for="rb1-1-3">보육원</label> -->
<!--                      <div class="check"></div></li> -->
<!--                </ul> -->
               <ul id="rb2-1" style="display:none">
                  <li><input type="radio" id="rb2-1-1" name="selector2" onClick="inputString3('수학');changeSign(this.form.search)"> <label
                     for="rb2-1-1">수학</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb2-1-2" name="selector2" onClick="inputString3('국어');changeSign(this.form.search)"> <label
                     for="rb2-1-2">국어</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb2-1-3" name="selector2" onClick="inputString3('영어');changeSign(this.form.search)"> <label
                     for="rb2-1-3">영어</label>
                     <div class="check"></div></li>
               </ul>
               <ul id="rb3-1" style="display:none">
                  <li><input type="radio" id="rb3-1-1" name="selector2" onClick="inputString3('수학');changeSign(this.form.search)"> <label
                     for="rb3-1-1">수학</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb3-1-2" name="selector2" onClick="inputString3('국어');changeSign(this.form.search)"> <label
                     for="rb3-1-2">국어</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb3-1-3" name="selector2" onClick="inputString3('영어');changeSign(this.form.search)"> <label
                     for="rb3-1-3">영어</label>
                     <div class="check"></div></li>
               </ul>
               <ul id="rb4-1" style="display:none">
                  <li><input type="radio" id="rb4-1-1" name="selector2" onClick="inputString3('수학');changeSign(this.form.search)"> <label
                     for="rb4-1-1">수학</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb4-1-2" name="selector2" onClick="inputString3('영어');changeSign(this.form.search)"> <label
                     for="rb4-1-2">영어</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb4-1-3" name="selector2" onClick="inputString3('언어');changeSign(this.form.search)"> <label
                     for="rb4-1-3">언어</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb4-1-4" name="selector2" onClick="inputString3('논술');changeSign(this.form.search)"> <label
                     for="rb4-1-4">논술</label>
                     <div class="check"></div></li>
               </ul>
               <ul id="rb5-1" style="display:none">
                  <li><input type="radio" id="rb5-1-1" name="selector2" onClick="inputString3('공무원');changeSign(this.form.search)"> <label
                     for="rb5-1-1">공무원</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb5-1-2" name="selector2" onClick="inputString3('어학');changeSign(this.form.search)"> <label
                     for="rb5-1-2">어학</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb5-1-3" name="selector2" onClick="inputString3('IT');changeSign(this.form.search)"> <label
                     for="rb5-1-3">IT</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb5-1-4" name="selector2" onClick="inputString3('자격증');changeSign(this.form.search)"> <label
                     for="rb5-1-4">자격증</label>
                     <div class="check"></div></li>
               </ul>
               <ul id="rb6-1" style="display:none">
                  <li><input type="radio" id="rb6-1-1" name="selector2" onClick="inputString3('댄스');changeSign(this.form.search)"> <label
                     for="rb6-1-1">댄스</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb6-1-2" name="selector2" onClick="inputString3('음악');changeSign(this.form.search)"> <label
                     for="rb6-1-2">음악</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb6-1-3" name="selector2" onClick="inputString3('요리');changeSign(this.form.search)"> <label
                     for="rb6-1-3">요리</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb6-1-4" name="selector2" onClick="inputString3('미술');changeSign(this.form.search)"> <label
                     for="rb6-1-4">미술</label>
                     <div class="check"></div></li>
               </ul>
            </div>

         </div>
      </div>
   </section>
   </form>
<div class="belt">
	
		<div id="carousel">
			<figure>
			<a href="searchdetail.do?no=11684">
				<img src="img/대성학원.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="searchdetail.do?no=14629">
				<img src="img/종로학원.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="searchdetail.do?no=8226">
				<img src="img/비타에듀.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="searchdetail.do?no=13753">
				<img src="img/메가스터디.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="searchdetail.do?no=12672">
				<img src="img/한솔요리학원.JPG" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="searchdetail.do?no=10302">
				<img src="img/pagoda.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="searchdetail.do?no=861">
				<img src="img/TOPIA.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="searchdetail.do?no=9008">
				<img src="img/YBM.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://www.sist.co.kr/index.do">
				<img src="img/sist.jpg" class="best" alt=""></a>
			</figure>
		</div>
			
	</div>
	<div id="q1"><h3><i class="fa fa-child fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;베스트 게시물</h3>
	</div>
	<c:forEach var="i" begin="1" end="5" step="1">
	<div id="gesipan" onclick="location.href='boardcontent.do?no=${topBoard.get(i-1).no}'">
		<table id="table_content2">
		(${i})&nbsp;&nbsp;${topBoard.get(i-1).subject} </br>
		&nbsp;&nbsp;&nbsp;조회수 : ${topBoard.get(i-1).hit}
<%-- 		(${j}) ${topBoard.get(j-1).subject} --%>
		</table>
	</div>
	</c:forEach>
	<div id="q2"><h3><i class="fa fa-trophy fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;BEST 학원</h3>
	</div>
	<c:forEach var="i" begin="1" end="5" step="1">
	<div id="gesipan2" onclick="location.href='searchdetail.do?no=${topAcinfo.get(i-1).ac_mst_no}'">
      <table id="table_content2">
      (${i})&nbsp;&nbsp;${topAcinfo.get(i-1).ac_name}
      
      <c:choose>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=10}">
             <span class="ratings"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=9}">
             <span class="ratings fourhalf"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=8}">
             <span class="ratings four"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=7}">
             <span class="ratings threehalf"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=6}">
             <span class="ratings three"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=5}">
             <span class="ratings twohalf"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=4}">
             <span class="ratings two"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:when test="${topAcinfo.get(i-1).ac_reviewavg>=3}">
             <span class="ratings onehalf"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:when>
          <c:otherwise>
             <span class="ratings one"></span>(${topAcinfo.get(i-1).ac_review_count}명)
          </c:otherwise>
       </c:choose>
      
      </br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${topAcinfo.get(i-1).ac_field}
      </table>
   </div>
	</c:forEach>
	
	<div id="globalFooter">
           <div class="certification">
   
      </div>
      <div class="g_inner clearfix">
         <div class="foot_info">
            
     
            <address>
               본사 : 서울특별시 마포구 대흥동 107-111 미화빌딩 2층 A강의장 4STUDY<span>|</span>대표이사 이형근<span>|</span>e-mail : admin@4study.com<span>|</span><br>
               사업자등록번호 111-11-11111<span>|</span>대표전화 : 1111-1111<span>|</span>고객센터 : 미화빌딩 2층 A강의장<span>|</span>개인정보 보호책임자 : 이형근<br>
               <p>4STUDY는 고객정보 보안에 만전을 기하고 있습니다. <em class="copy">Copyright (c) 4STUDY All rights reserved.</em></p>
            </address>
         </div>
      </div>
      
       </div> 
<div class="count_wrapper">
    <div class="counter col_fourth">
      <i class="fa fa-building-o fa-2x"></i>
      <h2 class="timer count-title" id="count-number" data-to="14685" data-speed="200"></h2>
      <p class="count-text ">학원</p>
    </div>

    <div class="counter col_fourth">
      <i class="fa fa-pencil fa-2x"></i>
      <h2 class="timer count-title" id="count-number" data-to="107148" data-speed="500"></h2>
      <p class="count-text ">클래스</p>
    </div>
<div class="user_count_box">
<br>
&nbsp;&nbsp;&nbsp;접속자수
</div>
<div class="user_count">
	<script id="_wau5tw">
		var _wau = _wau || [];
		_wau.push(["colored", "ilgnzfvp111e", "5tw", "ffffff000000"]);
		(function() {var s=document.createElement("script"); s.async=true;
		s.src="http://widgets.amung.us/colored.js";
		document.getElementsByTagName("head")[0].appendChild(s);
		})();
	</script>
</div>
<div class='weather-app'>
		<div class='weather-app_main'>
			<div class='weather-app_main__information'>
				<img class='weather-app_main__information--icon' src='#'>
				<h1>서울</h1>
				<h2 class='weather-app_main__information--temperature'></h2>
				<h3 class='weather-app_main__information--description'></h3>
			</div>
		</div>
</div>
</div>

<script src="js/weather.js"></script>
<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
 	<script src="js/search_radiobutton.js"></script>
   


</body>
</html>