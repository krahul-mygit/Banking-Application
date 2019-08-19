<%@page import="bank.Customer,bank.CustomerStructure" errorPage="error404.jsp" %>
<jsp:useBean id="obj" class="bank.CustomerStructure"/>
<jsp:setProperty property="*" name="obj"/>
<%
	String to_account_number=request.getParameter("toaccountnumber");
	String from_account_number=request.getParameter("customerAccountNumber");
	String amount=request.getParameter("amount");
	int status=Customer.transfer(obj, to_account_number, from_account_number, amount);
	if(status>0){
		session.setAttribute("from_account_number", from_account_number);
		session.setAttribute("to_account_number", to_account_number);
		session.setAttribute("amount", amount);
		response.sendRedirect("transferSuccessfull.jsp");
	}
	else{
		response.sendRedirect("transferFailed.jsp");
	}
%>