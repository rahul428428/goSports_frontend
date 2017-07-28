<title>Login</title>


<%@ include file="navbar.jsp"%>


<html lang="en">
<head>
<meta charset="utf-8">

</head>
<body>

	<div class="container" style="margin-top: 100px; width: 30%;">
		<div class="panel  panel-info ">
			<div class="panel-heading">
				<h4>Sign In</h4>
			</div>
			<!-- end of pannel heading -->

			<div class="panel-body" style="padding-top: 40px">
			  <c:url value="/j_spring_security_check" var="login1" ></c:url>
				<form action="${login1}" method="post">
					<div class="input-group" style="margin-bottom: 30px">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							class="form-control" name="j_username"  
							placeholder="username">
					</div>
					<!-- input type for user name  -->

					<div class="input-group" s style="margin-bottom: 25px">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input type="password"
							class="form-control" name="j_password" placeholder="password">
					</div>
					<!--  input type for password -->

					 
					<div style="margin-top: 10px">
						<button type="submit" class="btn btn-success">Login </button>
						<!-- Button -->
				</form>
				<a href="#">Forgot password?</a>
				<!-- for forgot password  -->
			</div>

			<br>

			<div
				style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
				Don't have an account! <a href="registration">Sign Up Here </a>
			</div>

		</div>
		<!-- end of panel body -->
	</div>
	<!-- end of panel -->
	</div>
	<!--  end of container -->

	<br>
	<br>
	<br>
	<footer style="background-color: #bfbfbf">
		<div class="container" style="margin-top: 85px;">
			<div class="row">

				<div class="col-sm-2">
					<h6>Copyright &copy;2017 goSports.com</h6>
				</div>
				<!-- end col-sm-2 -->

				<div class="col-sm-4">
					<h6>About us</h6>
					<p>goSports.in provides a platform for sports persons to buy
						quality sports, fitness and health products. We guarantee you a
						secure shopping experience on our Online Store. Our payment
						partners and shipping partners ensure a safe and comfortable
						shopping experience for you.</p>
				</div>
				<!-- end col-sm-4 -->

				<div class="col-sm-2">
					<h6>Navigation</h6>
					<ul class="unstyled">
						<li><a href="index">Home </a></li>
						<li><a href="#">Servies </a></li>
						<li><a href="#">Links </a></li>
						<li><a href="#">Contact us </a></li>
					</ul>
				</div>
				<!-- end col-sm-2 -->

				<div class="col-sm-2">
					<h6>Follow Us</h6>
					<ul class="unstyled">
						<li><a href="#">Twitter </a></li>
						<li><a href="#">Facebook </a></li>
						<li><a href="#">Google Plus </a></li>
						<li><a href="#">Instagram</a></li>
					</ul>
				</div>
				<!-- end col-sm-2 -->

				<div class="col-sm-2">
					<h6>Policies</h6>
					<ul class="unstyled">
						<li><a href="#">Privacy-Policy </a></li>
						<li><a href="#">Shipping Policy </a></li>
						<li><a href="#">Return Policy </a></li>
						<li><a href="#">Our Partner & Affiliates</a></li>
					</ul>
				</div>
				<!-- end col-sm-2 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</footer>
	<!-- end footer -->


</body>
</html>
