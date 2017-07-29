<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<title>Registration page</title>
<%@ include file="navbar.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>

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
<body >

	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4>Sign up</h4>
			</div>
			<!-- end of panel-heading -->

			<div class="panel-body" style="padding-top: 40px; height: 100%;">

				<form:form action="savecustomer" method="post"
					modelAttribute="customer">
					<div class="col-sm-4">
						<h4>
							<b> Customer Details : </b>
						</h4>
						<br> <br>
						<form:label path="firstname">First Name</form:label>
						<br>
						<form:input path="firstname" class="form-control" />
						<form:errors path="firstname" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="lastname">Last Name</form:label>
						<br>
						<form:input path="lastname" class="form-control" />
						<form:errors path="lastname" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="email">Email Address</form:label>
						<br>
						<form:input path="email" class="form-control" />
						<form:errors path="email" cssStyle="color:red"></form:errors>
						<p style="color: red">${duplicateEmail}</p>
						<br>
						<form:label path="phone">Mobile number</form:label>
						<br>
						<form:input path="phone" class="form-control" />
						<form:errors path="phone" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="user.username">Username</form:label>
						<br>
						<form:input path="user.username" class="form-control" />
						<form:errors path="user.username" cssStyle="color:red"></form:errors>
						<p style="color: red">${duplicateUser}</p>
						<br> <label>Password</label> <br> <input type="password"
							id="txtPassword" class="form-control" />
						<form:errors path="user.password" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="user.password">Confirm Password</form:label>
						<br>
						<form:input type="password" id="txtConfirmPassword"
							path="user.password" class="form-control" />

					</div>
					<!-- End col-sm-4 -->

					<div class="col-sm-4">
						<h4>
							<b> Billing Address : </b>
						</h4>
						<br> <br>
						<form:label path="billingAddress.streetname">Streetname</form:label>
						<br>
						<form:input id="b1" path="billingAddress.streetname"
							class="form-control" />
						<form:errors path="billingAddress.streetname" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="billingAddress.apartmentnumber">Apartment Number</form:label>
						<br>
						<form:input id="b2" path="billingAddress.apartmentnumber"
							class="form-control" />
						<form:errors path="billingAddress.apartmentnumber"
							cssStyle="color:red"></form:errors>
						<br>

						<form:label path="billingAddress.city">City </form:label>
						<br>
						<form:input id="b3" path="billingAddress.city"
							class="form-control" />
						<form:errors path="billingAddress.city" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="billingAddress.state">State</form:label>
						<br>
						<form:input id="b4" path="billingAddress.state"
							class="form-control" />
						<form:errors path="billingAddress.state" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="billingAddress.country">Country</form:label>
						<br>
						<form:input id="b5" path="billingAddress.country"
							class="form-control" />
						<form:errors path="billingAddress.country" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="billingAddress.zipcode">Zipcode</form:label>
						<br>
						<form:input id="b6" path="billingAddress.zipcode"
							class="form-control" />
						<form:errors path="billingAddress.zipcode" cssStyle="color:red"></form:errors>
						<br>
					</div>
					<!-- End col-sm-4 -->

					<div class="col-sm-4">
						<h4>
							<b> Shipping Address : </b>
						</h4>
						<br> <br>
						<form:label path="shippingAddress.streetname">Streetname</form:label>
						<br>
						<form:input id="s1" path="shippingAddress.streetname"
							class="form-control" />
						<form:errors path="shippingAddress.streetname"
							cssStyle="color:red"></form:errors>
						<br>

						<form:label path="shippingAddress.apartmentnumber">Apartment Number</form:label>
						<br>
						<form:input id="s2" path="shippingAddress.apartmentnumber"
							class="form-control" />
						<form:errors path="shippingAddress.apartmentnumber"
							cssStyle="color:red"></form:errors>
						<br>

						<form:label path="shippingAddress.city">City </form:label>
						<br>
						<form:input id="s3" path="shippingAddress.city"
							class="form-control" />
						<form:errors path="shippingAddress.city" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="shippingAddress.state">State</form:label>
						<br>
						<form:input id="s4" path="shippingAddress.state"
							class="form-control" />
						<form:errors path="shippingAddress.state" cssStyle="color:red"></form:errors>
						<br>


						<form:label path="shippingAddress.country">Country</form:label>
						<br>
						<form:input id="s5" path="shippingAddress.country"
							class="form-control" />
						<form:errors path="shippingAddress.country" cssStyle="color:red"></form:errors>
						<br>

						<form:label path="shippingAddress.zipcode">Zipcode</form:label>
						<br>
						<form:input id="s6" path="shippingAddress.zipcode"
							class="form-control" />
						<form:errors path="shippingAddress.zipcode" cssStyle="color:red"></form:errors>
						<br>
					</div>
					<!-- End col-sm-4 -->
					<br>

					<div class="form-group">
						<br> <input style="margin-left: 18px" type="checkbox"
							id="Copyaddress" onclick="copy()" /><label>Billing and
							Shipping address are same</label>
					</div>
					<br>
					<br>
					<input type="submit" value="Sign-Up" onclick="return Validate()"
						class="btn btn-danger"
						style="margin-left: 420px; margin-top: 30px" />

				</form:form>

			</div>
			<!-- end of  panel-body -->

		</div>
		<!-- end of panel -->

	</div>
	<!-- end of container class -->

</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>