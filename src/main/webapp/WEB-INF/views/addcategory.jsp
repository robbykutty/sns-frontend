<jsp:include page="header.jsp"/>
<%@taglib prefix="sp-form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<title>Add Category</title>
</head>
<body>

	<!-- add category form -->
	<div class="container">
		<sp-form:form modelAttribute="category" 
			 action="${pageContext.request.contextPath}/category/add" 
			 method="post"
			 cssClass="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
			<h2>Add Category</h2>
			<div class="form-group">
				<label>Category Name</label>
				<sp-form:input path="categoryName" cssClass="form-control"/>
			</div>
			<div class="form-group">
				<label>Category Description</label>
				<sp-form:textarea path="categoryDescription" cssClass="form-control"/>
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