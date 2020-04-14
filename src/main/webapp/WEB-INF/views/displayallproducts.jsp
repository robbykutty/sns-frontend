<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="jstl-core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<title>Search Results</title>
<link rel="stylesheet" href='<sp-tags:url value="/css/gridtest.css"/>'/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>

<div class="container">
    <h3 class="h3">Search Results..</h3>
    <div class="row">
   		<jstl-core:forEach items="${itemlist}" var="item">
	        <div class="col-md-3 col-sm-6">
	            <div class="product-grid">
	                <div class="product-image">
	                    <a href="${pageContext.request.contextPath}/product/display/${item.itemid}">
	                        <img class="pic-1" src="http://bestjquery.com/tutorial/product-grid/demo9/images/img-3.jpg">
	                    </a>
	                </div>
	                <div class="product-content">
	                    <h3 class="title"><a href="#">${item.itemName}</a></h3>
	                    <div class="price">${item.itemPrice}
	                        <span>${item.itemPrice}</span>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</jstl-core:forEach>
    </div>
</div>

</body>
</html>
<jsp:include page="footer.jsp"/>