<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Product Form</title>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<%@ include file="navbar.jsp"%>


<script type="text/javascript">
	function Validate() {
		var password = document.getElementById("txtPassword").value;
		var confirmPassword = document.getElementById("txtConfirmPassword").value;

		if (password != confirmPassword) {
			alert("Passwords do not match.");
			return false;
		}
		return true;
	}
</script>

<script type="text/javascript">
	function copy() {
		if (document.getElementById('Copyaddress').checked == true) {
			document.getElementById('s1').value = document.getElementById('b1').value;
			document.getElementById('s2').value = document.getElementById('b2').value;
			document.getElementById('s3').value = document.getElementById('b3').value;
			document.getElementById('s4').value = document.getElementById('b4').value;
			document.getElementById('s5').value = document.getElementById('b5').value;
			document.getElementById('s6').value = document.getElementById('b6').value;

		}
	}
</script>

</head>
<body>



	<div class="container">


		<form action="updatecustomer" method="post">


			<br> <br>
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: black">
					<h4>
						<b style="color: white"> Customer Details </b>
					</h4>
				</div>
				<div class="container" style="width: 90%">
					<br> <br> <label>First Name</label> <br> <input
						type="text" name="firstname" value="${customerObj.firstname}"
						class="form-control"> <br> <label> Last Name</label>
					<input type="text" name="lastname" value="${customerObj.lastname}"
						class="form-control"> <br> <label>Email
						Address</label> <input type="text" readonly="true"
						value="${customerObj.email}" class="form-control"> <br>
					<label>Mobile Number</label> <input type="text" name="mobilenumber"
						value="${customerObj.phone}" class="form-control"> <br>
					<label>Username</label> <input type="text" readonly="true"
						value="${customerObj.user.username}" class="form-control">
					<br> <label> New Password</label> <input type="password" 
						id="txtPassword" name="password" class="form-control"> <br>

					<label>Confirm Password</label> <input type="password"
						id="txtConfirmPassword" class="form-control"> <br>




				</div>
			</div>


			<br> <br>
			<div class="panel panel-default">
				<div class="panel panel-heading" style="background-color: black">
					<h4>
						<b style="color: white"> Billing Address </b>
					</h4>
				</div>
				<div class="panel-body">
					<div class="container" style="width: 90%">
						<label>Streetname</label> <br> <input name="bstreet" value="${customerObj.shippingAddress.streetname}" id="b1"
							 class="form-control" /> <br> <label>Apartment
							Number</label> <br> <input name="bapartment" value="${customerObj.shippingAddress.apartmentnumber}"  id="b2" class="form-control" /> <br>
						<label>City </label> <br> <input name="bcity" value="${customerObj.shippingAddress.city}" id="b3" class="form-control" />
						<br> <label>State</label> <br> <input name="bstate" value="${customerObj.shippingAddress.state}" id="b4"
							class="form-control" /> <br> <label>Country</label> <br>
						<input name="bcountry" value="${customerObj.shippingAddress.country}" id="b5" class="form-control" /> <br> <label">Zipcode</label>
						<br> <input name="bzip" value="${customerObj.shippingAddress.zipcode}" id="b6" class="form-control" /> <br>
					</div>
				</div>
			</div>

			<br> <br>
			<div class="panel panel-default">
				<div class="panel panel-heading" style="background-color: black">
					<h4>
						<b style="color: white"> Shipping Address </b>
					</h4>
				</div>
				<div class="panel-body">
					<div class="container" style="width: 90%">

						<label>Streetname</label> <br> <input name="sstreet" value="${customerObj.billingAddress.streetname}" id="s1"
							class="form-control" /> <br> <label>Apartment
							Number</label> <br> <input name="sapartment" value="${customerObj.billingAddress.apartmentnumber}" id="s2" class="form-control" /> <br>

						<label>City </label> <br> <input name="scity" value="${customerObj.billingAddress.city}" id="s3" class="form-control" />
						<br> <label>State</label> <br> <input name="sstate" value="${customerObj.billingAddress.state}" id="s4"
							class="form-control" /> <br> <label>Country</label> <br>
						<input name="scountry" value="${customerObj.billingAddress.country}" id="s5" class="form-control" /> <br> <label>Zipcode</label>
						<br> <input name="szip"  value="${customerObj.billingAddress.zipcode}" id="s6" class="form-control" /> <br>

						<div class="form-group">
							<br> <input style="margin-left: 0px" type="checkbox"
								id="Copyaddress" onclick="copy()" /><label>Billing and
								Shipping address are same</label>
						</div>
						<br>
					</div>
				</div>
			</div>


			<input type="submit" value="Update" onclick="return Validate()"
				class="btn btn-danger"
				style="margin-left: 420px; margin-top: 30px; width: 180; background-color: green" />

		</form>

	</div>

</body>
</html>