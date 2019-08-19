<html>
<head>
	<title>Bank Name</title>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style type="text/css">
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
					<div class="navbar-nav">
						<a href="#" class="nav-item nav-link  active"> About Us </a>
						
					</div>
				</div>
			</div>
		</nav>
		<div class="container-fluid mt-5 ">
		<div class="row">
			<div class="col-md-6">
				<img src="bank0.jpg" alt="Bank Image" class="img-fluid">
			</div>
			<div class="col-md-6 ml-6">
				<h3 class="display-4"> Login</h3>
				<form action="processUserLogin.jsp" method="post">
					<div class="form-group"><label for="userid">User ID: </label>
						<input type="text" id="userid" autofocus name="userid" class="form-control input-sm" placeholder="User ID">
					</div>
					<div class="form-group"><label for="password"> Password: </label>
						<input type="password" id="password" name="password" class="form-control" placeholder="Password">
					</div>
					<div class="form-group">
						<input type="submit" name="login" value="Login" class="btn btn-primary">
					</div>
				</form>
				<p class="lead"> Don't have an account?</p>
				<form action="userSignUp.jsp" method="post">
					<input type="submit" name="signup" value="Sign Up" class="btn btn-primary">
				</form>
			</div>
		</div>
	</div>
		<div class="container-fluid bg-primary">
  <h2 class="text-center display-4 py-2 text-white">Contact Us</h2>
  <div class="row text-white">
    <div class="col-sm-5 text-center">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Noida, Uttar Pradesh</p>
      <p><span class="glyphicon glyphicon-phone"></span> +91 9650579901</p>
      <p><span class="glyphicon glyphicon-envelope"></span>helpdesk@bankname.com</p> 
    </div>
    <div class="col-sm-7 justify-content-center">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="3"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group justify-content-end">
          <button class="btn btn-danger pull-right" type="submit">Send</button>
        </div>
      </div> 
    </div>
  </div>
</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>