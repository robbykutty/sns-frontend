<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<title>Add Product</title>
</head>
<body>

	<!-- add product form -->
	<div class="container">
		<sp-form:form modelAttribute="item" 
		 method="post"
		 action="${pageContext.request.contextPath}/product/add" 
		 cssClass="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
		<h2>Add Product</h2>
		<div class="form-group">
			<label>Product Name</label>
			<sp-form:input path="itemName" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Product Description</label>
			<sp-form:textarea path="itemDescription" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Product Price</label>
			<sp-form:input path="itemPrice" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Product Quantity</label>
			<sp-form:input path="itemsOnStock" cssClass="form-control"/>
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