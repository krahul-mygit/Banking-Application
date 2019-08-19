
<%@ page import="bank.User"%>
<jsp:useBean id="obj" class="bank.UserStructure"/>
<jsp:setProperty name="obj" property="*"/>

<%
	obj.setId(request.getParameter("userid"));
	obj.setPassword(request.getParameter("password"));
	boolean access=User.findUser(obj);
	
	if(access){
		String s=obj.getId();
		session.setAttribute("userid", s);
		response.sendRedirect("home.jsp");
	}
	else{
		response.sendRedirect("index.jsp");
	}
%>