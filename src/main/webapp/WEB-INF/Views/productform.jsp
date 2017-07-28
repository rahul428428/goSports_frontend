<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<title>Product Form</title>
<%@ include file="navbar.jsp" %>
<html>
<head>
<meta charset="utf-8">
  
</head>
<body>
 
<!-- Spring form tab -->

<div class="container" style="width:30%; margin-top:100px">
   <!-- http://localhost:8080/ecommerce/saveproduct -->
  <form:form action="saveproduct" method="post"  modelAttribute="product" enctype="multipart/form-data">
    <form:hidden path="id"/>
    <h4>Enter Product Name </h4>
    <form:input class="form-control" path="productname"/> 
    <form:errors path="productname" cssStyle="color:red"></form:errors>
    <br>
    <h4>Enter Price</h4>
    <form:input class="form-control" path="price"/>
    <form:errors path="price" cssStyle="color:red" ></form:errors> 
     <br>
    <h4>Enter Quantity</h4>
    <form:input class="form-control" path="quantity"/> 
    <form:errors path="quantity" cssStyle="color:red"></form:errors>
    <br>
    <h4>Enter Description</h4>
    <form:textarea class="form-control" path="description"/> 
    <form:errors path="description" cssStyle="color:red" ></form:errors>
    <br>
     
     <div class="form-group">
      Upload an image
      <input type="file" name="image"/>
     </div>
        
    <input type="submit" class="btn btn-success" value="ADD PRODUCT"/>
    <br>
     <br>
    <div class="form-group"> 
    <c:forEach items="${categories}" var="c">
      <form:radiobutton path="category.id" value="${c.id}"/>
       ${c.categoryname}   
    </c:forEach>
    </div>
    </form:form>   
</div>

</body>
</html>
 