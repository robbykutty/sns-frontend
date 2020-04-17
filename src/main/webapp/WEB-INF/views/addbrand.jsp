<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Add Brand</title>
</head>
<body>
	<!-- add brand form -->
	<div class="container">
		<sp-form:form modelAttribute="brand" 
		 method="post" 
		 action="${pageContext.request.contextPath}/brand/add" 
		 cssClass="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
			<h2>Add Brand</h2>
			<div class="form-group">
				<label>Brand Name</label>
				<sp-form:input path="brandName" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<label>Brand Tag Line</label>
				<sp-form:input path="brandTagline" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<label>Brand Description</label>
				<sp-form:textarea path="brandDescription" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
				<input type="submit" value="Add" class="btn btn-primary btn-block"/>
			</div>
		</sp-form:form>
	</div>

</body>
</html>
<jsp:include page="footer.jsp"/>