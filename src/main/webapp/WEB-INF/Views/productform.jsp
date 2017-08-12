<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Product Form</title>
<%@ include file="navbar.jsp"%>
<html>
<head>
<meta charset="utf-8">

<script type="text/javascript">
 function Confirmation(){
	 var prdtname = document.getElementById('pname').value;
	 var rate = document.getElementById('price').value;
	 
	 var qty  = document.getElementById('quantity').value;
	 var description = document.getElementById('desc').value;
	 
 if(prdtname!="" && rate!="" && qty!="" && description!="")
	 {
	  alert("Product  has been added successfully");
	  return true;
	 }
	
 return true;
	 
 }
</script>
 

</head>
<body>

	<!-- Spring form tab -->

	<div class="container" style="width: 40%; margin-top: 100px">
		<!-- http://localhost:8080/ecommerce/saveproduct -->

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3>
					<b>Product Form</b>
				</h3>
			</div>
			<div class="panel-body">
				<form:form action="saveproduct" method="post"
					modelAttribute="product" enctype="multipart/form-data">
					<form:hidden path="id" />
					<h4>Enter Product Name</h4>
					<form:input id="pname" class="form-control" path="productname" style="width:94%" />
					<form:errors path="productname" cssStyle="color:red"></form:errors>
					<br>
					<h4>Enter Price</h4>
					<form:input type="number" id="price" class="form-control" path="price" style="width:94%" />
					<form:errors path="price" cssStyle="color:red"></form:errors>
					<br>
					<h4>Enter Quantity</h4>
					<form:input type="number" id="quantity" class="form-control" path="quantity" style="width:94%" />
					<form:errors path="quantity" cssStyle="color:red"></form:errors>
					<br>
					<h4>Enter Description</h4>
					<form:textarea id="desc" class="form-control" path="description"  style="width:94%"/>
					<form:errors path="description" cssStyle="color:red"></form:errors>
					<br>

					<div class="form-group">
						Upload an image <input  type="file" name="image" />
					</div>



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

					<input type="submit"   onclick="return Confirmation()" class="btn btn-success" value="ADD PRODUCT" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
