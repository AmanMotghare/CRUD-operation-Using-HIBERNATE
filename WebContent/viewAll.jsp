<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<title>All Users</title>
</head>
<body>
	<div class="container">
		<br>
		<%
			if (request.getAttribute("msg") != null) {
		%>
		<div class="alert alert-info alert-dismissible fade show" role="alert">
			<strong><%=request.getAttribute("msg")%></strong> Check out All Users
			Below
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
			} else {

			}
		%>

		<div>
			<a href="index.jsp" type="button" class="btn btn-info add-new"> <i
				class="fa fa-plus"></i> Add New
			</a>
		</div>


		<hr>
		<h3 align="center">ALL USERS</h3>
		<hr>
		<table class="table table-striped table-bordered border-secondary">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					UserDao dao = new UserDao();
					List<User> list = dao.allUsers();
					int i = 0;
					for (User user : list) {
						i++;
				%>
				<tr>
					<th scope="row"><%=i%></th>
					<td><%=user.getFirstName()%></td>
					<td><%=user.getLastName()%></td>
					<td>@<%=user.getEmail()%></td>
					<td><%=user.getPassword()%></td>
					<td align="center"><a
						href="updateForm.jsp?id=<%=user.getId()%>" class="edit"
						data-toggle="tooltip"><i class="material-icons">&#xE254;&nbsp;&nbsp;</i>
					</a> <a href="delete?id=<%=user.getId()%>" class="delete"
						data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a></td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>

</body>
</html>