<jsp:include page="header.jsp"/>
<html>
<head>
<title>Registration</title>
</head>
<body>

	<div class="container">
		<form class="col-lg-6 col-md-6 col-sm-12 col-xs-12 customclass">
			<h3>Registration</h3>
			<div class="form-group">
				<label>First Name</label>
				<input type="text" placeholder="Joe" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Last Name</label>
				<input type="text" placeholder="Smith" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Email</label>
				<input type="email" placeholder="joe.smith@email.com" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Password</label>
				<input type="password" class="form-control"/>
			</div>
			<div class="form-group">
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
				<input type="submit" value="Register" class="btn btn-primary btn-block"/>
			</div>
		</form>
	</div>
	

</body>
</html>
<jsp:include page="footer.jsp"/>