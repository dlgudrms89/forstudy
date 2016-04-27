<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
   request.setCharacterEncoding("utf-8");
   String name = request.getParameter("name");
   String mode=request.getParameter("mode");
   if(mode==null)
      mode="0";
   if(name==null)
      name="";
   String no = request.getParameter("removeno");
   int ino = Integer.parseInt(no);
   List<AcinfoDTO> list = (ArrayList<AcinfoDTO>)session.getAttribute("list");
   for(int i=0;i<list.size();i++){
      if(list.get(i).getAc_no()==ino){
         list.remove(i);
      }
   }
      response.sendRedirect("main.jsp?mode="+mode+"&name="+name);
   
%>