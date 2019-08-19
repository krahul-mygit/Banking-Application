<%@ page import="bank.User,bank.UserStructure,java.sql.*,bank.Customer,java.util.ArrayList,java.util.List,bank.CustomerStructure" %>
<jsp:useBean id="obj" class="bank.UserStructure"/>
<jsp:setProperty property="*" name="obj"/>

<%
	int status=User.queries(obj);
	if(status>0){
		response.sendRedirect("userQueries.jsp");
	}
%>
