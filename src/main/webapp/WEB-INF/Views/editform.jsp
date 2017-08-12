<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Product</title>

<%@ include file="navbar.jsp"%>
</head>
<body>


	<div class="container" style="width: 40%; margin-top: 100px">


		<div class="panel panel-primary">
			<div class="panel panel-heading">
				<h3>
					<b>Edit Product Form</b>
				</h3>
			</div>

			<div class="panel-body">
				<c:url value="/editproduct" var="url1" />
				<form:form action="${url1}" method="post"
					modelAttribute="productObj" enctype="multipart/form-data">

					<form:hidden path="id" />

					<label>Product Name :</label>
					<br>
					<form:input path="productname" style="width:94%"
						class="form-control" />
					<br>
					<form:errors path="productname" cssStyle="color:red"></form:errors>
					<br>
					<label> Price :</label>
					<br>
					<form:input type="number" path="price" style="width:94%" class="form-control" />
					<br>
					<form:errors path="price" cssStyle="color:red"></form:errors>
					<br>

					<label>Quantity :</label>
					<br>
					<form:input type="number"  path="quantity" style="width:94%" class="form-control" />
					<br>
					<form:errors path="quantity" cssStyle="color:red"></form:errors>
					<br>
					<label>Description :</label>
					<br>
					<form:input path="description" style="width:94%"
						class="form-control" />
					<br>
					<form:errors path="description" cssStyle="color:red"></form:errors>
					<br>
					<div class="form-group">
						Upload an image <input type="file" name="image">

						<div class="form-group">
							<b> Select Category</b>
							<form:select path="category.id" class="form-control" style="width:94%">
								<c:forEach items="${categories}" var="c">
									<form:option value="${c.id}">
								${c.categoryname}  
                                 </form:option>

								</c:forEach>
							</form:select>
						</div>

						<input type="submit" class="btn btn-success" value="EDIT PRODUCT" />
				</form:form>
				<!-- End Form -->
			</div>
		</div>
	</div>
	<!-- End of Container -->

</body>
</html>