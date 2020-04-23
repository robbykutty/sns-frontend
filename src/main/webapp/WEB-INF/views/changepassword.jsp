<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-tags" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Change Password</title>
</head>
<body>

	<div class="container">
		<form class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass" 
			  action="<sp-tags:url value='/user/changepassword'/>" 
			  method="post">
			<div class="form-group">
			<label>Password</label>
				<input type="password" name="password" class="form-control"/>
			</div>
			<div>
			<label>Confirm Password</label>
				<input type="password" name="cpassword" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Change" class="btn btn-primary btn-block"/>
			</div>
		</form>
	</div>
	
</body>
</html>
<jsp:include page="footer.jsp"/>