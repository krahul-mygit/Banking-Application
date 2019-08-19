<%@ page import="bank.User,bank.UserStructure,java.sql.*" %>
<jsp:useBean id="obj" class="bank.UserStructure"/>
<jsp:setProperty property="*" name="obj"/>
<%
	String userid=null;
	try{	
		userid=(String)session.getAttribute("userid");
	 	if(userid==null || userid.isEmpty()){
			response.sendRedirect("index.jsp");
		}else{ 
			Connection con=User.getConnection();
			PreparedStatement pre=con.prepareStatement("select * from bankUser where userId=?");
			pre.setString(1, userid);
			ResultSet rs=pre.executeQuery();
			while(rs.next()){
				obj.setId(userid);
				obj.setName(rs.getString("userName"));
			}
			if(userid.equals(obj.getId())){
				session.setAttribute("userid",userid);
			}else{
				response.sendRedirect("accessDenied.jsp");
			}
		}
	}catch(Exception e){
		System.out.println("Home page Exception is: "+ e);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Transfer</title>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style type="text/css">
    	.foot a{
			color:white;
			text-decoration: none;
		}
    	.nav-item{
			font-size:20px;
			
		}
		.foot{
			font-family:Times, Times New Roman, serif;
			font-size:20px;
		}
		.foot ul li{
			list-style-type: none;
		}
		.navbar-nav a:hover{
			font-size:23px;
		}
		.navbar-brand{
			font-size:30px;
			font-weight: 500;
			font-family: serif;
		}
		.dropdown a:hover{
			font-size:15px;
			background-color:silver;
		}
    </style>
</head>
<body>
	
	<nav class="navbar navbar-toggleable-md navbar-expand-md  bg-primary navbar-inverse navbar-dark fixed top">
			<div class="container">
				<a href="home.jsp" class="navbar-brand"> Bank Name </a>
				<button class="navbar-toggler" data-toggle="collapse" data-target="#mainnav">
					<span class="navbar-toggler-icon"> </span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="mainnav">
					<div class="navbar-nav navigation-links">
						
						<a href="home.jsp" class="nav-item nav-link  "> Home </a>
						<a href="getCustomers.jsp" class="nav-item nav-link"> Customers </a>
						<a href="newaccount.jsp" class="nav-item nav-link "> New Account </a>
						<a href="deposit.jsp" class="nav-item nav-link "> Deposit </a>
						<a href="withdraw.jsp" class="nav-item nav-link "> Withdraw </a>
						<a href="transfer.jsp" class="nav-item nav-link active"> Transfer </a>	
						<a href="getQueries.jsp" class="nav-item nav-link "> User Queries </a>
						<div class="dropdown pt-1">
							<button type="button" id="dropdownMenuButton"class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							<span> <strong> <% out.print(obj.getName()); %></strong></span>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a  class="dropdown-item" href="myaccount.jsp"  > My Account </a>
								<a href="help.jsp" class="dropdown-item" > Help </a>
								<div class="dropdown-divider"> </div>
									<a href="logout.jsp" class="dropdown-item">Log Out</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<div class="container text-center mt-3">
			<h4 class="display-4"> Help </h4>
		</div>
	<div class="container py-4 my-2">
		<div class="row">
			<div class="col-md-10">
				<h4 class="text-left">1. To Open a New Account </h4>
				<ol>
					<li> Go to the navigation bar and select Create Account. </li>
					<li> You will be directed to a new page. Now fill the mandatory details which are: </li>
						<ul> 
							<li> Name </li>
							<li> Email </li>
							<li> Password </li>
							<li> Contact </li>
							<li> Address </li>
						</ul>
					<li> After filling the above details select Create Account button which is at the bottom. </li>
				 	<li> Your account will be created and you will be redirected to a new page which you display you Account Number and User ID. </li>
				</ol>
				<h4 class="text-left">2. To Deposit money. </h4>
					<ol>
					<li> Go to the navigation bar and select Deposit. </li>
					<li> You will be directed to a new page. Now fill the mandatory details which are: </li>
						<ul> 
							<li> Account Number(to which you want to deposit) </li>
							<li> Amount </li>
						</ul>
					<li> After filling the above details click Deposit. </li>
				 	<li> You will be redirected to a new page which will show your deposit status. </li>
				</ol>
				<h4 class="text-left">3. To Withdraw money. </h4>
					<ol>
					<li> Go to the navigation bar and select Withdraw. </li>
					<li> You will be directed to a new page. Now fill the mandatory details which are: </li>
						<ul> 
							<li> Account Number(from which you want to withdraw) </li>
							<li> Amount </li>
						</ul>
					<li> After filling the above details click Withdraw. </li>
				 	<li> You will be redirected to a new page which will show your withdraw status. </li>
				</ol>
				<h4 class="text-left">4. To Transfer money. </h4>
					<ol>
					<li> Go to the navigation bar and select Transfer. </li>
					<li> You will be directed to a new page. Now fill the mandatory details which are: </li>
						<ul>
							<li> From:(Account number from which you want to transfer) </li> 
							<li> To:(Account number to which you want to transfer) </li>
							<li> Amount </li>
						</ul>
					<li> After filling the above details click Transfer. </li>
				 	<li> You will be redirected to a new page which will show your transfer status. </li>
				</ol>
			</div>
		</div>
	
	</div>
       <div class="container-fluid bg-primary ">
  <h2 class="text-center display-4 py-2 text-white">Contact Us</h2>
  <div class="row text-white foot">
    <div class="col-sm-5 text-center">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Noida, Uttar Pradesh</p>
      <p><span class="glyphicon glyphicon-phone"></span> +91 9650579901</p>
      <p><span class="glyphicon glyphicon-envelope"></span>helpdesk@bankname.com</p> 
    </div>
    <div class="col-sm-7 justify-content-center">
     <form action="processQueries.jsp">
      <div class="row">
        <div class="col-sm-6 form-group">
         <input class="form-control" id="name" name="userName" autocomplete="off" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="userEmail" autocomplete="off" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="userComments" placeholder="Comment" rows="3"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group justify-content-end">
          <input class="btn btn-secondary pull-right" type="submit" value="Send">
        </div>
      </div>
      </form> 
    </div>
  </div>
</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>