<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="search/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // window.onload , $(document).ready(function(){})
   $('.btn-del').click(function(){
         var removeno=$('#removeno').attr("value");
         
         var param="removeno="+removeno;
         sendMessage("POST", "cartremove_ok.do", param, cartremove);
      
   });
});
function cartremove(){
   if(httpRequest.readyState==4){
      if(httpRequest.status==200){
         $('#cart').html(httpRequest.responseText);
         
      }
   }
}


</script>
<style type="text/css">

#paybutton {
    text-decoration: none;
    background: #30AF8C;
    color: white;
    padding: 1px 6px;
    border-radius: 6px;
    position: absolute;
    width: 50px;
    height: 22px;
    font-family: 'hanna';
    font-size: 18px;
    cursor: pointer;
    right: 20%;
    top: 57px;
    
}
</style>
</head>
<body>
	
			
      		<c:if test="${cartlist!=null }">
			<ul>
          	<c:forEach var="d" items="${cartlist }">
					<%-- <input type="hidden" name="name" value="${name}"/>  --%>
					<input type="hidden" name="removeno" id="removeno" value="${d.ac_sub_no}"/>
					
					<li>
					<a class='thumbnail' href='searchdetail.do?no=${d.ac_mst_no}'> ${d.ac_name}</a><br/>
						<div class='cart-con'>
							<h3>${d.ac_class}</h3>
							<span class='preview'>${d.ac_tel}</span>
						</div>
						
						<input type="submit" value="X" id="btn-del" class="btn-del">
						<button type="submit" id="paybutton" name="paytbutton"
						 onclick="window.open('book.do?no=${d.ac_sub_no}','popup','status=no,toolbar=no,location=no,menubar=no,resizable=0,width=500,height=500,left='
	            +( screen.availWidth - 500 ) / 2+',top='+( screen.availHeight - 500 ) / 2)">등록</button>
					</li>
				
         	</c:forEach>
			
			</ul>
			</c:if>
		
	
</body>
</html>