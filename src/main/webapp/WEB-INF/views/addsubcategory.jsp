<jsp:include page="header.jsp"/>
<%@taglib prefix="sp-form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Add Sub-Category</title>
</head>
<body>

	<!-- add category form -->
	<div class="container">
		<sp-form:form modelAttribute="subcategory" 
		 action="${pageContext.request.contextPath}/subcategory/add" 
		 method="post"
		 cssClass="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
			<h2>Add Sub Category</h2>
			<div class="form-group">
				<label>Sub Category Name</label>
				<sp-form:input path="subCategoryName" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<label>Sub Category Description</label>
				<sp-form:textarea path="subCategoryDescription" cssClass="form-control"/>
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