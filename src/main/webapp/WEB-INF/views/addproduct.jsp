<jsp:include page="header.jsp"/>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Add Product</title>
</head>
<body>

	<!-- add product form -->
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
		<sp:form modelAttribute="product" action="${pageContext.request.contextPath}/product/add" method="post">
			<h2>Add Product</h2>
			<div class="form-group">
				<label>Product Name</label>
				<sp:input path="itemName"/>
			</div>
			<div class="form-group">
				<label>Product Description</label>
				<sp:input path="itemDescription"/>
			</div>
			<div class="form-group">
				<label>Product Price</label>
				<sp:input path="itemPrice"/>
			</div>
			<div class="form-group">
				<label>Product Quantity</label>
				<sp:input path="itemsOnStock"/>
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