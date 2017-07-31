<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




	<div class="form-group">
		<b> Security Question</b>
		<form:select path="securityQuestion.id" class="form-control">
			<c:forEach items="${questions}" var="q">
				<form:option value="${q.id}">
								       ${q.question} ?
                                     </form:option>

			</c:forEach>
		</form:select>
	</div>

	<form:label path="answer">Security Answer</form:label>

	<form:input path="answer" class="form-control" />
	<form:errors path="answer" cssStyle="color:red"></form:errors>
	
	
	
	
	<div class="panel panel-default">
						<div class="panel-body">

							<h4 class="panel-title pull-left" style="font-size: 20px;">
								<b style="color: blue"> ${customer.securityquestion} </b>
							</h4>
						</div>
					</div>
	 


</body>
</html>