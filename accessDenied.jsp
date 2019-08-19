<%@page import="bank.User,bank.UserStructure" %>

<jsp:useBean id="obj" class="bank.UserStructure"/>
<jsp:setProperty property="*" name="obj"/>

<html>
	<head> 
	<title> Access Denied</title>
	</head>
	<body>
		<h2> Access Denied</h2>
		<p> Please go to the login page and login first. </p>
		
	</body>
</html>