<%@page import="bank.User,bank.Customer"%>
<jsp:useBean id="obj" class="bank.CustomerStructure"/>
<jsp:setProperty property="*" name="obj"/>

<%
	String accountNumber;
	long randomNumber;
	String userid;
	
	boolean exist=false;
	do{
		 randomNumber=User.generateRand();
		 accountNumber="2616507"+randomNumber;
		 userid="BANKC"+randomNumber;
		 exist=Customer.isUseridExist(accountNumber);
		 if(exist==false){
			 obj.setCustomerAccountNumber(accountNumber);
			 obj.setUserid(userid);
			 obj.setBalance("0.00");
			 break;
		 }
	}while(exist);
	int i=Customer.insert(obj);
	if(i>0){
		session.setAttribute("account_number",accountNumber );
		session.setAttribute("userId", userid);
		response.sendRedirect("newAccountOpened.jsp");
	}else{
		
		
		//request.setAttribute("errorMessage","Sorry an error occurred. Please try again.");
		
		response.sendRedirect("newAccountError.jsp");
	}
%>