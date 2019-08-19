
<%@page import="bank.User,bank.Customer,bank.CustomerStructure"%>
<jsp:useBean id="s" class="bank.CustomerStructure"/>
<jsp:setProperty property="*" name="s"/>
<%
	String s1=(String)session.getAttribute("from_account_number");
	String s2=(String)session.getAttribute("to_account_number");
	String amount=(String)session.getAttribute("amount");
%>

<div class="alert alert-success alert-dismissible fade show mb-0 text-center" role="alert">
  <strong>Transfer Successful! </strong> INR <%= amount %> is successfully transferred from account number <%= s1 %> to  account number<%=s2 %> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%@include file="transfer.jsp" %>