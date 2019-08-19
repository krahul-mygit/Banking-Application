<%@ page import="bank.User"%>
<jsp:useBean id="obj" class="bank.UserStructure"/>
<jsp:setProperty property="*" name="obj"/>


<% 
boolean exist=false;
long rand;
String s;
do{
	rand=User.generateRand();
	 s="BANK"+rand;
	obj.setId(s);
	exist=User.isNumberExist(s);
	if(exist==false){
		break;
	}
}while(exist==true);	

int i=User.insert(obj);
if(i>0){
	session.setAttribute("user_id", s);
	response.sendRedirect("userSignedUp.jsp");
}
else{
	response.sendRedirect("userSigningError.jsp");
}
%>
