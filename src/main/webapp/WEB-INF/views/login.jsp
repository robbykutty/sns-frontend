<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-tags" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Login</title>
</head>
<body>

	<div class="container">
		<form class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass" action="<sp-tags:url value='/loginaction'/>" method="post">
			<h3>Login</h3>
			<div class="form-group">
				<label>Email</label>
				<input type="email" name="username" placeholder="joe.smith@email.com" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Password</label>
				<input type="password" name="password" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Login" class="btn btn-primary btn-block"/>
			</div>
			<div class="form-group">
			<a href="${pageContext.request.contextPath}/user/forgot">Forgot Password</a>
			</div>
		</form>
	</div>
	
</body>
</html>
<jsp:include page="footer.jsp"/>