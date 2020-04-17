<jsp:include page="header.jsp"/>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Registration</title>
</head>
<body>

	<div class="container">
		<sp:form  modelAttribute="user"
		 action="${pageContext.request.contextPath}/user/register"
		 method="post"
		 cssClass="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
			<h3>Registration</h3>
			<div class="form-group">
				<label>First Name</label>
				<sp:input path="firstName" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<label>Last Name</label>
				<sp:input path="lastName" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<label>Email</label>
				<sp:input path="email" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<label>Password</label>
				<sp:password path="password" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
				<input type="submit" value="Register" class="btn btn-primary btn-block"/>
			</div>
		</sp:form>
	</div>
	

</body>
</html>
<jsp:include page="footer.jsp"/>