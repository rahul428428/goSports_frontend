<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<%@ include file="navbar.jsp"%>
</head>
<body>


	<div class="container">
		<div class="panel panel-primary" style="width:60%; margin-left:150px ;  margin-top:50px ; ">

			<div class="panel-heading">
				<h3>
					<b> FORGOT PASSWORD</b>
				</h3>
			</div>
			<!-- End panel-heading -->

			<div class="panel-body">

				<form action="securityquestionform" style="margin-top:30px">
				    <label><h3>Enter username </h3></label>
					<input type="text" name="username" class="form-control">
                    <p style="color: red">${uname}</p>
                    <input type="submit" class="btn btn-primary" ; style="margin-top:60px; margin-left:250px ; width:25% ;margin-bottom:40px ">
				</form>


			</div>
			<!-- End panel-body -->
		</div>

	</div>
	<!-- End panel -->


</body>
</html>