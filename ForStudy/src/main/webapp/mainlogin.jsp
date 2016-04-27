<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="css/main_login.css" />
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
</script>
<script type="text/javascript">
	$(function(){
		/* $('#joinBtn').click(function(){
			location.href="../main/main.jsp?mode=1";
		}); */
		$('#logBtn').click(function(){
			var id=$('#id').val();
			if(id.trim()=="")
			{
				$('#id').focus();
				return;
			}
			
			var pwd=$('#pwd').val();
			if(pwd.trim()=="")
			{
				$('#pwd').focus();
				return;
			}
			
			$('#logfrm').submit();
		});
	});
</script>
<script type="text/javascript">
    $(document).ready(function() {
 
    $("#joinBtn").click(function() {
       
            //alert("ok");
            if ($("#id").val() == "") {
                alert("���̵�  �Է��ϼ���");
                $("#id").focus();
            } else if ($("#pwd").val() == "") {
                alert("��й�ȣ��  �Է��ϼ���");
                $("#pwd").focus();
            } else if ($("#nick").val() == "") {
                alert("�г����� �� �Է��ϼ���!");
                $("#nick").focus();
            } else if ($("#email").val() == "") {
                alert("�̸����� �� �Է��ϼ���!");
                $("#email").focus();
            } else if ($("#m_agree").val() == "") {
                alert("������ǿ� üũ�ϼ���");
                $("#m_agree").focus();
            } else {
                alert("ok");
            }
 
        });
  
    });
   
</script>
<style type="text/css">
		
		h1,
        label,
        p {
            color: #198B66;
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
        	color: #198B66;
        }
</style>
</head>
<body>
<div id="login">
			<form method=post action="login_ok.jsp" id="logfrm">
			  <h2><span class="entypo-login"></span> Login</h2>
			  <button id="logBtn"><span class="entypo-lock"></span></button>
			  <span class="entypo-user inputUserIcon"></span>
			  <input type="text" class="user" placeholder="ID" name="id" id="id"/>
			  <span class="entypo-key inputPassIcon"></span>
			  <input type="password" class="pass" placeholder="Password" name="pwd" id="pwd"/>
			</form>
			  <button id="cd-cart-trigger">ȸ������</button>
</div> 
</body>
<div id="cd-shadow-layer"></div>

	<div id="cd-cart">
		
			 <!-- <div id="main"> -->
              <!--   <article class="container"> -->
                    <div class="page-header">
                    <div id="logo">
                    <span><img src="img/simplelogo.png" width="50" height="40"></span>
                    <b id="joinfont">����ȸ������</b>
                    </div>
                    </div>
                    <p></p>
                    <p></p>
                    <form class="form-horizontal" action="join_ok.jsp" name="joinfrm" id="joinfrm" >
                        <div class="form-group">
                            <label for="inputid" class="col-sm-2 control-label"><b>���̵�</b></label>
                            <div class="col-sm-6"> 
                                <input type="text" class="form-control" id="id" name="id" placeholder="���̵�">
                                <span class="input-group-btn">
						      <button class="btn btn-success" id="idCheck" name="idCheck">���̵� �ߺ�üũ</button></span></br> 
						      <span id="idmessage" style="display:none"></span>
                             </div> 
                        </div>
                        <p></p>
                        <div class="form-group">
                            <label for="inputPassword" class="col-sm-2 control-label"><b>��й�ȣ</b></label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="��й�ȣ">
                                <p class="help-block">8�� �̻����� �ۼ��ϼ���.</p>
                          </div> 
                        </div>
                                                                      
                        <div class="form-group">
                            <label for="inputNickname" class="col-sm-2 control-label"><b>�г���</b></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="nick" name="nick" placeholder="�г���">
                                  <span class="input-group-btn">
						      <button class="btn btn-success" name="nickCheck" id="nickCheck" onclick="nickCheck()">�г��� �ߺ�üũ</button>
						       
						     </span>
                               <p></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputNumber" class="col-sm-2 control-label"><b>�̸���</b></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
                               <p></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAgree" class="col-sm-2 control-label"><b>��� ����</b></label>
                            <div class="col-sm-6 checkbox">
                                <label>
				        <input id="m_agree" type="checkbox" name="m_agree" value="1"> <a href="#" onclick="policies()"> �̿���</a>�� �����մϴ�.
				    </label>
                            </div>
                        </div>
                        <p></p>
                       <p></p>
                                
				 		 <input type="submit" class="checkout-btn" name="joinBtn" id="joinBtn" value=ȸ������>
                    </form>
                   
               <!--  </article> -->
            <!-- </div> -->
           
	</div> <!-- cd-cart -->
</html>