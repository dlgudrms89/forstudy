<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">
<script type="text/javascript" src="search/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // window.onload , $(document).ready(function(){})
        sendMessage("POST", "cart.do", null , cartmain);
  
});
function cartmain(){
   if(httpRequest.readyState==4){
      if(httpRequest.status==200){
         $('#cart').html(httpRequest.responseText);
         
      }
   }
}


</script>
</head>
<body>
	<div class='chat'>
		<header>
		<ul class='tools'>
		<a href="compare.do"><input type="submit" value="상세비교" id="btn-com"></a>
			<li><a class='fa fa-search' href='#'></a></li>
		</ul>
		</header>
		 <div class='cart' id="cart">
			
		</div> 
		
		
	</div>
</body>

</html>