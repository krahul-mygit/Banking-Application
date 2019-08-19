<%@page import="bank.User,bank.Customer,bank.CustomerStructure"%>
<jsp:useBean id="obj" class="bank.CustomerStructure"/>
<jsp:setProperty property="*" name="obj"/>
<%
	obj.setCustomerAccountNumber(request.getParameter("customerAccountNumber"));
	String acccount_number=obj.getCustomerAccountNumber();
	String balance=obj.getBalance();
	int status=Customer.deposit(obj);
	if(status>0){
		session.setAttribute("account_number",acccount_number);
		session.setAttribute("balance", balance);
		response.sendRedirect("depositSuccessfull.jsp");
	}else{
		response.sendRedirect("depositFailed.jsp");
	}
%>