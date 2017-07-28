 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Billing Address</title>
</head>
<body>


<div class"container" style="width:25%">
 <div class="panel panel-warning">
   <div class="panel-heading">
    <h4>Billing Address</h4>
   </div> <!-- End  panel-heading -->
   
   <div class="panel-body">
     
     <form:form action="savebillingaddress" method="post"  modelAttribute="customr">
     
       <form:label path="billingAddress.streetname">Streetname</form:label>     
       <form:input path="billingAddress.streetname"/>
       
       <form:label path="billingAddress.apartmentnumber">Apartment Number</form:label>
       <form:input path="billingAddress.apartmentnumber"/>
       
       <form:label path="billingAddress.city">City </form:label>
       <form:input path="billingAddress.city"/>
       
       <form:label path="billingAddress.state">State</form:label>
       <form:input path="billingAddress.state"/>
       
       
       <form:label path="billingAddress.zipcode">Zipcode</form:label>
       <form:input path="billingAddress.zipcode"/>
       
       <br>
       
       <input type="submit" value="Continue" class="btn btn-danger"/ style="width:318px">
     </form:form>
    
   </div> <!-- End panel-body -->
   
 </div> <!-- End panel -->
</div> <!-- End of container -->
</body>
</html>