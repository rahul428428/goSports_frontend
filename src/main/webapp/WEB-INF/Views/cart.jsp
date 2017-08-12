
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>

</head>
<body style="background-color: #f3f3f3">
	<jsp:include page="navbar.jsp" />
	<div class="container-fluid">
		<c:forEach items="${cart.cartItems}" var="cartItem">
			<c:set var="totalitems" value="${cartItem.quantity + totalitems}">
			</c:set>
		</c:forEach>

		<c:if test="${totalitems!=null}">

			<div class="row">
				<div class="col-sm-9">
					<div class="panel"
						style="width: 85%; margin-left: 130px; border-radius: 0px 0 0 0px;">
						<div class="panel panel-heading">
							<h2>
								<b>Shopping Cart</b>
							</h2>
						</div>

						<div class="panel-body">
							<table class="table table-hover " style="margin-top: -20px">

								<thead>

									<tr>
										<th>Item Details</th>
										<th></th>
										<th>Quantity</th>
										<th>Price</th>
										<th>Remove</th>
									</tr>

								</thead>
								<tbody>
									<c:forEach items="${cart.cartItems}" var="cartItem">


										<tr>
											<td><img
												src="resources/images/${cartItem.product.id}.png"
												style="width: 140px; height: 130px"></td>
											<td>
												<h3>${cartItem.product.productname}</h3>
											</td>
											<td>
												<h3 style="margin-top: 16px">${cartItem.quantity}</h3>
											</td>
											<td><h4 style="padding-top: 10px">
													<i class="fa fa-inr" style="font-size: 15px;"></i> <b
														style="font-size: 15px"> ${cartItem.totalPrice} </b>
												</h4></td>
											<td><c:url
													value="cart_removecartitem${cartItem.cartItemId}"
													var="removeitem"></c:url> <a class="btn btn-danger"
												style="background-color: red; margin-top: 16px"
												href="${removeitem}">Remove</a></td>
										</tr>

										<c:set var="grandTotal"
											value="${cartItem.totalPrice + grandTotal}">
										</c:set>

									</c:forEach>
								</tbody>
							</table>



						</div>
						<!-- End panel-body -->
						<div class="panel-footer"
							style="background-color: white; height: 80px">

							<c:url value="getallproducts" var="productlist"></c:url>
							<a href="${productlist}" class="btn btn-default"
								style="height: 50px; background-color: #f3f3f3; font-size: 18px;">
								<div style="margin-top: 8px">
									<span class="glyphicon glyphicon-chevron-left"></span> <span
										style="font-weight: 600; font-size: 10px color: black;">CONTINUE
										SHOPPING </span>
								</div>

							</a>
							<c:url value="cartshippingaddressform${cart.id}"
								var="checkoutrurl"></c:url>
							<a href="cartshippingaddressform${cart.id}"
								class="btn btn-default"
								style="height: 50px; width: 30%; margin-left: 380px; background-color: #fb641b; font-size: 18px;">
								<div style="margin-top: 8px">
									</span> <span style="font-weight: 600; font-size: 15px; color: white;">PLACE
										ORDER </span>
								</div>
							</a>

						</div>
					</div>
					<!-- End  panel -->
				</div>
				<!-- End  col-sm-12 -->

				<div class="col-sm-3">
					<div class="panel"
						style="margin-left: -50px; width: 90%; border-radius: 0px 0 0 0px">
						<div class="panel-heading">
							<h5 style="color: grey">PRICE DETAILS</h5>
						</div>
						<!-- End panel-heading -->
						<div class="panel-body"></div>


						<hr style="margin-top: -20px;">
						<h4 style="font-size: 16px; margin-left: 14px">
							Total Items <span style="margin-left: 190px">${totalitems}</span>
						</h4>
						<span style="font-size: 16px; margin-left: 14px"> Delivery
							Charges </span>

						<c:if test="${grandTotal>=1500}">
							<span style="margin-left: 122px; font-size: 14px; color: #388e3c">
								FREE</span>
						</c:if>

						<c:if test="${grandTotal<1500}">
							<span style="margin-left: 122px; font-size: 14px; color: #388e3c">
								<i class="fa fa-inr" style="font-size: 15px;"></i> 100
							</span>
						</c:if>

						<h4 style="font-size: 16px; margin-left: 14px">
							Price(${totalitems} item) <span style="margin-left: 140px">${grandTotal}</span>
						</h4>

						<hr
							style="border-top: 1px dashed #8c8b8b; color: grey; width: 90%">

						<span style="font-size: 16px; margin-left: 14px"> <strong>Amount
								Payable</strong> <span style="margin-left: 92px"><i
								class="fa fa-inr" style="font-size: 15px;"></i> <strong>

									<c:if test="${grandTotal>=1500}">
								${grandTotal}
								</c:if> <c:if test="${grandTotal<1500}">
								  ${grandTotal+100}
								</c:if>

							</strong> </span>
						</span>
					</div>
					<!-- End panel -->
					<a href="cart_clearcart${cart.id}" class="btn btn-danger"
						style="width: 90%; margin-left: -48px">CLEAR CART</a>

				</div>
				<!-- End col-sm-3 -->
			</div>
		</c:if>

		<c:if test="${totalitems==null}">

			<div class="container">
				<div class="panel" style="border-radius: 0px 0 0 0px">
					<div class="panel panel-heading">
						<h2>
							<b>Shopping Cart</b>
						</h2>
					</div>
					<!-- End panel- heading -->
					<div class="panel-body">
						<img alt="empty cart" src="resources/emptycartimage.png"
							style="width: 350px; height: 250px; margin-left: 365px"> <br>
						<span
							style="font-weight: 600; margin-left: 395px; font-size: 20px">
							Your Shopping Cart is empty </span> <br> <br> <a
							href="getallproducts" class="btn btn-default"
							style="height: 50px; width: 30%; margin-left: 375px; background-color: #fb641b; font-size: 18px;">
							<div style="margin-top: 8px">
								</span> <span style="font-weight: 600; font-size: 15px; color: white;">CONTINUE
									SHOPPING</span>
							</div>
						</a>

					</div>
					<!-- End  panel-body -->

				</div>
				<!-- End panel -->
			</div>
			<!-- End container -->
		</c:if>


	</div>
	<!-- End container-fluid -->
</body>
</html>