<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<%
      String nick=request.getParameter("nick");
      MemberDAO dao=new MemberDAO();
      int count=dao.nickCheck(nick);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function nickcheck()
{
	var f=document.nickfrm; 
	if(f.nick.value=="")
	{
		alert("����ϰ��� �ϴ� �г����� �Է��ϼ���");
		f.nick.focus();
		return;
	}
	f.submit();
}
function ok()
{
	opener.frm.nick.value=document.nickfrm.nick.value;
	self.close();
}
</script>
</head>
<body>
  <center>
    <h3>�г��� �ߺ�üũ</h3>
    <form name=nickfrm method=post action="nickCheck.jsp">
    ID:<input type=text name=nick size=10 id="nick" value="<%=nick==null?"":nick%>">
    <input type=button value=Ȯ�� onclick="nickcheck()">
    </form><br>
    <table border=0 width=200>
      <tr>
        <td align=center>
        <%
           if(count==0 && nick!=null)
           {
        %>
            <font color=blue>
             <%=nick %>��(��) <br>��밡����  �г����Դϴ�
            </font>
        <%
           }
           else if(count>0 && nick!=null)
           {
        %>
              <font color=blue>
               <%=nick %>��(��) <br>�̹� ������� �г����Դϴ�
              </font>
              <script type="text/javascript">
               document.nickfrm.nick.value="";
               document.nickfrm.nick.focus();
              </script>
        <%	   
           }
        %>
        </td>
        
      </tr>
       <%
           if(count==0 && nick!=null)
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





