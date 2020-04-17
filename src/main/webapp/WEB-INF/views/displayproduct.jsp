<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="jstl-core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<title>ShopNScroll</title>
<link rel="stylesheet" href='<sp-tags:url value="/css/productpgtest.css"/>'/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

<h2 class="testclass">${item.itemName}</h2>

<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="http://placekitten.com/400/252" /></div>
						</div>
					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${item.itemName}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description">${item.itemDescription}</p>
						<h4 class="price">current price: <span>${item.itemPrice}</span></h4>
						<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<h5 class="sizes">sizes:
							<span class="size" data-toggle="tooltip" title="small">s</span>
							<span class="size" data-toggle="tooltip" title="medium">m</span>
							<span class="size" data-toggle="tooltip" title="large">l</span>
							<span class="size" data-toggle="tooltip" title="xtra large">xl</span>
						</h5>
						<h5 class="colors">colors:
							<span class="color orange not-available" data-toggle="tooltip" title="Not In store"></span>
							<span class="color green"></span>
							<span class="color blue"></span>
						</h5>
						<div class="action">
							<jstl-core:if test="${item.itemPrice>0}">
								<a href="${pageContext.request.contextPath}/order/addtocart/${item.itemid}"><button class="add-to-cart btn btn-warning" type="button">Add to Cart</button></a>
								<a href="${pageContext.request.contextPath}/order/buynow/${item.itemid}"><button class="add-to-cart btn btn-primary" type="button">Buy Now</button></a>
							</jstl-core:if>
							<a href="${pageContext.request.contextPath}/product/edit/${item.itemid}"><button class="add-to-cart btn btn-warning" type="button">Edit</button></a>
							<a href="${pageContext.request.contextPath}/product/delete/${item.itemid}"><button class="add-to-cart btn btn-danger" type="button">Delete</button></a>
						</div>
					</div>
				</div>
			</div>s
		</div>
	</div>

</body>
</html>
<jsp:include page="footer.jsp"/>