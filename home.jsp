<%@page import="bank.User,bank.UserStructure,java.sql.*" %>
<%@page errorPage="error404.jsp" %>
<jsp:useBean id="obj" class="bank.UserStructure"/>
<jsp:setProperty property="*" name="obj"/> 

<%@page errorPage="error404.jsp" %>
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
	<title> Bank Name-Home </title>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Font Awesome CDN -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
    <style type="text/css">
    	.buttons{
    		margin-top:20px;
    		margin-bottom:10px;
    	}
    	#login{
    		padding:10 20 10 20px;
    		font-size:20px;
    	}
    	#signup{
    		padding:10 20 10 20px;
    		font-size:20px;
    	}
    	.carousel-inner > .carousel-item > img {
  			width:100%;
  			height:450px;
		}
		.foot ul li{
			list-style-type: none;
		}
		.nav-item{
			font-size:20px;
			
		}
		.navbar-nav a:hover{
			font-size:23px;
		}
		.dropdown a:hover{
			font-size:15px;
			background-color:silver;
		}
		.navbar-brand{
			font-size:30px;
			font-weight: 500;
			font-family: serif;	
		}
		.foot a{
			color:white;
			text-decoration: none;
		}
		.foot{
			font-family:Times, Times New Roman, serif;
			font-size:20px;
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
						
						<a href="home.jsp" class="nav-item nav-link  active"> Home </a>
						<a href="getCustomers.jsp" class="nav-item nav-link"> Customers </a>
						<a href="newaccount.jsp" class="nav-item nav-link "> New Account </a>
						<a href="deposit.jsp" class="nav-item nav-link "> Deposit </a>
						<a href="withdraw.jsp" class="nav-item nav-link "> Withdraw </a>
						<a href="transfer.jsp" class="nav-item nav-link "> Transfer </a>	
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
		<div class="middle">
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img class="d-block w-100" src="loan.jpg" alt="First slide">
      				<div class="carousel-caption text-dark">
      					<h2> Home Loans at affordable interest. </h2>
      				</div>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="carousel1.jpg" alt="Second slide">
      				<div class="carousel-caption text-dark">
      					<h2> Trusted Worldwide </h2>
      				</div>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="money.jpg" alt="Third slide">
      				<div class="carousel-caption text-dark">
      					<h2> Trusted Worldwide </h2>
      				</div>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="3.jpg" alt="Fourth slide">
      				<div class="carousel-caption text-dark">
      					<h2> Trusted Worldwide </h2>
      				</div>
    			</div>
  			</div>
		  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
		<!-- <div class="container ">
			<h3 class="display-3"> About Us </h3>
			<p class="lead py-2">The State Bank of India (SBI) is an Indian multinational, public sector banking and financial services statutory body. It is a government corporation statutory body headquartered in Mumbai, Maharashtra. SBI is ranked as 216th in the Fortune Global 500 list of the world's biggest corporations of 2018. It is the largest bank in India with a 23% market share in assets, besides a share of one-fourth of the total loan and deposits market.
			The bank descends from the Bank of Calcutta, founded in 1806, via the Imperial Bank of India, making it the oldest commercial bank in the Indian subcontinent. The Bank of Madras merged into the other two "presidency banks" in British India, the Bank of Calcutta and the Bank of Bombay, to form the Imperial Bank of India, which in turn became the State Bank of India in 1955. The Government of India took control of the Imperial Bank of India in 1955, with Reserve Bank of India (India's central bank) taking a 60% stake, renaming it the State Bank of India.
			</p>
		</div> -->
	<div class="container mt-3">
		<nav class="nav nav-pills flex-column flex-md-row">
			<a href="#aboutus" class="nav-link active" style="font-size:25px; font-weight:300" data-toggle="tab" >About Us</a>
			<a href="#mission" class="nav-link " style="font-size:25px; font-weight:300"  data-toggle="tab">Mission</a>
			<a href="#services" class="nav-link " style="font-size:25px; font-weight:300"  data-toggle="tab">Services</a>
		</nav>
	</div>
	<div class="container tab-content">
		<div class="tab-pane active" id="aboutus">
		<p class="lead pt-2" style="font-size:20px;">
		The State Bank of India (SBI) is an Indian multinational, public sector banking and financial services statutory body. It is a government corporation statutory body headquartered in Mumbai, Maharashtra. SBI is ranked as 216th in the Fortune Global 500 list of the world's biggest corporations of 2018. It is the largest bank in India with a 23% market share in assets, besides a share of one-fourth of the total loan and deposits market.
			The bank descends from the Bank of Calcutta, founded in 1806, via the Imperial Bank of India, making it the oldest commercial bank in the Indian subcontinent. The Bank of Madras merged into the other two "presidency banks" in British India, the Bank of Calcutta and the Bank of Bombay, to form the Imperial Bank of India, which in turn became the State Bank of India in 1955. The Government of India took control of the Imperial Bank of India in 1955, with Reserve Bank of India (India's central bank) taking a 60% stake, renaming it the State Bank of India.
		</p>
		</div>
	<div class="tab-pane" id="mission">
		<p class="lead">
		The State Bank of India (SBI) is an Indian multinational, public sector banking and financial services statutory body. It is a government corporation statutory body headquartered in Mumbai, Maharashtra. SBI is ranked as 216th in the Fortune Global 500 list of the world's biggest corporations of 2018. It is the largest bank in India with a 23% market share in assets, besides a share of one-fourth of the total loan and deposits market.
			The bank descends from the Bank of Calcutta, founded in 1806, via the Imperial Bank of India, making it the oldest commercial bank in the Indian subcontinent. The Bank of Madras merged into the other two "presidency banks" in British India, the Bank of Calcutta and the Bank of Bombay, to form the Imperial Bank of India, which in turn became the State Bank of India in 1955. The Government of India took control of the Imperial Bank of India in 1955, with Reserve Bank of India (India's central bank) taking a 60% stake, renaming it the State Bank of India.
		</p>
		</div>
		<div class="tab-pane" id="services">
		<p class="lead">
		The State Bank of India (SBI) is an Indian multinational, public sector banking and financial services statutory body. It is a government corporation statutory body headquartered in Mumbai, Maharashtra. SBI is ranked as 216th in the Fortune Global 500 list of the world's biggest corporations of 2018. It is the largest bank in India with a 23% market share in assets, besides a share of one-fourth of the total loan and deposits market.
			The bank descends from the Bank of Calcutta, founded in 1806, via the Imperial Bank of India, making it the oldest commercial bank in the Indian subcontinent. The Bank of Madras merged into the other two "presidency banks" in British India, the Bank of Calcutta and the Bank of Bombay, to form the Imperial Bank of India, which in turn became the State Bank of India in 1955. The Government of India took control of the Imperial Bank of India in 1955, with Reserve Bank of India (India's central bank) taking a 60% stake, renaming it the State Bank of India.
		</p>
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