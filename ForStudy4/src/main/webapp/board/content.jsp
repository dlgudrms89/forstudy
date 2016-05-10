<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css"/>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	var w=0; // 댓글
	var m=0; // 수정
	var d=0; // 삭제
	$(function(){  // window.onload $(document).ready(function(){})
		$('.img_write').click(function(){
			var id=$(this).attr('id'); // this : 클릭한 것을 가져온다 'id'를 가져온다
			var no=id.substring(2);
			if(w==0){
				$('#w'+no).show();
				w=1;
			}else{
				$('#w'+no).hide();
				w=0;
			}
		});
	
		$('.img_modify').click(function(){
			var id=$(this).attr('id'); // this : 클릭한 것을 가져온다 'id'를 가져온다
			var no=id.substring(2);
			if(m==0){
				$('#m'+no).show();
				m=1;
			}else{
				$('#m'+no).hide();
				m=0;
			}
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(
			function() {

				setTimeout(function() {

					$("#name").removeClass("larger");

					$("#name span").each(
							function() {
								$(this).css("-webkit-transition-delay",
										$(this).data("delay") + "ms").css(
										"transition-delay",
										$(this).data("delay") + "ms");
								$(this).addClass("visible");
							});

				}, 1000);

			});
</script>
</head>
<body>
<div id="top-bar">
		<div id="small-logo">학원 정보 공유 커뮤니티</div>
	</div>
	<div id="intro">
		<div id="name" class="larger">
			<span data-delay="500">4</span> <span data-delay="800">S</span> <span
				data-delay="0" class="darker visible">T</span> <span data-delay="0"
				class="darker visible">U</span> <span data-delay="1000">D</span> <span
				data-delay="700">Y</span>
		</div>
		<div class="section-arrow">
			<div class="block"></div>
			<div class="triangle left"></div>
			<div class="triangle right"></div>
			<div class="block"></div>
		</div>
	</div>
	
	
	<div class="content-back">
	
	<center>
	<h3>내용보기</h3>
	<table id="table_content">
		<tr>
		 <td class="tdcenter" width=10%>${vo.no }</td>
		 <!-- 
		 	request.setAttribute("vo",vo)
		 	request.getAttribute("vo").getNo()
		 	${vo.no}
		 	
		 	${requestScope.no} => ${no} request.setAttribute("no",10)
		 	${sessionScope.no} => session.setAttribute("no",10)
		 	${param.id} => request.getParameter("id")
		  -->
		 <td class="tdcenter" width=50%>${vo.subject }</td>
		 <td class="tdcenter" width=40%>
		 	<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
		 </td>
		</tr>
		<tr>
		 <td class="tdcenter" width=30%>${vo.name }</td>
		 <td class="tdcenter" width=30%>${vo.hit }</td>
		</tr>

		<tr>
		 <td class="tdleft" colspan="4" valign="top" height="100">
		  <pre>${vo.content }</pre>
		 </td>
		</tr>
	</table>
	<table id="table_content">
		<tr>
		 <td align="right">
		 <c:if test="${sessionScope.id==vo.name }">
		 <form method="post" action="boardupdate.do">
		   <input type="hidden" value="${vo.no }" name="no">
			<input type="hidden" value="${page }" name="page">
			<input type="submit" value="수정">
		  </form>
		  </c:if>
		  <a href="boardlist.do?page=${page }">
		  <img src="board/image/btn_list.gif" border=0></a>
		 </td>
		</tr>
		
		<tr id="deletePwd" style="display:">
			<td colspan="2" align=right>
			<form method=post action="boarddelete.do">
			<input type="hidden" value="${vo.no }" name="no">
			<input type="hidden" value="${page }" name="page">
				 비밀번호:<input type="password" name=pwd size=10>
				 <button>삭제</button>
			</form>
			</td>
		</tr>
		
	</table>
	<table id="table_content">
		<tr>
		 <th id="sh">댓글보기</th>
		</tr>
	</table>
	<table id="table_content">
		<c:forEach var="rvo" items="${list }">
			<tr>
			  <td width="75%" height=30>
			   	<c:if test="${rvo.group_tab>0 }">
			   		<c:forEach var="i" begin="1" end="${rvo.group_tab }">
			   			&nbsp;&nbsp;
			   		</c:forEach>
			   		<img src="board/image/icon_reply.gif">
			   	</c:if>
			   		<pre>${rvo.msg }</pre>
			   	<br>
			   	<c:if test="${rvo.group_tab>0 }">
			   		<c:forEach var="i" begin="1" end="${rvo.group_tab }">
			   			&nbsp;&nbsp;
			   		</c:forEach>
			   	</c:if>
			   	<font color="blue">${rvo.name }</font>
			   	(${rvo.dbday })
			  </td>
			  <td width="25%">
			  	<img src="board/image/btn_reply.gif" id="ww${rvo.no }" class="img_write">&nbsp;
			  	<c:if test="${sessionScope.id==rvo.id }">
			  		<img src="board/image/btn_modify.gif" id="mm${rvo.no }" class="img_modify">&nbsp;
			  		<a href="replydelete.do?no=${rvo.no }&bno=${vo.no}&page=${page}">
			  		<img src="board/image/btn_delete.gif" id="dd${rvo.no }" class="img_delete"></a>
			  	</c:if>
			  </td>			
			</tr>
			
			<tr id="w${rvo.no }" style="display:none">
		 <td class="tdleft" colspan="2">
		  <form method="post" action="replyreinsert.do">
		  <input type=hidden name="id" value="${sessionScope.id }">
		  <input type=hidden name="name" value="${sessionScope.nick }">
		  <input type="hidden" name="no" value="${rvo.no }">
		  <input type="hidden" name="bno" value="${vo.no }">
		  <input type="hidden" name="page" value="${page }">
		  <textarea rows="2" cols="62" name="reply_data" style="float: left"></textarea>
		  <button style="hieght:58px;width:62px">답변달기</button>
		  </form>
		 </td>
		</tr>
		<tr id="m${rvo.no }" style="display:none">
		 <form method="post" action="replyupdate.do">
		 <td class="tdleft" colspan="2">
		   <input type="hidden" name="no" value="${rvo.no }">
		  <input type="hidden" name="bno" value="${vo.no }">
		  <input type="hidden" name="page" value="${page }">
		  <textarea rows="2" cols="62" name="reply_data" style="float: left">${rvo.msg}</textarea>
		 
		 </td>
		 </form>
		</tr>
		
		</c:forEach>
	</table>
	 
	<table id="table_content">
		<tr>
		 <td class="tdleft">
		  <form method="post" action="replyinsert.do" id="ri">
		  <input type=hidden name="id" value="${sessionScope.id }">
		  <input type=hidden name="name" value="${sessionScope.nick }">
		  <input type=hidden name="bno" value="${vo.no }">
		  <input type=hidden name="no" value="${rvo.no }">
		  <input type=hidden name="page" value="${page }">
			  <textarea rows="2" cols="62" name="reply_data" style="float: left"></textarea>
			  <button style="hieght:58px;width:62px" id="reply_insert">댓글달기</button>
		  </form>
		 </td>
		</tr>
		
	</table>
	</center>
	
	
	
	</div>
	<section class="four">
		<div class="wrapper-content"></div>
	</section>

	
	
	
	
	
	
</body>
</html>