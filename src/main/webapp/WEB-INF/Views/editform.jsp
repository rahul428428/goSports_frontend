<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<title>Edit Product</title>

 <%@ include file="navbar.jsp" %>
</head>
<body>

 
<div class="container" style="width:30%; margin-top:100px">
    
       
      
        
         <c:url value="/editproduct" var="url1"/>
         <form:form action="${url1}" method="post"  modelAttribute="productObj" enctype="multipart/form-data">
         
             <form:hidden path="id"/>
                              
             <label>Product Name :</label> 
             <br>
             <form:input path="productname" style="width:94%"  class="form-control" /><br>
             <form:errors path="productname" cssStyle="color:red" ></form:errors>
             <br>
             <label> Price :</label>
             <br> 
             <form:input path="price" style="width:94%" class="form-control" /><br>
             <form:errors path="price" cssStyle="color:red"></form:errors>
             <br>
                               
             <label>Quantity :</label>
             <br>
             <form:input path="quantity" style="width:94%" class="form-control" /><br>
             <form:errors path="quantity" cssStyle="color:red"></form:errors> 
               <br>
            <label>Description :</label>  
            <br>
             <form:input path="description" style="width:94%" class="form-control" /><br>
             <form:errors path="description" cssStyle="color:red" ></form:errors>    
            <br>
            <div class="form-group">
             Upload an image
             <input type="file"  name="image">
            </div>
            <input type="submit" class="btn btn-success"  value="Edit Product"/> 
            
            <br> <br>
            <c:forEach items="${categories}" var="c">
            <form:radiobutton path="category.id" value="${c.id}"/>
            ${c.categoryname}   
            </c:forEach>
        
         </form:form> <!-- End Form -->
      
</div> <!-- End of Container -->

</body>
</html>