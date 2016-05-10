<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<link rel="stylesheet" href="css/compare.css">
<link href='https://fonts.googleapis.com/css?family=Lobster'
   rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/chartnormalize.css">
<link rel="stylesheet" href="css/chartstyle.css">
<script type="text/javascript" src="search/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
@import url("http://fonts.googleapis.com/earlyaccess/hanna.css");
#chartbutton {
    text-decoration: none;
    background: #30AF8C;
    color: white;
    padding: 1px 6px;
    font-size: 12px;
    border-radius: 6px;
    position: relative;
    left: 310px;
    top: 16px;
    width: 100px;
    height: 52px;
    font-family: 'hanna';
    font-size: 18px;
}
#map {
	position: relative;
	left: 15px;
	top: 10px;
	box-shadow: 5px 5px 5px #AAAAAA;
}
body{
	overflow-y: scroll;
}
.test1234{
width: 500px; 
height: 330px;

}
</style>
<script type="text/javascript">
$(function(){ // window.onload , $(document).ready(function(){})
	$('#chartbutton').click(function(){
		sendMessage("POST", "chart.do", null, showchart);	
	});	
	
	
});	   
function showchart(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#comparechart').html(httpRequest.responseText);
			
		}
	}
}


</script>
<body>
	<div>
 		<jsp:include page="../map.jsp"></jsp:include>
 		
 	</div>
 	
   <table class="tablesorter-bootstrap">
   
      <thead>
         <tr>
            <th class="filter-select filter-exact" data-placeholder=" 학원명 ">학원명</th>
            <th class="filter-select filter-exact" data-placeholder=" 과목명">과목명</th>
            <th class="filter-select filter-exact" data-placeholder=" 교습비">교습비</th>
            <th class="filter-select filter-exact" data-placeholder=" 정원">정원</th>
            <th class="filter-select filter-exact" data-placeholder=" 교습기간 ">교습기간</th>
            <th class="filter-select filter-exact" data-placeholder=" 분야">분야</th>
            <th class="filter-select filter-exact" data-placeholder=" 강사수">강사수</th>
            <th class="filter-select filter-exact" data-placeholder=" 평점">평점</th>
      </thead>
      <tfoot>
         <tr>
            <th>학원명</th>
            <th>과목명</th>
            <th>교습비</th>
            <th>정원</th>
            <th>교습기간</th>
            <th>분야</th>
            <th>강사수</th>
            <th>평점</th>
         </tr>
      </tfoot>
      <tbody>
      <c:forEach var="d" items="${list}">
         <tr>
            <td>${d.ac_list_no }. ${d.ac_name }</td>
            <td>${d.ac_class }</td>
            <td>${d.ac_totalval }</td>
            <td>${d.ac_inwon }</td>
            <td>${d.ac_time }</td>
            <td>${d.ac_field }</td>
            <td>${d.ac_teacher }</td>
            <td>${d.ac_masterDTO.ac_reviewavg}</td>
         </tr>
      </c:forEach>   
      </tbody>
   </table>
   <!-- include -->
   <button id="chartbutton" name="chartbutton" onclick="chartbutton()">
   <i class="fa fa-bar-chart" aria-hidden="true"></i>&nbsp;차트보기</button>
    <div class="test1234" id="comparechart">
      <jsp:include page="chart.jsp"></jsp:include> 
   </div>  
   
   
   <script
      src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   <script
      src='http://mottie.github.com/tablesorter/js/jquery.tablesorter.js'></script>
   <script
      src='http://mottie.github.com/tablesorter/js/jquery.tablesorter.widgets.js'></script>
   <script
      src='http://mottie.github.com/tablesorter/addons/pager/jquery.tablesorter.pager.js'></script>

   <script src="js/compare.js"></script>
   
   
   
   
   <!--  map function -->
   
</body>
</html>