<!DOCTYPE html>
<%@page import="Model.User"%>
<%@page import="Model.UserDao"%>
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

		<h3 align="center">UPDATE DETAILS</h3>
		<hr>
		<%
			if (request.getAttribute("errmsg") != null) {
		%>
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong><%=request.getAttribute("errmsg")%></strong>Try Again.
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
			} else {

			}
		%>
		<div>
			<a href="viewAll.jsp" type="button"
				class="btn btn-outline-primary add-new"> <i class="fa fa-plus"></i>
				View All
			</a>
		</div>
		<hr>
		<br>
		<%
			int id = Integer.parseInt(request.getParameter("id"));

			UserDao dao = new UserDao();
			User user = dao.findByid(id);
		%>
		<form action="update" method="post">
			<!-- 2 column grid layout with text inputs for the first and last names -->
			<div class="row mb-4">


				<input type="hidden" name="id" value="<%=user.getId()%>" />

				<div class="col">
					<div class="form-outline">
						<input type="text" name="firstName"
							value="<%=user.getFirstName()%>" id="form3Example1"
							class="form-control" /> <label class="form-label"
							for="form3Example1">First name</label>
					</div>
				</div>

				<div class="col">
					<div class="form-outline">
						<input type="text" name="lastName" value="<%=user.getLastName()%>"
							id="form3Example2" class="form-control" /> <label
							class="form-label" for="form3Example2">Last name</label>
					</div>
				</div>

				<div class="col">
					<!-- Email input -->
					<div class="form-outline">
						<input type="email" name="email" value="<%=user.getEmail()%>"
							id="form3Example3" class="form-control" /> <label
							class="form-label" for="form3Example3">Email address</label>
					</div>
				</div>

				<div class="col">
					<!-- Email input -->
					<div class="form-outline">
						<input type="text" name="password" value="<%=user.getPassword()%>"
							id="form3Example3" class="form-control" /> <label
							class="form-label" for="form3Example3">Password</label>
					</div>
				</div>


			</div>

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary  btn-sm container"
				align="center">Update Details</button>
		</form>

		<hr>

	</div>

</body>
</html>