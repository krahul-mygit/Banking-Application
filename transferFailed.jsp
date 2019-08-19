
<%@page import="bank.User,bank.Customer,bank.CustomerStructure"%>
<jsp:useBean id="s" class="bank.CustomerStructure"/>
<jsp:setProperty property="*" name="s"/>
<%
	
%>

<div class="alert alert-danger alert-dismissible fade show mb-0 text-center" role="alert">
  <strong>Transfer Failed! </strong> Please try again later. 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%@include file="transfer.jsp" %>