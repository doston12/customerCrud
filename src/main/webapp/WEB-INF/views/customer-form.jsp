<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Form</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<style>
		.error
		{
			color: #ff0000;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-2 col-md-7">
			<h2 class="text-center">Add Customer</h2>
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Add Customer</div>
				</div>
				<div class="panel-body">
					<form:form action="saveCustomer" cssClass="form-horizontal"
						method="post" modelAttribute="customer">

						<form:hidden path="id" />

						<div class="form-group">
							<label for="firstName" class="col-md-3 control-label">First
								Name</label>
							<div class="col-md-9">
								<form:input path="firstName" cssClass="form-control" />
								<form:errors path="firstName" cssClass="error" />
							</div>
						</div>
						<div class="form-group">
							<label for="lastName" class="col-md-3 control-label">Last
								Name</label>
							<div class="col-md-9">
								<form:input path="lastName" cssClass="form-control" />
								<form:errors path="lastName" cssClass="error" />
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Email</label>
							<div class="col-md-9">
								<form:input path="email" cssClass="form-control" />
								<form:errors path="email" cssClass="error" />
							</div>
						</div>


						<div class="form-group">
							<label for="gender" class="col-md-3 control-label">Gender</label>
							<div class="col-md-9">
								<form:select path="gender" >
									<form:option  value=""  label="Select Gender" cssClass="form-control" />
									<form:option value="MALE" label="Male" cssClass="form-control"/>
									<form:option value="FEMALE" label="Female" cssClass="form-control"/>
								</form:select>
								<form:errors path="gender" cssClass="error" />
							</div>
						</div>

						<div class="form-group">
							<label for="birthDate" class="col-md-3 control-label">Birthday</label>
							<div class="col-md-9">
								<form:input path="birthDate" placeholder="dd-MM-yyyy" cssClass="form-control"/>
								<form:errors path="birthDate" cssClass="error" />
							</div>
						</div>


						<div class="form-group">

							<div class="col-md-offset-3 col-md-9">
								<form:button cssClass="btn btn-primary">Submit</form:button>
							</div>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>