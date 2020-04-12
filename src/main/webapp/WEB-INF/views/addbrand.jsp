<jsp:include page="header.jsp"/>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Add Brand</title>
</head>
<body>
	<!-- add brand form -->
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
		<sp:form modelAttribute="brand" action="${pageContext.request.contextPath}/brand/add" method="post">
			<h2>Add Brand</h2>
			<div class="form-group">
				<label>Brand Name</label>
				<div class="form-control">
					<sp:input path="brandName"/>
				</div>
			</div>
			<div class="form-group">
				<label>Brand Tag Line</label>
				<div class="form-control">
					<sp:input path="brandTagline"/>
				</div>
			</div>
			<div class="form-group">
				<label>Brand Description</label>
				<div class="form-control">
					<sp:input path="brandDescription"/>
				</div>
			</div>
			<div class="form-group">
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
				<input type="submit" value="Add" class="btn btn-primary btn-block"/>
			</div>
		</sp:form>
		</div>
	</div>

</body>
</html>
<jsp:include page="footer.jsp"/>