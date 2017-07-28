<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ include file="navbar.jsp" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
   
<title>Insert title here</title>
</head>
<body>

  <div class="container">
    <div clas="row">
      <div class="col-md-3 col-sm-6">
         <c:forEach items="${products}" var="p">
        <c:url value="/resources/images/${p.id}.png" var="imageUrl"></c:url>
        
        <c:url value="/viewproduct/${p.id}" var="viewUrl" ></c:url>
        
        <c:url value="/deleteproduct/${p.id}" var="deleteUrl"></c:url>
        
        <c:url value="/geteditform/${p.id}" var="editUrl"></c:url>
        
         
          <img src="${imageUrl}" style="width:50px; height:50px">
         <a href="${viewUrl}">${p.productname}</a></td> 
          
         ${p.category.categoryname}</td>
          
         ${p.price}</td><td>${p.quantity}</td>
          
           <a href="${viewUrl}"><span class="glyphicon glyphicon-info-sign"></span> </a> 
            
           <a href="${deleteUrl}"><span class="glyphicon glyphicon-trash" ></span>  </a>  
          
           <a href="${editUrl}"><span class="glyphicon glyphicon-pencil" ></span></a>  
           
        
        </c:forEach>
      </div>
    
  </div>
  

</body>
</html>