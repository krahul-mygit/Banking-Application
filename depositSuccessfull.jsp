
<%@page import="bank.User,bank.Customer,bank.CustomerStructure"%>
<jsp:useBean id="s" class="bank.CustomerStructure"/>
<jsp:setProperty property="*" name="s"/>
<%
	s.setCustomerAccountNumber((String)session.getAttribute("account_number"));
	s.setBalance((String)session.getAttribute("balance"));
%>

<div class="alert alert-success alert-dismissible fade show mb-0 text-center" role="alert">
  <strong>Deposit Successful!</strong> INR <%= s.getBalance()%> is successfully deposited to your account <%=s.getCustomerAccountNumber() %> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%@include file="deposit.jsp" %>