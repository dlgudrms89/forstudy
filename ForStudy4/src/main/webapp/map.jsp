<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div id="map" style="width: 60%; height: 350px;; left: 290px; top: -386px;">	
</div>
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=aa3c541d0ad473d0aee39e6a1888e60b&libraries=services"></script>
	<!-- aa3c541d0ad473d0aee39e6a1888e60b -->
	<!-- cb496d1538d83e93f5feed8b783a683e -->
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

function test(text,divtext,num){
	
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
    }else if(num==0){
    	var imageSrc = 'img/marker.png'; // 마커이미지의 주소입니다    
 		imageSize = new daum.maps.Size(60, 69), // 마커이미지의 크기입니다
 		imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
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
        if(num!=0){
        	infowindow.close();
	        daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow,marker));
        }
        
    }else{
        console.log("zzzz"+divtext);
        text = text.trim().substring(0,(text.length)-1).trim();
        console.log("zzzz"+text);
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
	<c:choose>
	<c:when test="${list!=null }">
	<c:forEach var="d" items="${list }">
		<script>
			console.log("address="+"${d.ac_address}");
			console.log("name= "+"${d.ac_name}");
			
			test("${d.ac_address}",'<div style="padding:5px;">${d.ac_name}</div>',1);
		</script>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<script>
			test("${d.ac_address}",'<div style="padding:5px;">${d.ac_name}</div>',0);
		</script>
	</c:otherwise>
	</c:choose>
</div>
	
</body>
</html>