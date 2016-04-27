
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sist.dao.*,java.util.*"%>
<jsp:useBean id="dao" class="com.sist.dao.AcinfoDAO" />
<jsp:useBean id="dto" class="com.sist.dao.AcinfoDTO"></jsp:useBean>
<%
    request.setCharacterEncoding("UTF-8");
      //BoardDAO dao=BoardDAO.newInstance();
      String Ac_name = request.getParameter("name");
   int Ac_no=dao.AcDetail3(Ac_name);
      AcinfoDTO d = dao.AcDetail2(Ac_no);
      List<AcinfoDTO> list = dao.AcDetail(Ac_name);
          
       
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="css/detailcss.css">
<link rel="stylesheet" href="css/review.css">
<style>
#map {
	position: relative;
	left: 15px;
	top: 10px;
	box-shadow: 5px 5px 5px #AAAAAA;
}
</style>

</head>
<body>

	<div id="map"
		style="width: 60%; height: 350px;; left: 290px; top: -386px;"></div>

	<div class="container2 clearfix">

		<div class="shoe-details-left"></div>

		<!-- end shoe details-left -->
		<form action="cart.jsp" method="post">
			<input type="hidden" name="name" value="<%= d.getAc_name() %>">
			<div class="shoe-details-right">

				<span class="product-title">학원이름 <strong><%=d.getAc_name() %></strong></span>

				<span class="label">New</span>


				<div class="product-category">
					<span class="product-title">분야&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<strong><%=d.getAc_field() %></strong>
					</span><br>
				</div>

				<div class="product-category">
					<span class="product-address">주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<strong><%=d.getAc_address() %></strong>
					</span><br>
				</div>

				<div class="product-category">
					<span class="product-title">전화번호 <strong><%=d.getAc_tel() %></strong></span><br>
				</div>
				<div class="product-category">
					<span class="product-title">교습계열 <strong><%=d.getAc_program()%></strong></span><br>
				</div>
				<div class="product-category">
					<span class="product-title">강사수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<strong><%=d.getAc_teacher() %></strong>
					</span><br>
				</div>

				<div class="containertable">
					<table>
						<thead>
							<tr>
								<th>교습과목</th>
								<th>총교습비</th>
								<th>정원</th>
								<th>교습기간</th>
								<th>비교담기</th>
							</tr>
						</thead>
						<tbody>

							<%
        for(AcinfoDTO de:list){
     %>
							<tr>
								<td><%=de.getAc_class() %></td>
								<td><%=de.getAc_totalval() %></td>
								<td><%=de.getAc_inwon() %></td>
								<td><%=de.getAc_time() %></td>
								<td class="cartcheck"><label class="control control--checkbox"> <input
                              type="checkbox" name='cartcheck' class='control control--checkbox'
                              value="<%=de.getAc_no()%>">
                              <div class="control__indicator"></div></label></td>
								
							</tr>
							<%
        }
      %>
						</tbody>
					</table>
				</div>
				<%-- <ul class="product-tabs">
          <li class="active"><a href="#pane1">교습과목</a></li>
         <li><a href="#pane2">총교습비</a></li>
         <li><a href="#pane3">정원</a></li>
         <li><a href="#pane4">교습기간</a></li>
  
     <%
        for(AcinfoDTO de:list){
     %>
         <ul class="product-tabs">
         <li><%=de.getAc_class() %></li>
         <li><%=de.getAc_totalval() %></li>
         <li><%=de.getAc_inwon() %></li>
         <li><%=de.getAc_time() %></li>
         </ul>
      <%
        }
      %> --%>
				<div class="btn btn-total">
					<input type="submit" value="장바구니 담기" id="btn-keep">

					<a href="main.jsp?mode=0" class="btn btn-secondary"> 취소 </a> <a
						href="tjdrb.jsp" class="btn btn-secondary"> 세션종료 </a>
						
						<div class="content archive-list">
               <article class="review review-1">
                  <h3 class="review-title">
                     닉네임<span class="review-archive-rating"> <i
                        class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                        class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                        class="fa fa-star-o"></i>
                     </span>
                  </h3>
                  <p class="review-excerpt">리뷰내용</p>
               </article>
            </div>
				</div>
				

			</div>
			<!-- end shoe-details-right -->
		</form>

		<div class="close-button" onclick="javascript:history.back()">&times;</div>

	</div>
	<!-- end container -->

	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=aa3c541d0ad473d0aee39e6a1888e60b&libraries=services"></script>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
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
    
    if(k>10){
       k=1; // 좌표가 같을때 경도를 약간 증가시킨다
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
    
    var imageSrc = 'img/marker.png'; // 마커이미지의 주소입니다    
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
        /* infowindow.close();
        daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow,marker)); */
        
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
   test("<%=d.getAc_address()%>",'<div style="padding:5px;"><%=d.getAc_name()%></div>');
</script>

</body>
</html>