<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    	 pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="sp-tags" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sp-form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="jsp-core" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="sp-sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href='<sp-tags:url value="/css/vulcan-visual.css"/>'>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark vv-header">
		 	<a class="navbar-brand" href="${pageContext.request.contextPath}/home">ShopNScroll</a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		
			<sp-sec:authorize access="!isAuthenticated()">
				<li class="nav-item">
				  <a class="nav-link" href="${pageContext.request.contextPath}/user/login">Login</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="${pageContext.request.contextPath}/user/register">Register</a>
				</li>
			</sp-sec:authorize>
			<sp-sec:authorize access="isAuthenticated()">
				<li class="nav-item">
				  <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
				</li>
			</sp-sec:authorize>
			
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Options
			  </a>
			  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<sp-sec:authorize access="hasAuthority('SELLER') and isAuthenticated()">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/brand/add">Add Brand</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/category/add">Add Category</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/subcategory/add">Add Sub Category</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/product/add">Add Product</a>
				</sp-sec:authorize>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/brand/display">Display Brands</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/category/display">Display Categories</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/subcategory/display">Display Sub Categories</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/product/displayall">Display Products</a>
			  </div>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	 </div>
	 </nav>
	 
</body>
</html>