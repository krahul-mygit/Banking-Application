<%@page import="bank.User,bank.Customer,bank.CustomerStructure"%>
<jsp:useBean id="obj" class="bank.CustomerStructure"/>
<jsp:setProperty property="*" name="obj"/>
<%
	int status=Customer.withdraw(obj);
	if(status>0){
		response.sendRedirect("withdrawSuccessful.jsp");
	}
	else{
		response.sendRedirect("withdrawFailed.jsp");
	}
%>