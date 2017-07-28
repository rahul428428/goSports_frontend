<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<title>Product List</title>
<%@ include file="navbar.jsp" %>
 
<html>
<head>
  
 <script>
	$(document).ready(function() {
		var searchCondition = '${searchCondition}';
		$('.table').DataTable({
			"lengthMenu" : [ [ 5, 6, 7, -1 ], [ 5, 6, 7, "All" ] ],
			"oSearch" : {
				"sSearch" : searchCondition
			}
		})
	});
</script>
 
<script type="text/javascript">
  
function confirmDelete(delUrl) {
	 var x = confirm("Are you sure you want to delete this Item ?");
	if (x) {
	    document.location = delUrl;
	    
	  } 
	}
	
	
 
</script> 


</head>
<body>
 
 
  <div class="container-fluid">
  
   <b><h2>List of Products</h2></b><br><br>
   
    <table class="table table-hover table-striped table-bordered" >
    
      <thead>
      
       <tr><th>Image</th><th>Name</th><th>Category</th><th>Price</th><th>Qty</th> <th>Action</th> </tr>
       
      </thead>
      <tbody>
        <c:forEach items="${products}" var="p">
        <c:url value="/resources/images/${p.id}.png" var="imageUrl"></c:url>
        
        <c:url value="/viewproduct${p.id}" var="viewUrl" ></c:url>
        
        <c:url value=" javascript:confirmDelete('deleteproduct/${p.id}')" var="deleteUrl"></c:url>
        
        <c:url value="/admin_geteditform${p.id}" var="editUrl"></c:url>
        
         <tr>
          <td> <a href="${viewUrl}"> <img src="${imageUrl}" style="width:250px; height:200px"> </a>  </td>
          <td><a href="${viewUrl}"> <h3 style="padding-top:40px">  ${p.productname} </h3></a></td> 
          
          <td><h3 style="padding-top:40px" >  ${p.category.categoryname}</h3></td>
          
          <td> <h3 style="padding-top:40px">  <i class="fa fa-inr" style="font-size:22px;color:red"></i> <span style="color:red" > ${p.price}</span>   </h3> </td>
          
          <td> <h3 style="padding-top:40px"> ${p.quantity}</h3> </td>
          
          <td>
           <a  href="${viewUrl}" class="btn btn-primary" style="margin-top:60px " ><span   class="glyphicon glyphicon-info-sign"></span></a>  
           
           <security:authorize access="hasRole('ROLE_USER')">
           <a href="#"  class="btn btn-default" style="background-color:#ff9f00;margin-top:60px"><span class="glyphicon glyphicon-shopping-cart" style="color:white" ></span></a>
           </security:authorize>
           <security:authorize access="hasRole('ROLE_ADMIN')">
           <a href="${deleteUrl}"  class="btn btn-danger" style="margin-top:60px"><span  class="glyphicon glyphicon-trash" ></span>  </a>  
                    
           <a href="${editUrl}" class="btn btn-success" style="margin-top:60px" ><span  class="glyphicon glyphicon-pencil" ></span></a>   
           </security:authorize>
           </td>
         </tr>
        </c:forEach>
      </tbody>
    </table>
  </div> <!-- End container-fluid -->
  
</body>
</html>