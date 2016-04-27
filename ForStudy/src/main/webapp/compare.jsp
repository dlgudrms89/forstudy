<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*,java.util.*"%>
    <jsp:useBean id="dao" class="com.sist.dao.AcinfoDAO"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
       List<AcinfoDTO> list=(ArrayList<AcinfoDTO>)session.getAttribute("list");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel='stylesheet prefetch' -->
<!--    href='http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css'> -->

<link rel="stylesheet" href="css/compare.css">
<link href='https://fonts.googleapis.com/css?family=Lobster'
   rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/chartnormalize.css">
<link rel="stylesheet" href="css/chartstyle.css">
<style type="text/css">
.test1234{
   float:right;
   vertical-align: bottom;
   position: absolute;
   width:500px;
   height:500px;
   top:620px;
   left: 500px;
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
</style>
<body>
	<div id="map"
		style="width: 60%; height: 350px;; left: 290px; top: -386px;"></div>
   <table class="tablesorter-bootstrap">
      <thead>
         <tr>
            <th class="filter-select filter-exact" data-placeholder=" �п��� ">�п���</th>
            <th class="filter-select filter-exact" data-placeholder=" �����">�����</th>
            <th class="filter-select filter-exact" data-placeholder=" ������">������</th>
            <th class="filter-select filter-exact" data-placeholder=" ����">����</th>
            <th class="filter-select filter-exact" data-placeholder=" �����Ⱓ ">�����Ⱓ</th>
            <th class="filter-select filter-exact" data-placeholder=" �о�">�о�</th>
            <th class="filter-select filter-exact" data-placeholder=" �����">�����</th>
            <th class="filter-select filter-exact" data-placeholder=" ����">����</th>
      </thead>
      <tfoot>
         <tr>
            <th>�п���</th>
            <th>�����</th>
            <th>������</th>
            <th>����</th>
            <th>�����Ⱓ</th>
            <th>�о�</th>
            <th>�����</th>
            <th>����</th>
         </tr>
      </tfoot>
      <tbody>
      <c:forEach var="d" items="${list }" varStatus="count">
         <tr>
            <td>${count.count}. ${d.ac_name }</td>
            <td>${d.ac_class }</td>
            <td>${d.ac_totalval }</td>
            <td>${d.ac_inwon }</td>
            <td>${d.ac_time }</td>
            <td>${d.ac_field }</td>
            <td>${d.ac_teacher }</td>
            <td>${d.ac_reviewcnt }</td>
         </tr>
      </c:forEach>   
      </tbody>
   </table>
   <!-- include -->
   <div class=test1234>
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
   <script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=aa3c541d0ad473d0aee39e6a1888e60b&libraries=services"></script>
	<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
    level: 3 // ������ Ȯ�� ����
};  

//������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption);

var k=1;
var str=[];

function test(text,divtext){
   
   if(text.indexOf(',')>0){   // �ּҰ��� ���ʿ��� ���� ������ �ڸ���
      text = text.substring(0,text.indexOf(',')).trim();
      console.log("test12344:"+text);
   } 
   
   

   //�ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
   var geocoder = new daum.maps.services.Geocoder();

// �ּҷ� ��ǥ�� �˻��մϴ�
//text=document.getElementById('text').value;

geocoder.addr2coord(text, function(status, result) {

    // ���������� �˻��� �Ϸ������ 
     if (status === daum.maps.services.Status.OK) {
   
        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
    
    if(k>10){
       k=1; // ��ǥ�� ������ �浵�� �ణ ������Ų��
    }else{
       str[k-1]=coords.toString();
    
       for(var i=0;i<str.length;i++){
           for(var j=0;j<str.length;j++){
              if(i!=j){
                 if(str[i]==str[j]){
                    coords=new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng+0.0002);
                    str[i]=coords.toString();
                    console.log("������ ��ǥ:"+coords.toString());
                 
                    
                 }
              }
           }
        }
    
    var imageSrc = 'img/'+k+'.png'; // ��Ŀ�̹����� �ּ��Դϴ�    
       imageSize = new daum.maps.Size(60, 69), // ��Ŀ�̹����� ũ���Դϴ�
       imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
       
       k++;
    }
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
        
        
       console.log("��ǥ:"+coords.toString());
           
        
        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
        var marker = new daum.maps.Marker({
            map: map,
            position: coords,
            image: markerImage,
            opacity: 0.7,
            zIndex: 1
        });
        
        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
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
        console.log("�ż��Դ� ���� �߻�����?");
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
   
   // ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
   function makeOutListener(infowindow,marker) {
       return function() {
           infowindow.close();
           marker.setOpacity(0.7);
           marker.setZIndex(1);
           infoWindow.setZIndex(2);
       };
   }
   <%
      for(AcinfoDTO d:list){
   %>
   		test("<%=d.getAc_address()%>",'<div style="padding:5px;"><%=d.getAc_name()%></div>');
   <%
      }
   %></script>
</body>
</html>