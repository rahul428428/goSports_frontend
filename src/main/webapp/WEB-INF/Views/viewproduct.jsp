<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert here</title>
</head>
<body>


	<div class="container" style="width: 75%;">
		<div class="panel panel-primary">
			<div class="panel-heading" style="background-color: black">
				<b><h2>Details About the Product</h2></b>
			</div>
			<!-- end of panel heading -->

			<div class="panel-body" style="padding-top: 40px;">
				<div class="col-md-7">
					<c:url value="/resources/images/${product.id}.png" var="imageUrl">
					</c:url>
					<img src="${imageUrl}" style="width: 60%; height: 60%">
				</div>
				<br> <br>
				<table class="table table-hover" style="width: 40%;">



					<tr>
						<td></td>
						<td><b><h3 style="margin-left: -80px; font-weight: bold;">
									${product.productname}</h3></b></td>
					</tr>
					<!-- End of first row -->

					<tr>
						<td><strong> Price</strong></td>
						<td><i class="fa fa-inr" style="font-size: 18px; color: red"></i>
							<b style="color: red"> ${product.price} </b></td>
					</tr>
					<!-- end of second row -->


					<tr>
						<td><strong>Quantity</strong></td>
						<td>${product.quantity}</td>
					</tr>
					<!-- End of third row -->


					<tr>
						<td><strong>Description</strong></td>
						<td>${product.description}</td>
					</tr>
					<!-- end of  fourth row -->



				</table>
				<br>
				<c:url value="cartaddtocart${product.id}" var="cart"></c:url>
				
				<form action="${cart}">

					Enter Units <input type="text" name="units" /> <br> <br>
					<button type="submit" class="btn btn-default"
						style="height: 45px; background-color: #fb641b; width: 190px">
						<span class="glyphicon glyphicon-flash" style="color: white;">&nbsp</span><strong
							style="color: white">ADD TO CART</strong>
					</button>

					&nbsp &nbsp &nbsp &nbsp
					<button class="btn btn-default"
						style="height: 45px; width: 190px; background-color: #ff9f00">
						<span class="glyphicon glyphicon-shopping-cart"
							style="color: white">&nbsp</span><strong style="color: white">
							BUY NOW</strong>
					</button>
				</form>
			</div>
			<!-- End of panel-body -->
		</div>
		<!-- End of panel -->
	</div>
	<!-- End of container -->
</body>
</html>