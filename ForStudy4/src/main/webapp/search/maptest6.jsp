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
	top: 308px;
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


</head>
<body>
	<div>
 		<jsp:include page="../map.jsp"></jsp:include>
 	</div>
	<div class="searchdiv">
	  <form class="search" method="post" id="frm" action="search.do">
		<input type="text" class="searchTerm" placeholder="검색 예 : 강남구 수학" id="search" name="search"/>
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
                  <li><input type="radio" id="rb1" name="selector" onClick="inputString2('유아');changeSign(this.form.search)"> <label
                     for="rb1">유아</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb2" name="selector" onClick="inputString2('초등');changeSign(this.form.search)"> <label
                     for="rb2">초등</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb3" name="selector" onClick="inputString2('중등');changeSign(this.form.search)"> <label
                     for="rb3">중등</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb4" name="selector" onClick="inputString2('고등');changeSign(this.form.search)"> <label
                     for="rb4">고등</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb5" name="selector" onClick="inputString2('일반');changeSign(this.form.search)"> <label
                     for="rb5">일반</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb6" name="selector" onClick="inputString2('취미');changeSign(this.form.search)"> <label
                     for="rb6">취미</label>
                     <div class="check"></div></li>
                  
               </ul>
               <div class="radio-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	   	<i class="fa fa-pencil"></i>&nbsp;&nbsp;과목</div> 
               <ul id="rb1-1" style="display:none">
                  <li><input type="radio" id="rb1-1-1" name="selector2" onClick="inputString3('유치원');changeSign(this.form.search)"> <label
                     for="rb1-1-1">유치원</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb1-1-2" name="selector2" onClick="inputString3('영어유치원');changeSign(this.form.search)"> <label
                     for="rb1-1-2">영어유치원</label>
                     <div class="check"></div></li>
                  <li><input type="radio" id="rb1-1-3" name="selector2" onClick="inputString3('보육원');changeSign(this.form.search)"> <label
                     for="rb1-1-3">보육원</label>
                     <div class="check"></div></li>
               </ul>
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
                  <li><input type="radio" id="rb4-1-4" name="selector2" onClick="inputString3('사탐&과탐');changeSign(this.form.search)"> <label
                     for="rb4-1-4">사탐&과탐</label>
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
                  <li><input type="radio" id="rb6-1-4" name="selector2" onClick="inputString3('DIY');changeSign(this.form.search)"> <label
                     for="rb6-1-4">DIY</label>
                     <div class="check"></div></li>
               </ul>
            </div>

         </div>
      </div>
   </section>
   </form>
   <div class='aclist' align="center">
	<ul class='widget_ul'>
		
			<c:forEach var="d" items="${list }">
			<div class='widget'>
					<div class='widget__photo'><img src="img/no${d.ac_list_no }.png" width="55" height="55" 
					style="position:absolute; left:5px;"></div>
					<a href="searchdetail.do?no=${d.ac_mst_no}"><div class='widget__button'>
					<i class="fa fa-spinner fa-pulse fa-lg margin-bottom"></i>&nbsp;&nbsp;상세정보&nbsp;&nbsp;&nbsp;&nbsp;</div></a>
					
					
					<div class='widget__details'>
						
						<div class='widget__badges'>
							<div class='widget__badge widget__badge--rating'>${d.ac_masterDTO.ac_reviewavg}</div>
							
						</div>
						<div class='widget__name'>
							<td class="detail" id="name_detail"><i class="fa fa-building-o" aria-hidden="true"></i>&nbsp;&nbsp;${d.ac_name}</td>
						</div>
						<%-- <div class='widget__type'>종류
							<td class="detail" id="type_detail"><%=d.getAc_class() %></td>
						</div> --%>
						<div class='widget__info'>
							<span><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;&nbsp;
								<td class="detail" id="add_detail">${d.ac_address}</td>
							</span> 
							<span><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;&nbsp;
								<td class="detail" id="tel_detail">${d.ac_tel}</td>
							 </span>
							 
						</div>
						<div class='widget__hidden'>
							<hr>
							
						</div>
					</div>
						<c:set var="list2" value="${d.ac_name}"/>
				
				<script>
					console.log("${list2}");
				</script>
				
				
				</div>
			</c:forEach>
			</ul>
			
					
		
			</div>
			<div class="page-button">
		<td align="right" valign="bottom">
         <a id="prev" href="search.do?page=${ curpage>1?curpage-1:curpage}&search=${search}">◀</a>&nbsp;
         <a id="next" href="search.do?page=${curpage<totalpage?curpage+1:curpage}&search=${search}" >▶</a>&nbsp;&nbsp;
         <c:if test="${totalpage==0 }">
         	${curpage=0 }
         </c:if>
         <c:if test="${totalpage!=0 }">
         ${ curpage }</c:if> page / ${ totalpage} pages
        </td>
	</div>
 	<script src="js/search_radiobutton.js"></script>
   
<img src="img/ad5.gif" style="position:fixed; right:20px; top:365px; height:550px; cursor:pointer;" onclick="window.open('http://www.mimacstudy.com/main/main.ds')">

</body>
</html>