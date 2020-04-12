<jsp:include page="header.jsp"/>
<html>
<head>
<title>Admin Panel</title>
</head>
<body>


<div class="container">
	<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4">
		<div class="">
			<a href="${pageContext.request.contextPath}/brand/display">Brands</a>
		</div>
		
		<div class="">
			<a href="${pageContext.request.contextPath}/category/display">Category</a>
		</div>
		
		<div class="">
			<a href="${pageContext.request.contextPath}/subcategory/display">Sub Category</a>
		</div>
	</div>
</div>


</body>
</html>
<jsp:include page="footer.jsp"/>