<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<%
      String id=request.getParameter("id");
      MemberDAO dao=new MemberDAO();
      int count=dao.idCheck(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function idcheck()
{
	var f=document.idfrm; //$('#idfrm')
	if(f.id.value=="")
	{
		alert("����ϰ��� �ϴ� ID�� �Է��ϼ���");
		f.id.focus();
		return;
	}
	f.submit();
}
function ok()
{
	opener.frm.id.value=document.idfrm.id.value;
	self.close();
}
</script>
</head>
<body>
  <center>
    <h3>ID�ߺ�üũ</h3>
    <form name=idfrm method=post action="idCheck.jsp">
    ID:<input type=text name=id size=10 id="id" value="<%=id==null?"":id%>">
    <input type=button value=Ȯ�� onclick="idcheck()">
    </form><br>
    <table border=0 width=200>
      <tr>
        <td align=center>
        <%
           if(count==0 && id!=null)
           {
        %>
            <font color=blue>
             <%=id %>��(��) <br>��밡���� ID�Դϴ�
            </font>
        <%
           }
           else if(count>0 && id!=null)
           {
        %>
              <font color=blue>
               <%=id %>��(��) <br>�̹� ������� ID�Դϴ�
              </font>
              <script type="text/javascript">
               document.idfrm.id.value="";
               document.idfrm.id.focus();
              </script>
        <%	   
           }
        %>
        </td>
        
      </tr>
       <%
           if(count==0 && id!=null)
           {
       %>
               <tr>
                 <td align="center">
                  <input type=button value=Ȯ�� onclick="ok()">
                 </td>
               </tr>
       <%
           }
       %>
    </table>
  </center>
</body>
</html>





