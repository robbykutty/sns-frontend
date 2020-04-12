<jsp:include page="header.jsp"/>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Add Category</title>
</head>
<body>

	<!-- add category form -->
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
			<sp:form modelAttribute="category" action="${pageContext.request.contextPath}/category/add" method="post">
				<h2>Add Category</h2>
				<div class="form-group">
					<label>Category Name</label>
					<div class="form-control">
						<sp:input path="categoryName"/>
					</div>
				</div>
				<div class="form-group">
					<label>Category Description</label>
					<div class="form-control">
						<sp:input path="categoryDescription"/>
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