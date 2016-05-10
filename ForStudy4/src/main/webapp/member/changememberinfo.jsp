<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<style type="text/css">
#cd-cart {
	background: linear-gradient(to bottom, rgba(67, 137, 165, 0.8) 0%, rgba(0, 0, 0, 0.6) 100%);
	position:relative;
	z-index:3;
    padding-top: 10px;
    padding-left: 55px;
    height: 345px;
}
#cd-cart h2 {
  font-size: 14px;
  font-size: 0.875rem;
  font-weight: bold;
  text-transform: uppercase;
  margin: 1em 0;
}
#cd-cart .cd-qty, #cd-cart .cd-price {
  color: #a5aebc;
}
#cd-cart .checkout-btn, #cd-cart2 .checkout-btn {
    display: block;
    width: 40%;
    height: 30px;
    background: #30AF8C;
    color: #FFF;
    text-align: center;
    text-decoration: none;
    top: -55px;
    margin-bottom: -55px;
    font-size: 15px;
    border-radius: 3rem;
    margin-left: 30px;
}
#cd-cart .checkout-btn:hover{
	background: #175746;
}
.no-touch #cd-cart .checkout-btn:hover {
  background: #a2dda8;
}
#joinfont {
    font-size: 14pt;
    color: #fff;
}
#cd-shadow-layer {
  min-height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  background: rgba(67, 87, 121, 0.6);
  position:fixed;
  z-index:0;
}
input {
    line-height: normal;
    width: 150px;
}
p {
    color: #fff;
    font-style: inherit;
    font-size:9pt;
}
</style>
<script>
$('#memberchange').click(function() {
	  if ($('#memberchange_pwd').val() == "") {
        alert("비밀번호를 입력하세요");
        $('#memberchange_pwd').focus();
        return;
	  }
	  var id=$('#memberchange_id').val();
  	  var pwd=$('#memberchange_pwd').val();
  	  var gender=$('#memberchange_gender option:selected').val();
  	  var email=$('#memberchange_email').val();
  	  var phone=$('#memberchange_phone').val();
  	  var addr=$('#memberchange_addr').val();
  	 
  	  var param="id="+encodeURIComponent(id)+"&pwd="+encodeURIComponent(pwd)+"&gender="+encodeURIComponent(gender)
  	  			+"&email="+encodeURIComponent(email)+"&phone="+encodeURIComponent(phone)+"&addr="+encodeURIComponent(addr);
  	  				
  	  sendMessage("POST", "memberchange.do", param, memberchange);
});
function memberchange(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			alert("회원님의 정보가 수정되었습니다");
			location.reload();
		}
	}
}
</script>
</head>
<body>
<div id="cd-shadow-layer"></div>
	<div id="cd-cart" class="changememberlist">
                   <div class="page-header">
                    <div id="logo">
                    <span><img src="img/simplelogo.png" width="50" height="40"></span>
                    <b id="joinfont">회원정보수정</b>
                    </div>
                    </div>
                     
                        <div class="form-group">
                            <div class="col-sm-6"> 
                                <input type="id" class="form-control" id="memberchange_id" name="memberchange_id" placeholder="아이디" value="${sessionScope.id }" readonly="readonly">
                                <span class="input-group-btn">
                        
                       </span>
                             </div> 
                        </div>
                        <p></p>
                        
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="memberchange_pwd" name="memberchange_pwd" placeholder="비밀번호" value="${sessionScope.pwd }">
<!--                                  <p class="help-block">8자 이상 입력하세요</p> -->
                          </div> 
                        </div>
                             <p></p>
                  <div class="form-group">
                            <div class="col-sm-6">
                              
                  <select name="memberchange_gender" id="memberchange_gender">
                  						<option>성별</option>
                  						<option>------</option>
                  						<option value="남자" <c:if test="${mlist.gender=='남자' }">selected</c:if>>남자</option>
                  						<option value="여자" <c:if test="${mlist.gender=='여자' }">selected</c:if>>여자</option></select>
                                 
                          </div>
                        </div>
                            
                              <p></p>                                 
                        
                          <p></p>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="memberchange_email" name="memberchange_email" placeholder="이메일" value="${mlist.email }">
                              
                            </div>
                        </div>
                          <p></p>
                         <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="memberchange_phone" name="memberchange_phone" placeholder="전화번호" value="${mlist.phone }">
                                 <p class="help-block">'-' 표시없이 숫자만 적어주세요</p>
                          </div> 
                        </div>
                          <p></p>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="memberchange_addr" name="memberchange_addr" placeholder="주소" value="${mlist.addr }">
                                 <p class="help-block">주소를 적어주세요</p>
                          </div> 
                        </div>
                        
                        
                        
                        <p></p>
                       <p></p>
                                
                  <input type="submit" class="checkout-btn" name="memberchange" id="memberchange" value=회원수정>
                  </div> <!-- cd-cart -->
</body>
</html>