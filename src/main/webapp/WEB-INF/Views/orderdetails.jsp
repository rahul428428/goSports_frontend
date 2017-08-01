<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Details</title>
<%@ include file="navbar.jsp"%>
</head>
<body>

	<jsp:useBean id="now" class="java.util.Date" />

	<div class="container-wrapper">
		<div class="container">
			<div class="page-header">
				<h1><b> Order Confirmation  </b></h1>

				 
			</div>

			<div class="container" >
				<c:url value="cartconfirm${cartid}" var="url"></c:url>
				<form:form action="${url}" modelAttribute="order">
					<div class="row">

						<div
							class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

							<div class="txt-center">
								<h1>Receipt</h1>
							</div>
							ORDER ID: S18006500${order.orderId }

							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<address>
										<strong>Shipping Address</strong><br />
										${order.cart.customer.shippingAddress.streetname} <br />
										${order.cart.customer.shippingAddress.city},
										${order.cart.customer.shippingAddress.state} <br />
										${order.cart.customer.shippingAddress.country},
										${order.cart.customer.shippingAddress.zipcode}
									</address>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6 text-right">
									<p>
										Shipping Date:
										<fmt:formatDate type="date" value="${now}" />
									</p>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<address>
										<strong>Billing Address</strong><br />
										${order.cart.customer.billingAddress.streetname} <br />
										${order.cart.customer.billingAddress.city},
										${order.cart.customer.billingAddress.state} <br />
										${order.cart.customer.billingAddress.country},
										${order.cart.customer.billingAddress.zipcode}
									</address>
								</div>
							</div>

							<div class="row">
								<table class="table table-hover" style="width:160%">
									<thead>
										<tr>
											<td>Product</td>
											<td>Qty</td>
											<td class="text-center">Price</td>
											<td class="text-center">Total</td>
										</tr>
									</thead>
									<tbody>
										<c:set var="grandTotal" value="0.0"></c:set>
										<c:forEach var="cartItem" items="${order.cart.cartItems}">
											<tr>
												<td class="col-md-9"><em>${cartItem.product.productname}</em></td>
												<td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
												<td class="col-md-1" style="text-align: center">${cartItem.product.price}</td>
												<td class="col-md-1" style="text-align: center">${cartItem.totalPrice}</td>
												<c:set var="grandTotal"
													value="${grandTotal + cartItem.totalPrice }"></c:set>
											</tr>
										</c:forEach>

										<tr>
											<td></td>
											<td></td>
											<td >
												<h4>
													<strong>Grand Total:</strong>
												</h4>
											</td>
											<td class="text text-danger">
												<h4>
													<strong><i class="fa fa-inr"
														style="font-size: 15px;"></i> ${grandTotal}</strong>
												</h4>
											</td>
										</tr>

									</tbody>
								</table>
								<input type="submit" value="submit" class="btn  btn-success">
							</div>



						</div>

					</div>

				</form:form>
			</div>
		</div>

	</div>
</body>
</html>