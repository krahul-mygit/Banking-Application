<html>
<head>
<title> User-SignUp </title>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
.nav-item{
			font-size:20px;
		}
		.navbar-nav a:hover{
			font-size:23px;
		}
		.navbar-brand{
			font-size:30px;
			font-weight: 500;
			font-family: serif;
		}
		.foot ul li{
			list-style-type: none;
		}
		.foot a{
			color:white;
			text-decoration: none;
		}
</style>
</head>
<body>
<nav class="navbar navbar-toggleable-md navbar-expand-md  bg-primary navbar-inverse navbar-dark fixed top">
			<div class="container">
				<a href="home.html" class="navbar-brand"> Bank Name </a>
				<button class="navbar-toggler" data-toggle="collapse" data-target="#mainnav">
					<span class="navbar-toggler-icon"> </span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="mainnav">
					<div class="navbar-nav">
						<a href="#" class="nav-item nav-link  active"> About Us </a>
						
					</div>
				</div>
			</div>
		</nav>

<div class="container">
<div class="row">
<div class="col-md-6">
<h2 class="display-4"> Sign Up</h2>
	<form action="processUser.jsp" method="post">
		<div class="form-group">
			<label for="name"> Name: </label>
					<input class="form-control input-sm" id="name" name="name" type="text" required autofocus >
			<label for="password"> Password: </label> 
					<input class="form-control" id="password" name="password" type="password" required  >
			<label for="designation">Designation:</label>
			 	<select class="form-control" id="designation" name="designation"> 
					<option value="branch-coordinator">Branch Coordinator</option>
					<option value="customer-support-associate">Customer Support Associate	</option>
					<option value="head-clerk">Head Clerk	</option>
				</select>
			
			<label for="contact"> Contact:</label>
				<input class="form-control" id="contact" name="contact" type="tel" required  >
			<label for="address"> Address: </label>
				<input class="form-control" id="address" name="address" type="text" required  > <br>
				<input class="btn btn-primary " type="submit" value="Submit" name="signup">
		</div>
	</form>
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
     <form action="">
      <div class="row">
        <div class="col-sm-6 form-group">
         <input class="form-control" id="name" name="userName" autocomplete="off" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="userEmail" autocomplete="off" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="userComments" autocomplete="off" placeholder="Comment" rows="3"></textarea><br>
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