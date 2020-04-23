<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-tags" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Enter Your Email</title>
</head>
<body>

	<div class="container">
		<form class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass" 
			  action="<sp-tags:url value='/user/sendotp'/>" 
			  method="post">
			<div class="form-group">
			<label>Enter Your Email</label>
				<input type="email" name="username" placeholder="joe.smith@email.com" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Send OTP" class="btn btn-primary btn-block"/>
			</div>
		</form>
	</div>
	
</body>
</html>
<jsp:include page="footer.jsp"/>