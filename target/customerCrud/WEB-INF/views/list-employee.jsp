<%--
  Created by IntelliJ IDEA.
  User: Bekmirza
  Date: 10.11.2019
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head><%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employees</title>
    <link rel="stylesheet" href="<c:url value="/resources/lib/bootstrap/dist/css/bootstrap.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/lib/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/lib/Ionicons/css/ionicons.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/lib/datatables.net-bs/css/dataTables.bootstrap.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/lib/dist/css/AdminLTE.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/lib/dist/css/skins/_all-skins.min.css" />">

    <script src="<c:url value="/resources/lib/jquery/dist/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/lib/bootstrap/dist/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/lib/datatables.net/js/jquery.dataTables.min.js" />"></script>
    <script src="<c:url value="/resources/lib/datatables.net-bs/js/dataTables.bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/lib/jquery-slimscroll/jquery.slimscroll.min.js" />"></script>
    <script src="<c:url value="/resources/lib/fastclick/lib/fastclick.js" />"></script>
    <script src="<c:url value="/resources/lib/dist/js/adminlte.min.js" />"></script>

</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>LT</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Admin</b>LTE</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="navbar-custom-menu">

            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<c:url value="/resources/lib/dist/img/user2-160x160.jpg" />" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Alexander Pierce</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- search form -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" id="menuSearchText" placeholder="Search...">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">MAIN NAVIGATION</li>
                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li ><a href="/customer/list"><i class="fa fa-circle-o"></i>Customers</a></li>
                        <li class="active"><a href="/employee/list"><i class="fa fa-circle-o"></i>Employees</a></li>

                    </ul>
                </li>

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                Data Tables
                <small>employees table</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/employee/index"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="/employee/index">Tables</a></li>
                <li class="active">employees</li>
            </ol>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div>
                        <button type="button" class="btn btn-success btn-sm" style="margin-bottom: 5px"
                                onclick="window.location.href='showEmpForm'; return false;" title="Add">
                            <i class="fa fa-plus fa-lg" aria-hidden="true"></i>
                        </button>
                        <c:url var="addLink" value="/employee/showEmpForm">
                        </c:url>

                        <br/>
                        <div class="panel panel-info">

                            <div class="box-body">
                                <table id="example1" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Address</th>
                                        <th>Gender</th>
                                        <th>Salary</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="tempEmployees" items="${employees}">

                                        <!-- construct an "update" link with customer id -->
                                        <c:url var="updateLink" value="/employee/updateEmpForm">
                                            <c:param name="employeeId" value="${tempEmployees.empId}" />
                                        </c:url>

                                        <!-- construct an "delete" link with customer id -->
                                        <c:url var="deleteLink" value="/employee/deleteEmployee">
                                            <c:param name="employeeId" value="${tempEmployees.empId}" />
                                        </c:url>


                                        <tr>
                                            <td>${tempEmployees.fname}</td>
                                            <td>${tempEmployees.lname}</td>
                                            <td>${tempEmployees.address}</td>
                                            <td style="align-content: center; ">
                                                <c:if test="${tempEmployees.gender == 'MALE'}">
                                                    <div style="padding-left: 40%;">
                                                        <i class="fa fa-male fa-lg" style="align-items: center;"
                                                           aria-hidden="true"></i>
                                                    </div>

                                                </c:if>
                                                <c:if test="${tempEmployees.gender=='FEMALE' }">
                                                    <i class="fa fa-female fa-lg" style="padding-left: 40%;"
                                                       aria-hidden="true"></i>
                                                </c:if>
                                            </td>
                                            <td>${tempEmployees.salary}</td>

                                            <td>
                                                <a class="btn btn-primary btn-sm" href="${updateLink}" title="Edit">
                                                    <i class="fa fa-edit fa-lg" aria-hidden="true"></i>
                                                </a>
                                                | <a href="${deleteLink}" class="btn btn-danger btn-sm" title="Delete"
                                                     onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false">
                                                <i class="fa fa-eraser fa-lg" aria-hidden="true"></i>
                                            </a>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <!-- loop over and print our customers -->

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </div>
</div>
<script>
    $(function () {
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : true,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : true
        })
    })

    $(document).ready(function() {
        $.fn.openMenu = function() {
            var className = $(this).attr('class');

            if (className == 'treeview') {
                $(this).addClass('active');
            } else if (className == 'treeview-menu') {
                $(this).addClass('menu-open');
                $(this).css({
                    display : 'block'
                });
            }
        };

        $.fn.closeMenu = function() {
            var className = $(this).attr('class');
            var count = $(this).length;

            if (count > 1) {
                $.each($(this), function(key, element) {
                    className = $(element).attr('class');

                    if (className == 'treeview active') {
                        $(element).removeClass('active');
                    } else if (className == 'treeview-menu menu-open') {
                        $(element).removeClass('menu-open');
                        $(element).css({
                            display : 'none'
                        });
                    }
                });
            } else {
                if (className == 'treeview active') {
                    $(this).removeClass('active');
                } else if (className == 'treeview-menu menu-open') {
                    $(this).removeClass('menu-open');
                    $(this).css({
                        display : 'none'
                    });
                }
            }
        };

        $('#menuSearchText').on('input', function() {
            var filter = $(this).val();

            $('.sidebar-menu li').each(function() {
                if ($(this).text().search(new RegExp(filter, 'i')) < 0) {
                    $(this).hide();
                } else {
                    $(this).show();
                    $(this).parentsUntil('.treeview').openMenu();
                }
            });
        });

        clearInput = function() {
            var ele = document.getElementById('menuSearchText');
            ele.value = "";
            $('.sidebar-menu li').each(function() {
                $(this).show();
                $(this).parentsUntil('.treeview').closeMenu();
            });
        }

        $(function (){
            setTimeout(function(){
                $('ul.sidebar-menu').tree();
            }, 1500);
        });

    });

    function openDialog() {
        $("#dialog").load("../showEmpForm/employee-form.jsp").dialog({modal: true});
    }

</script>
</body>



</html>









