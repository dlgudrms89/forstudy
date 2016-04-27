<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.AcinfoDAO" />
<jsp:useBean id="dto" class="com.sist.dao.AcinfoDTO"></jsp:useBean>
<%
   
   request.setCharacterEncoding("utf-8");
   String[] no = request.getParameterValues("cartcheck");
   String mode = request.getParameter("mode");
   if(mode==null)
      mode="0";
   
   
   String name = request.getParameter("name");
   List<AcinfoDTO> list = new ArrayList<AcinfoDTO>();
   
   List<AcinfoDTO> sessionList = (ArrayList<AcinfoDTO>)session.getAttribute("list");
   if(sessionList != null){
      list = (ArrayList<AcinfoDTO>)session.getAttribute("list");
   }
   
   if(no!=null&&name!=null){
      int[] ino = new int[no.length];
      for(int i=0;i<no.length;i++){
         ino[i] = Integer.parseInt(no[i]);
      }
      
      List<AcinfoDTO> aclist = dao.cartCheckList(ino);
//       dto = dao.cartCheckList(ino);
      for(int i=0;i<aclist.size();i++){
         list.add(aclist.get(i));
      }
      
      session.setAttribute("list",list);
      response.sendRedirect("main.jsp?mode=2&name="+name);
      
   }
   
   
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">
</head>
<body>
	<div class='chat'>
		<header>
		<ul class='tools'>
		<a href="main.jsp?mode=3"><input type="submit" value="상세비교" id="btn-com"></a>
			<li><a class='fa fa-search' href='#'></a></li>
		</ul>
		</header>
		<div class='cart'>
			<%
         
         if(list != null){
      %>
			<ul>

				<%
            for(int i=0;i<list.size();i++){
         %>
				<form action="cartremove_ok.jsp?mode=<%=mode%>" method="post">
					<input type="hidden" name="name" value="<%=name %>"/> 
					<input type="hidden" name="removeno" value="<%=list.get(i).getAc_no() %>"/>
					<li>
					<a class='thumbnail' href='#'> <%=list.get(i).getAc_name() %></a><br/>
						<div class='cart-con'>
							<h3><%=list.get(i).getAc_class() %></h3>
							<span class='preview'> <%=list.get(i).getAc_tel() %></span>
						</div>
						<input type="submit" value="X" id="btn-del">
					</li>
					
				</form>
				<%
            }
         }
         %>
			
			</ul>
		</div>
		
		
	</div>
</body>
</html>