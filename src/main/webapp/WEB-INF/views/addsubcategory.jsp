<jsp:include page="header.jsp"/>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Add Sub-Category</title>
</head>
<body>

	<!-- add category form -->
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
		<sp:form modelAttribute="subcategory" action="${pageContext.request.contextPath}/subcategory/add" method="post">
		<div class="form-group">
			<h2>Add Sub Category</h2>
			<div class="form-group">
				<label>Sub Category Name</label>
				<sp:input path="subCategoryName"/>
			</div>
			<div class="form-group">
				<label>Sub Category Description</label>
				<sp:input path="subCategoryDescription"/>
			</div>
			<div class="form-group">
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
				<input type="submit" value="Add" class="btn btn-primary btn-block"/>
			</div>
		</div>
		</sp:form>
		</div>
	</div>

</body>
</html>
<jsp:include page="footer.jsp"/>