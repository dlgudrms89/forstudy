<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css" />
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
	
	<div class="all">
		<table id="table_content">
			<tr>
				<th width=10%>번호</th>
				<th width=45%>제목</th>
				<th width=15%>이름</th>
				<th width=20%>작성일</th>
				<th width=10%>조회수</th>
			</tr>
			<%-- for(ReplyBoardVO vo:request.getAttribute("list")) --%>
			<c:forEach var="vo" items="${boardsearchlist }">
				<tr class="dataTr">
					<td width=10% class="tdcenter">${vo.no }</td>
					<td width=45% class="tdleft"><a
						href="boardcontent.do?no=${vo.no}&page=${curpage}">${vo.subject }</a>
						&nbsp; <c:if test="${vo.replyCount>0 }">
						(${vo.replyCount })
					</c:if></td>
					<td width=15% class="tdcenter">${vo.name }</td>
					<td width=20% class="tdcenter"><fmt:formatDate
							value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
					<td width=10% class="tdcenter">${vo.hit }</td>
			</c:forEach>
		</table>
		<table id="table_content">
			<tr>
				<td align=right><a href="boardlist.do?page=1"> <img
						src="board/image/begin.gif" border=0></a> <c:if
						test="${curpage>block }">
						<a href="boardlist.do?page=${fromPage-1 }"> <img
							src="board/image/prev.gif" border=0></a>
					</c:if> <c:if test="${curpage<=block }">
						<a href="boardlist.do?page=${curpage>1?curpage-1:curpage }"> <img
							src="board/image/prev.gif" border=0></a>
					</c:if> <c:forEach var="i" begin="${fromPage }" end="${toPage }">
						<c:if test="${i==curpage }">
					[<font color="red">${i }</font>]
				</c:if>
						<c:if test="${i!=curpage }">
					[<a href="boardlist.do?page=${i }">${i }</a>]
				</c:if>
					</c:forEach> <c:if test="${toPage<totalpage }">
						<a href="boardlist.do?page=${toPage+1 }"> <img
							src="board/image/next.gif" border=0></a>
					</c:if> <c:if test="${toPage>=totalpage }">
						<a
							href="boardlist.do?page=${curpage<totalpage?curpage+1:curpage }">
							<img src="board/image/next.gif" border=0>
						</a>
					</c:if> <a href="boardlist.do?page=${totalpage }"> <img
						src="board/image/end.gif" border=0></a> &nbsp;&nbsp; ${curpage }
					page/ ${totalpage } pages</td>
			</tr>
			<tr>
				<form method="post" action="boardsearch.do">
         
			         <td>
			            <select name=fs id="op_tion">
			               <option value="name">이름</option>
			               <option value="subject">제목</option>
			               <option value="content">내용</option>
			               </select>
			            <input type="text" size=20 name=search>
			            <input type="submit" value="찾기">
			         </td>
			      </form>
				<td><a href="boardinsert.do"><input type="button"
						value="추가"></a></td>

			</tr>
		</table>
	</div>
	
</body>
</html>