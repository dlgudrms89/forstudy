
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel='stylesheet prefetch'
   href='http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<link rel="stylesheet" href="css/detailcss.css">
<link rel="stylesheet" href="css/starStyle.css">
<link rel="stylesheet" href="css/review.css">
<script type="text/javascript" src="search/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style>
#map {
   position: relative;
   left: 15px;
   top: 10px;
   box-shadow: 5px 5px 5px #AAAAAA;
}
</style>
<script type="text/javascript">
$(function(){ // window.onload , $(document).ready(function(){})
   $('#btn-keep').click(function(){
         var param = "no=";
         $("input:checkbox[name=cartcheck]:checked").each(function(){
            var cartcheck=$(this).val();
            param+=cartcheck+",";
         });
         sendMessage("POST", "cartadd.do", param, idcheck);
      });
});
   
function idcheck(){
   if(httpRequest.readyState==4){
      if(httpRequest.status==200){
         $('#cart').html(httpRequest.responseText);
      }
   }
}


</script>
</head>
<body>

   <div>
       <jsp:include page="../map.jsp"></jsp:include>
    </div>

   <div class="container2 clearfix">

      <div class="shoe-details-left"></div>

      <!-- end shoe details-left -->
       <form method="post"> 
         <input type="hidden" name="name" id="name" value="${d.ac_name}">
         <div class="shoe-details-right">

            <span class="product-title">학원이름 <strong>${d.ac_name}</strong></span>

            <span class="label">${reviewAvg}</span>
<%--                   <c:choose> --%>
<%--                      <c:when test="${reviewAvg>=10}"> --%>
<%--                         <span class="ratings"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:when test="${reviewAvg>=9}"> --%>
<%--                         <span class="ratings fourhalf"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:when test="${reviewAvg>=8}"> --%>
<%--                         <span class="ratings four"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:when test="${reviewAvg>=7}"> --%>
<%--                         <span class="ratings threehalf"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:when test="${reviewAvg>=6}"> --%>
<%--                         <span class="ratings three"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:when test="${reviewAvg>=5}"> --%>
<%--                         <span class="ratings twohalf"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:when test="${reviewAvg>=4}"> --%>
<%--                         <span class="ratings two"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:when test="${reviewAvg>=3}"> --%>
<%--                         <span class="ratings onehalf"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:when> --%>
<%--                      <c:otherwise> --%>
<%--                         <span class="ratings one"></span>(리뷰:${reviewCount}) --%>
<%--                      </c:otherwise> --%>
<%--                   </c:choose> --%>


            <div class="product-category">
               <span class="product-title">분야&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <strong>${d.ac_field}</strong>
               </span><br>
            </div>

            <div class="product-category">
               <span class="product-address">주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <strong>${d.ac_address}</strong>
               </span><br>
            </div>

            <div class="product-category">
               <span class="product-title">전화번호 <strong>${d.ac_tel}</strong></span><br>
            </div>
            <div class="product-category">
               <span class="product-title">교습계열 <strong>${d.ac_program}</strong></span><br>
            </div>
            <div class="product-category">
               <span class="product-title">강사수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <strong>${d.ac_teacher}</strong>
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

                       <c:forEach var="de" items="${vo }">
                    
                     <tr>
                        <td id="classname" value="${de.ac_class}">${de.ac_class}</td>
                        <td>${de.ac_totalval}</td>
                        <td>${de.ac_inwon}</td>
                        <td>${de.ac_time}</td>
                        <td style="float:right;"><label class="control control--checkbox"> 
                        <input type="checkbox" name='cartcheck' class='control--checkbox'
                             id='cartcheck' value=${de.ac_sub_no}>
                              <div class="control__indicator"></div></label></td>
                        
                     </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
            
            <div class="btn btn-total">
            	<c:if test="${sessionScope.id!=null}">
                    <input type="button" value="장바구니 담기" id="btn-keep">
                </c:if>
            </div>
            </form> 
            <form method="post" action="reviewadd.do">
            <div class="inreview">
            <b id="reviewLabel">Review</b><br>
                <textarea rows="3" cols="72" style="float: left" name="review_text"></textarea>
                <input type="hidden" name="review_score" id="review_score">
                <input type="hidden" value="${mstno}" name="mstno">
                <span class="star-input">
                 <output for="star-input" class="star-point"><b>0</b>점</output>
                 <span class="input">
                   <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
                   <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
                   <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
                   <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
                   <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
                   <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
                   <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
                   <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
                   <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
                   <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
                 </span>
                
               </span>
                   <input type="submit" style="height:50px;width:50px" value="입력" id="btn_review"></input>
                   <script src="js/star.js"></script>
                <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            </div>
            </form>
            <c:forEach var="d" items="${reviewList}">
               <article class="review review-1">
                  <h3 class="review-title">
                  	${d.id}
                  </h3>
                  <c:if test="${d.ac_review_score<=2}">
                  <span class="ratings one"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==3}">
                  <span class="ratings onehalf"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==4}">
                  <span class="ratings two"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==5}">
                  <span class="ratings twohalf"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==6}">
                  <span class="ratings three"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==7}">
                  <span class="ratings threehalf"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==8}">
                  <span class="ratings four"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==9}">
                  <span class="ratings fourhalf"></span>
                  </c:if>
                  <c:if test="${d.ac_review_score==10}">
                  <span class="ratings"></span>
                  </c:if>
                  
                  <p class="review-excerpt">${d.rv_content}</p>
               </article>
</c:forEach>
        
      <div class="close-button" onclick="javascript:history.back()">&times;</div>

   </div>
   <!-- end container -->

   <img src="img/ad3.gif" style="position:fixed; right:20px; top:365px; height:550px;cursor:pointer;" onclick="window.open('http://www.megastudy.net')">

</body>
</html>