<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Product Details</title>
<%@ include file="navbar.jsp"%>

<script type="text/javascript">
	function Validate() {

		var quantity = document.getElementById('qty').value;
	
		 

		if (quantity == "") {
			alert("Please Enter units");
			return false;
		}
		if (quantity == 0) {
			alert("Enter Atleast one unit");
			return false;
		}
		

		if(quantity >${product.quantity}) {
            alert("Entered units not available or Item is Out Of Stock"); 
            return false;
			
		}
		
		return true;

	}
</script>


</head>
<body>


	<div class="container" style="width: 75%; margin-top: 80px">
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
				<c:if test="${product.quantity==0 }">
					<span style="color: red; font-size: 28px; margin-left: 50px">Out
						Of Stock </span>
				</c:if>
				<c:url value="cartaddtocart${product.id}" var="cart"></c:url>
				<form action="${cart}">

					<security:authorize access="hasRole('ROLE_USER')">

						<b style="margin-left: 638px"> Enter Units</b>
						<input min="1" max="${product.quantity}" type="number" value=1 id="qty" type="text" name="units"
							class="form-control" style="width: 10%; margin-left: 638px" />
					
					<br> <br> <br>
					<button type="submit" class="btn btn-default"
						onclick="return Validate()"
						style="height: 45px; background-color: #fb641b; width: 190px; margin-top: -50px; margin-left: 635px">
						<span class="glyphicon glyphicon-shopping-cart"
							style="color: white;">&nbsp</span><strong style="color: white">ADD
							TO CART</strong>
					</button>
					</security:authorize>
					<br> <br> <span
						style="color: green; margin-left: 640px; font-size: 18px">Free
						Delivery on orders greater than <i class="fa fa-inr"
						style="font-size: 15px;"></i> 1500.
					</span> &nbsp &nbsp &nbsp &nbsp
					<!-- <button class="btn btn-default"
						style="height: 45px; width: 190px; background-color: #ff9f00; margin-top: -56px; margin-left: 850px;">
						<span class="glyphicon glyphicon-flash" style="color: white">&nbsp</span><strong
							style="color: white"> BUY NOW</strong>
					</button> -->
				</form>
			</div>
			<!--End of panel-body-->
		</div>
		<!-- End of panel -->
	</div>
	<!-- End of container -->
</body>
</html>