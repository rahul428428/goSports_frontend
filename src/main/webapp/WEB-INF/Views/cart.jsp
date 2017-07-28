
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <div class="container-fluid">
  
   <b><h2>List of Products</h2></b><br><br>
   
    <table class="table table-hover table-striped table-bordered" >
    
      <thead>
      
       <tr><th>Image</th><th>Quantity</th><th>Total Price</th><th>Remove</th> </tr>
       
      </thead>
      <tbody>
        <c:forEach items="${cart.cartItems}" var="cartItem">
        
        
         <tr>
          
           <td>${cartItem.product.productname} </td>
           <td>${cartItem.quantity}</td>
           <td>${cartItem.totalPrice} </td>
           <td>  <a href="cart_removecartitem_${cartItem.cartItemId}"></a> </td>
         </tr>
         
         <c:set  var="grandTotal" value="${cartItem.totalPrice + grandTotal}" > </c:set>
         
        </c:forEach>
      </tbody>
    </table>
    
    Total Price : ${grandTotal}
    
  </div> <!-- End container-fluid -->
  

</body>
</html>