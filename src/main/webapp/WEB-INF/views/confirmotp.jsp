<jsp:include page="header.jsp"/>
<%@ taglib prefix="sp-tags" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Confirm OTP</title>
</head>
<body>

	<div class="container">
		<form class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass" 
			  action="<sp-tags:url value='/user/checkotp'/>">
			<div class="form-group">
				<label>Enter OTP</label>
				<input type="text" name="userotp" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="hidden" name="otp" value="${otp}" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="submit" value="Confirm OTP" class="btn btn-primary btn-block"/>
			</div>
		</form>
	</div>
	
</body>
</html>
<jsp:include page="footer.jsp"/>