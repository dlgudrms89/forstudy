<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
    <jsp:useBean id="dao" class="com.sist.dao.AcinfoDAO"/>
	<jsp:useBean id="dto" class="com.sist.dao.AcinfoDTO"></jsp:useBean>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
	top: 345px;
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

<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
</head>
<link rel="stylesheet" type="text/css" href="css/search_radiobutton.css" />
<link rel="stylesheet" type="text/css" href="css/user_count.css" />
<script src="js/recommend.js"></script>

<script type="text/javascript"></script>
<link rel="stylesheet" href="css/recommend.css">
</head>
<body>
 
      
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width: 60%; height: 350px;; left: 290px; top: -386px;">	
</div>

	<div class="searchdiv">
	  <form class="search" method="post" id="frm" action="main.jsp?mode=1">
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
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=%EA%B0%95%EB%82%A8%EB%8C%80%EC%84%B1%ED%95%99%EC%9B%90">
				<img src="img/대성학원.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=종로학원">
				<img src="img/종로학원.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=%EA%B0%95%EB%82%A8%EB%B9%84%ED%83%80%EC%97%90%EB%93%80%ED%95%99%EC%9B%90">
				<img src="img/비타에듀.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=%EA%B0%95%EB%82%A8%EB%A9%94%EA%B0%80%EC%8A%A4%ED%84%B0%EB%94%94%EB%B3%B4%EC%8A%B5%EC%96%B4%ED%95%99%EC%9B%90">
				<img src="img/메가스터디.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=%ED%95%9C%EC%86%94%EC%9A%94%EB%A6%AC%ED%95%99%EC%9B%90">
				<img src="img/한솔요리학원.JPG" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=%ED%8C%8C%EA%B3%A0%EB%8B%A4%EC%9B%90%EC%A2%85%EB%A1%9C%ED%95%99%EC%9B%90">
				<img src="img/pagoda.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=%ED%86%A0%ED%94%BC%EC%95%84%EA%B3%A0%EB%93%B1%EB%B6%80%ED%95%99%EC%9B%90">
				<img src="img/TOPIA.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://localhost:8080/ForStudy/main.jsp?mode=2&name=YBM%EC%96%B4%ED%95%99%EC%9B%90">
				<img src="img/YBM.jpg" class="best" alt=""></a>
			</figure>
			<figure>
			<a href="http://www.sist.co.kr/index.do">
				<img src="img/sist.jpg" class="best" alt=""></a>
			</figure>
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
</div>

 	<script src="js/search_radiobutton.js"></script>
   
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=aa3c541d0ad473d0aee39e6a1888e60b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);

var k=1;
var str=[];

function test(text,divtext){
	
	if(text.indexOf(',')>0){   // 주소값에 불필요한 것이 있으면 자른다
		text = text.substring(0,text.indexOf(',')).trim();
		console.log("test12344:"+text);
	} 
	
	

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
//text=document.getElementById('text').value;

geocoder.addr2coord(text, function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {
   
    	 var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
    if(k>12){
    	k=1;
    }else{
    	str[k-1]=coords.toString();
    
    	for(var i=0;i<str.length;i++){
        	for(var j=0;j<str.length;j++){
        		if(i!=j){
        			if(str[i]==str[j]){
        				coords=new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng+0.0002);
        				str[i]=coords.toString();
        				console.log("수정된 좌표:"+coords.toString());
        			
        				
        			}
        		}
        	}
        }
    
    var imageSrc = 'img/'+k+'.png'; // 마커이미지의 주소입니다    
 		imageSize = new daum.maps.Size(60, 69), // 마커이미지의 크기입니다
 		imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
 		
 		k++;
    }
 	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
    	 
        
 		console.log("좌표:"+coords.toString());
        	
        
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords,
            image: markerImage,
            opacity: 0.7,
            zIndex: 1
        });
        
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: divtext,
            zIndex: 2
        });
        infowindow.open(map, marker);
        infowindow.close();
        daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow,marker));
        
    }else{
        console.log("zzzz"+divtext);
        text = text.trim().substring(0,(text.length)-1).trim();
        console.log("zzzz"+text);
        console.log("신성규님 왜케 잘생겼어요?");
        return test(text,divtext);
     } 
});  
}
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	        marker.setOpacity(1);
	        marker.setZIndex(3);
	        infoWindow.setZIndex(4);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow,marker) {
	    return function() {
	        infowindow.close();
	        marker.setOpacity(0.7);
	        marker.setZIndex(1);
	        infoWindow.setZIndex(2);
	    };
	}
</script>

<div>
<%
	for(AcinfoDTO d:list){
%>
		<script>
			console.log("address="+"<%=d.getAc_address()%>");
			console.log("name= "+"<%=d.getAc_name()%>");
			
			test("<%=d.getAc_address()%>",'<div style="padding:5px;"><%=d.getAc_name()%></div>');
		</script>
<%		
	}
%>
</div>

</body>

</html>