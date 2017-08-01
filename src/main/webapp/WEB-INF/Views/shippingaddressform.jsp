<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:url value="cartorder${cartid}" var="url"></c:url>
	<form:form action="${url }" modelAttribute="shipingAddress">
		<form:hidden path="id" />



		<div class="panel panel-default" style="width:35%; margin-left:440px">
			<div class="panel-heading">
				<h3>Shipping Address</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<form:label path="streetname">Enter Streetname</form:label>
					<form:input path="streetname" class="form-control" />
					<form:errors path="streetname" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="apartmentnumber">Enter apartmentnumber</form:label>
					<form:input path="apartmentnumber" class="form-control" />
					<form:errors path="apartmentnumber" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="city">Enter City</form:label>
					<form:input path="city" class="form-control" />
					<form:errors path="city" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="state">Enter State</form:label>
					<form:input path="state" class="form-control" />
					<form:errors path="state" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="country">Enter Country</form:label>
					<form:input path="country" class="form-control" />
					<form:errors path="country" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="zipcode">Enter Zipcode</form:label>
					<form:input path="zipcode" class="form-control" />
					<form:errors path="zipcode" cssStyle="color:red"></form:errors>
				</div>
				<div class="form-group">
					<input type="submit" value="Next" class="btn btn-primary" style="width:200px" >
				</div>
			</div>
		</div>
	</form:form>

</body>
</html>