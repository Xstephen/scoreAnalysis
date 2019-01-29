<%--
  Created by IntelliJ IDEA.
  User: XipengCao
  Date: 2019/1/6
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basepath%>"/>
    <meta charset="UTF-8">
    <title>成绩分析系统</title>
    <link rel="shortcut icon" href="static/images/favicon.ico"/>
    <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div style="font-size:2rem;">
                <i class="fas fa-chart-line"></i>
            </div>
            <div class="sidebar-brand-text mx-3">成绩分析系统</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Dashboards Accordion Menu -->
        <li class="nav-item active">
            <a class="nav-link"
               href="<%=path%>/main">
                <i class="far fa-address-card"></i>
                <span>个人信息</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Components
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-folder"></i>
                <span>Pages</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item"
                       href="../../../../../../startbootstrap-sb-admin-2-master/startbootstrap-sb-admin-2-master/login.html">Login</a>
                    <a class="collapse-item"
                       href="../../../../../../startbootstrap-sb-admin-2-master/startbootstrap-sb-admin-2-master/register.html">Register</a>
                    <a class="collapse-item"
                       href="../../../../../../startbootstrap-sb-admin-2-master/startbootstrap-sb-admin-2-master/forgot-password.html">Forgot
                        Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item"
                       href="../../../../../../startbootstrap-sb-admin-2-master/startbootstrap-sb-admin-2-master/404.html">404
                        Page</a>
                    <a class="collapse-item"
                       href="../../../../../../startbootstrap-sb-admin-2-master/startbootstrap-sb-admin-2-master/blank.html">Blank
                        Page</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Addons
        </div>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link"
               href="../../../../../../startbootstrap-sb-admin-2-master/startbootstrap-sb-admin-2-master/charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Charts</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link"
               href="<%=path%>//logout">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Topbar Search -->
                <form class="d-none d-md-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 w-100">
                    <div class="input-group">

                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav mr-auto ml-md-auto">

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user" style="font-size: 1rem;color: #4e73de;"></i>
                            <i class="fas fa-caret-down" style="font-size: 1rem;color: #4e73de;";></i>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                注销
                            </a>
                        </div>
                    </li>

                </ul>

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none">
                    <i class="fa fa-bars"></i>
                </button>

            </nav>
            <!-- End of Topbar -->

            <div class="container-fluid">
                <div class="row align-items-stretch">
                    <div class="col-lg-12 mb-4">

                        <!-- Basic Card Example -->
                        <div class="card border-0 shadow mb-4">
                            <div class="card-header border-0 py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Basic Card Example</h6>
                            </div>
                            <div class="card-body">
                                The styling for this basic card example is determined by default Bootstrap utility
                                classes. By using utility classes, the style of the card component can be easily
                                modified with no need for any custom CSS!
                            </div>
                        </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>学生成绩管理 2019</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">如果您确定要退出，请选择下面注销按钮。</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                <a class="btn btn-primary"
                   href="<%=path%>/logout">注销</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="static/vendor/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="static/vendor/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="static/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="static/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="static/js/demo/chart-area-demo.js"></script>

</body>

</html>
