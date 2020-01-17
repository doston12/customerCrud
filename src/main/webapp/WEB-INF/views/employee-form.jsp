<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>

    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="col-md-offset-2 col-md-7">
        <h2 class="text-center">Add Employee</h2>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Add Employee</div>
            </div>
            <div class="panel-body">
                <form:form action="saveEmployee" cssClass="form-horizontal"
                           method="post" modelAttribute="employee">

                    <form:hidden path="empId" />

                    <div class="form-group">
                        <label for="fName" class="col-md-3 control-label">First
                            Name</label>
                        <div class="col-md-9">
                            <form:input path="fname" cssClass="form-control" />
                            <form:errors path="fname" cssClass="error" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lName" class="col-md-3 control-label">Last
                            Name</label>
                        <div class="col-md-9">
                            <form:input path="lname" cssClass="form-control" />
                            <form:errors path="lname" cssClass="error" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address" class="col-md-3 control-label">Address</label>
                        <div class="col-md-9">
                            <form:input path="address" cssClass="form-control" />
                            <form:errors path="address" cssClass="error" />
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
                        <label for="salary" class="col-md-3 control-label">Salary</label>
                        <div class="col-md-9">
                            <form:input path="salary" cssClass="form-control" />
                            <form:errors path="salary" cssClass="error" />
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
