<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>goSports.com</title>
<%@ include file="navbar.jsp"%>

<script type="text/javascript">
	function Validate() {

		var Useranswer = document.getElementById('quest').value;

		var password = document.getElementById("txtPassword").value;
		var confirmPassword = document.getElementById("txtConfirmPassword").value;
		if (Useranswer == "") {
			alert("Please Enter security answer");
			return false;
		}

		if (password != confirmPassword) {
			alert("Passwords do not match.");
			return false;
		}

		if (password == "") {
			alert("Please Enter New Password");
		}

		return true;
	}
</script>


</head>
<body>


	<div class="container">
		<div class="panel panel-primary"
			style="width: 60%; margin-left: 150px; margin-top: 50px;">

			<div class="panel-heading">
				<h3>
					<b> SECURITY QUESTION</b>
				</h3>
			</div>
			<!-- End panel-heading -->

			<div class="panel-body">

				<form:form action="updatepassword" modelAttribute="customer"
					style="margin-top: 30px">

					<h4>
						<b style="color: black"> Your Security Question </b>
					</h4>



					<label><h3>Enter username</h3></label>
					<input type="text" name="username" class="form-control">
					<p style="color: red">${uname}</p>
					<input type="submit" class="btn btn-primary"
						style="margin-top: 60px; margin-left: 250px; width: 25%; margin-bottom: 40px">


					<form:input path="securityquestion" style="font-size:20px;"
						readonly="true" class="form-control" />
					<br>

					<input id="quest" type="text" name="securityanswer"
						class="form-control">
					<br>
					<p style="color: red; font-size: 20px">${useranswer}</p>


					<label>New &nbsp Password</label>
					<br>
					<input name="pswd" type="password" id="txtPassword"
						class="form-control" />

					<br>
					<br>

					<label path="user.password">Confirm &nbsp Password</label>
					<br>
					<input type="password" id="txtConfirmPassword" class="form-control" />
					<button onclick="return Validate()" type="submit"
						class="btn btn-primary"
						; style="margin-top: 60px; margin-left: 250px; width: 25%; margin-bottom: 40px">UPDATE
						PASSWORD</button>


				</form:form>
			</div>
			<!-- End panel-body -->
		</div>

	</div>

</body>
</html>