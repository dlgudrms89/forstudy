<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="search/ajax.js"></script>
<link rel="stylesheet" type="text/css" href="css/main_login.css" />
<link rel="stylesheet" type="text/css" href="css/main_logout.css" />
<link rel="stylesheet" href="css/mainjoin.css" />
<script src="js/join.js"></script>
<script type="text/javascript">
$(".user").focusin(function(){
  $(".inputUserIcon").css("color", "#00758f");
}).focusout(function(){
  $(".inputUserIcon").css("color", "#00758f");
});

$(".pass").focusin(function(){
  $(".inputPassIcon").css("color", "#00758f");
}).focusout(function(){
  $(".inputPassIcon").css("color", "#00758f");
});


    
$(function(){
	$('#logBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()==""){
			$('#status').text("ID�� �Է��ϼ���");
			//alert("ID�� �Է��ϼ���");
			$('#id').focus();
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()==""){
			$('#status').text("��й�ȣ�� �Է��ϼ���");
			//alert("��й�ȣ�� �Է��ϼ���");
			$('#pwd').focus();
			return;
		}
		param="id="+id+"&pwd="+pwd;
		
		sendMessage("POST", "firstlogin.do", param, statusCallback);
		$('#status').text("");
	});
	
	$('#joinBtn').click(function() {
        
        //alert("ok");
        if ($('#join_id').val() == "") {
            alert("���̵� �Է��ϼ���");
            $('#join_id').focus();
            return;
        } else if ($('#join_pwd').val() == "") {
            alert("��й�ȣ�� �Է��ϼ���");
            $('#join_pwd').focus();
            return;
        } else if ($('#join_nick').val() == "") {
            alert("�г����� �Է��ϼ���!");
            $('#join_nick').focus();
            return;
        } else if ($('#join_email').val() == "") {
            alert("�̸����� �Է��ϼ���!");
            $('#join_email').focus();
            return;
        } else if ($('#join_m_agree').is(':checked')==false) {
            alert("������ǿ� üũ�ϼ���");
            $('#join_m_agree').focus();
            return;
        } else {
      	  var id=$('#join_id').val();
      	  var pwd=$('#join_pwd').val();
      	  var nick=$('#join_nick').val();
      	  var email=$('#join_email').val();
      	  
      	 
      	  var param="id="+encodeURIComponent(id)+"&pwd="+encodeURIComponent(pwd)+"&nick="+encodeURIComponent(nick)+"&email="+encodeURIComponent(email);
      	  				
      	  sendMessage("POST", "mainjoin.do", param, memberjoin);
            
        }
    });
	 $('#idCheck').click(function(){
	  		var id=$('#join_id').val();
	  		
	  		if(id.trim()==""){
	  			$('#join_id').focus();
	  			return;
	  		}
	  		var param="id="+id;
	  		sendMessage("POST", "idcheck.do", param, idcheck);
	  	});
	      $('#nickCheck').click(function(){
	  		var nick=$('#join_nick').val();
	  		
	  		if(nick.trim()==""){
	  			$('#join_nick').focus();
	  			return;
	  		}
	  		var param="nick="+nick;
	  		sendMessage("POST", "nickcheck.do", param, nickcheck);
	  	});
      $('#memberchange').click(function() {
    	  if ($('#memberchange_pwd').val() == "") {
              alert("��й�ȣ�� �Է��ϼ���");
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
        	  sendMessage("POST", "firstlogin.do", param, statusCallback);
      });
});
function statusCallback(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var res=httpRequest.responseText;
			if(res.trim()=="NOID"){
				$('#status').text("ID�� �������� �ʽ��ϴ�");
				//alert("ID�� �������� �ʽ��ϴ�");
			}
			else if(res.trim()=="NOPWD"){
				$('#status').text("��й�ȣ�� Ʋ���ϴ�");
				//alert("��й�ȣ�� Ʋ���ϴ�");
			}else{
				$('#login').text("");
				location.href="main.do";
				
			}
		}
	}
} 
function idcheck(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var res=httpRequest.responseText;
			if(res.trim()=="0"){
				var r=$('#join_id').val()+"��(��) ��� ������ ID�Դϴ�"
				$('#idcheckmsg').text(r);
			}else{
				var r=$('#join_id').val()+"��(��) �̹� ������� ID�Դϴ�";
				$('#idcheckmsg').text(r);
			}
		}
	}
}
function nickcheck(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var res=httpRequest.responseText;
			if(res.trim()=="0"){
				var r=$('#join_nick').val()+"��(��) ��� ������  �г��� �Դϴ�"
				$('#nickcheckmsg').text(r);
			}else{
				var r=$('#join_nick').val()+"��(��) �̹� ������� �г��� �Դϴ�";
				$('#nickcheckmsg').text(r);
			}
		}
	}
}
function memberjoin(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			alert("ȸ�������� �Ϸ�Ǿ����ϴ�");
			location.reload();
		}
	}
}
function memberchange(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			alert("ȸ������ ������ �����Ǿ����ϴ�");
			location.reload();
		}
	}
}
function policies() {
	   var left=( screen.availWidth - 500 ) / 2;
	   var top=( screen.availHeight - 500 ) / 2;
	   var state="status=0,toolbar=no,location=no,menubar=no,resizable=0,width=500,height=500,left="
	            +left+",top="+top;
	   var win = window.open('policies.jsp','popup',state);         
	   win.focus();  
	   
	 };

// $(function(){
//    $('#ss').click(function(){
// 	   sendMessage("POST", "memberchangelist.do", "id=${sessionScope.id}", memberchange);
//       });
// });

// function memberchange(){
// 	   if(httpRequest.readyState==4){
// 	      if(httpRequest.status==200){
// 	         $('#memberchangelist').html(httpRequest.responseText);
	         
// 	      }
// 	   }
// 	}

</script>

<style type="text/css">
		
		h1,
        label,
        p {
            color: #fff;
            font-style: inherit;
        }
        .page-header{
        	text-indent : 15%;
        }
        .form-horizontal{
        	text-indent : 20%;
        }
        p {
        	font-size: 9pt;
        }
        #joinfont
        {
        	font-size: 14pt;
        	color: #fff;
        }
</style>
</head>
<body>
<div id="login">

	<c:if test="${sessionScope.id==null }">
			<h2><span class="entypo-login"></span> Login</h2>
			<button id="logBtn"><span class="entypo-lock"></span></button>
			<span class="entypo-user UserIcon"></span>
			<input type="text" class="user" placeholder="ID" name="id" id="id" />
			<span class="entypo-key inputPassIcon"></span>
			<input type="password" class="pass" placeholder="Password" name="pwd" id="pwd" />
			<button id="cd-cart-trigger">ȸ������</button>
	</c:if>
	
		<c:if test="${sessionScope.id!=null }">
				<h2>
					<span class="entypo-heart"></span> Welcome!
				</h2>
				<a href="logout.do"><button id="logoutBtn">
					<span class="entypo-lock-open"></span>
				</button></a>
				<input type="text"
					class="entypo-rocket" id="id"
					value="${sessionScope.nick }��" style="border: 0"
					READONLY /> <span></span> <input type="text" value="ȯ���մϴ�"
					style="border: 0" READONLY />
			<button id="cd-cart-trigger" class="memberchangeopen" >ȸ����������</button>
			<c:if test="${mlist.admin!=1 }">
			<button id="mypage-trigger" onclick="window.open('mypage.do','popup','status=no,toolbar=no,location=no,menubar=no,resizable=0,width=500,height=500,left='
	            +( screen.availWidth - 500 ) / 2+',top='+( screen.availHeight - 500 ) / 2)">�п������Ȳ</button>
           	</c:if>
           	<c:if test="${mlist.admin==1 }">
	            <button id="mypage-trigger" onclick="window.open('adminpage.do','popup','status=no,toolbar=no,location=no,menubar=no,resizable=0,width=500,height=800,left='
	            +( screen.availWidth - 500 ) / 2+',top='+100)">�п������Ȳ</button>
            </c:if>
		</c:if>
		<div id="status" style="left:133px;position:absolute;top:152px;font-size:13px;"></div>



	</div> 
</body>
<c:if test="${sessionScope.id==null }">
<div id="cd-shadow-layer"></div>

	<div id="cd-cart">
		
                   <div class="page-header">
                    <div id="logo">
                    <span><img src="img/simplelogo.png" width="50" height="40"></span>
                    <b id="joinfont">����ȸ������</b>
                    </div>
                    </div>
                     
                        <div class="form-group">
                            <div class="col-sm-6"> 
                                <input type="id" class="form-control" id="join_id" name="join_id" placeholder="���̵�">
                                <span class="input-group-btn">
                        <button class="btn btn-success" id="idCheck" name="idCheck">�ߺ�üũ</button>
                       </span>
                        <p class="help-block" id="idcheckmsg">���̵�</p>
                             </div> 
                        </div>
                        <p></p>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="join_pwd" name="join_pwd" placeholder="��й�ȣ">
                                 <p class="help-block">8�� �̻� �Է��ϼ���</p>
                          </div> 
                        </div>
                                                                      
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="join_nick" name="join_nick" placeholder="�г���">
                                  <span class="input-group-btn">
                        <button class="btn btn-success" name="nickCheck" id="nickCheck">�ߺ�üũ</button>
                         <p class="help-block" id="nickcheckmsg">�г���</p>
                       </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="join_email" name="join_email" placeholder="�̸���">
                              
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6 checkbox">
                     <label> 
                    <input id="join_m_agree" type="checkbox" name="join_m_agree" value="1"> 
                   
                    <a href="#" onclick="policies()" class="m_agree_text"> �̿���</a> <a class="m_agree_text">�� �����մϴ�.</a>
               </label>
                            </div>
                        </div>
                        <p></p>
                       <p></p>
                                
                  <input type="submit" class="checkout-btn" name="joinBtn" id="joinBtn" value=ȸ������>
                  </div>
      </c:if>
      <c:if test="${sessionScope.id!=null }">
      <div id="cd-shadow-layer"></div>
	<div id="cd-cart" class="changememberlist">
                   <div class="page-header">
                    <div id="logo">
                    <span><img src="img/simplelogo.png" width="50" height="40"></span>
                    <b id="joinfont">ȸ������</b>
                    </div>
                    </div>
                     
                        <div class="form-group">
                            <div class="col-sm-6"> 
                                <input type="id" class="form-control" id="memberchange_id" name="memberchange_id" placeholder="���̵�" value="${sessionScope.id }" readonly="readonly">
                                <span class="input-group-btn">
                        
                       </span>
                             </div> 
                        </div>
                        <p></p>
                        
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="memberchange_pwd" name="memberchange_pwd" placeholder="��й�ȣ" value="${sessionScope.pwd }">
<!--                                  <p class="help-block">8�� �̻� �Է��ϼ���</p> -->
                          </div> 
                        </div>
                             <p></p>
                  <div class="form-group">
                            <div class="col-sm-6">
                              
                  <select name="memberchange_gender" id="memberchange_gender">
                  						<option>����</option>
                  						<option>------</option>
                  						<option value="����" <c:if test="${mlist.gender=='����' }">selected</c:if>>����</option>
                  						<option value="����" <c:if test="${mlist.gender=='����' }">selected</c:if>>����</option></select>
                                 
                          </div>
                        </div>
                            
                              <p></p>                                 
                        
                          <p></p>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="memberchange_email" name="memberchange_email" placeholder="�̸���" value="${mlist.email }">
                              
                            </div>
                        </div>
                          <p></p>
                         <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="memberchange_phone" name="memberchange_phone" placeholder="��ȭ��ȣ" value="${mlist.phone }">
                                 <p class="help-block">'-' ǥ�þ��� ���ڸ� �����ּ���</p>
                          </div> 
                        </div>
                          <p></p>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="memberchange_addr" name="memberchange_addr" placeholder="�ּ�" value="${mlist.addr }">
                                 <p class="help-block">�ּҸ� �����ּ���</p>
                          </div> 
                        </div>
                        
                        
                        
                        <p></p>
                       <p></p>
                                
                  <input type="submit" class="checkout-btn" name="memberchange" id="memberchange" value=ȸ������>
                  </div> <!-- cd-cart -->

      </c:if>
	
</html>