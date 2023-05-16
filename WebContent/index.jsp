<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

</head>
<body>

	<div class="container">
		<br>
		
		<h3 align="center">USER REGISTRATION</h3>
		<hr>
		<%
			if (request.getAttribute("errmsg") != null) {
		%>
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			<strong><%=request.getAttribute("errmsg") %></strong>Try Again.
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
			}
			else{
				
			}
		%>
		<div>
			<a href="viewAll.jsp" type="button" class="btn btn-outline-primary add-new">
				<i class="fa fa-plus"></i> View All 
			</a>
		</div>
		<hr>
		<br>
		<form action="register" method="post">
			<!-- 2 column grid layout with text inputs for the first and last names -->
			<div class="row mb-4">
				<div class="col">
					<div class="form-outline">
						<input type="text" name="firstName" id="form3Example1" class="form-control" /> <label
							class="form-label" for="form3Example1">First name</label>
					</div>
				</div>

				<div class="col">
					<div class="form-outline">
						<input type="text" name="lastName" id="form3Example2" class="form-control" /> <label
							class="form-label" for="form3Example2">Last name</label>
					</div>
				</div>

				<div class="col">
					<!-- Email input -->
					<div class="form-outline">
						<input type="email" name="email" id="form3Example3" class="form-control" /> <label
							class="form-label" for="form3Example3">Email address</label>
					</div>
				</div>

				<div class="col">
					<!-- Email input -->
					<div class="form-outline">
						<input type="password" name="password" id="form3Example3" class="form-control" />
						<label class="form-label" for="form3Example3">Password</label>
					</div>
				</div>


			</div>

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary btn-sm container"
				align="center">Sign Up</button>
		</form>

		<br>

		<h6 align="center">
			Already an User? <a href="#">Sign In</a>
		</h6>
		<br>
		<hr>

	</div>

</body>
</html>