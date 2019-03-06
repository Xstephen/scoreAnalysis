<%--
  Created by IntelliJ IDEA.
  User: XipengCao
  Date: 2019/2/20
  Time: 22:06
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
    <link href="static/vendor/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <%--<!-- Sidebar -->--%>
    <%--<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">--%>

    <%--<!-- Sidebar - Brand -->--%>
    <%--<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=path%>/">--%>
    <%--<div style="font-size:2rem;">--%>
    <%--<i class="fas fa-chart-line"></i>--%>
    <%--</div>--%>
    <%--<div class="sidebar-brand-text mx-3">成绩分析系统</div>--%>
    <%--</a>--%>

    <%--<!-- Divider -->--%>
    <%--<hr class="sidebar-divider my-0">--%>

    <%--<!-- Dashboards Accordion Menu -->--%>
    <%--<li class="nav-item active">--%>
    <%--<a class="nav-link" href="#">--%>
    <%--<i class="fas fa-fw fa-chart-area"></i>--%>
    <%--<span>成绩分析</span>--%>
    <%--</a>--%>
    <%--</li>--%>

    <%--<!-- Divider -->--%>
    <%--<hr class="sidebar-divider">--%>


    <%--<!-- Divider -->--%>
    <%--<hr class="sidebar-divider">--%>


    <%--<!-- Sidebar Toggler (Sidebar) -->--%>
    <%--<div class="text-center d-none d-md-inline">--%>
    <%--<button class="rounded-circle border-0" id="sidebarToggle"></button>--%>
    <%--</div>--%>

    <%--</ul>--%>
    <%--<!-- End of Sidebar -->--%>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <%--<!-- Topbar Search -->--%>
                <%--<form class="d-none d-md-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 w-100">--%>
                    <%--<div class="input-group justify-content-end">--%>
                        <%--<label>${sessionScope.counselor.counselorname},您好！</label>--%>
                    <%--</div>--%>
                <%--</form>--%>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav mr-auto ml-md-auto">

                    <!-- Nav Item - User Information -->
                    <%--<li class="nav-item dropdown no-arrow">--%>
                        <%--<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"--%>
                           <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                            <%--<i class="fas fa-user" style="font-size: 1rem;color: #4e73de;"></i>--%>
                            <%--<i class="fas fa-caret-down" style="font-size: 1rem;color: #4e73de;" ;></i>--%>
                        <%--</a>--%>
                        <%--<!-- Dropdown - User Information -->--%>
                        <%--<div class="dropdown-menu dropdown-menu-right border-0 shadow animated--grow-in"--%>
                             <%--aria-labelledby="userDropdown">--%>
                            <%--<a class="dropdown-item" href="#" data-toggle="modal" data-target="#infoModal">--%>
                                <%--<i class="far fa-address-card fa-sm fa-fw mr-2 text-gray-400"></i>--%>
                                <%--个人信息--%>
                            <%--</a>--%>
                            <%--<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">--%>
                                <%--<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>--%>
                                <%--注销--%>
                            <%--</a>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                </ul>
                <%--<!-- Sidebar Toggle (Topbar) -->--%>
                <%--<button id="sidebarToggleTop" class="btn btn-link d-md-none">--%>
                <%--<i class="fa fa-bars"></i>--%>
                <%--</button>--%>
            </nav>
            <!-- End of Topbar -->
            <div class="container-fluid">
                <!-- Page Content -->
                <h1 class="display-1">404</h1>
                <p class="lead">Page not found. You can
                    <a href="javascript:history.back()">go back</a>
                    to the previous page, or
                    <a href="<%=path%>/main">return home</a>.</p>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>学生成绩分析 2019</span>
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
    <%--个人信息modal--%>
    <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="infoTitle">个人信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table table-borderless table-sm">
                        <tr>
                            <th>姓名:</th>
                            <td>${sessionScope.counselor.counselorname}</td>
                            <th>所在学院:</th>
                            <td>${sessionScope.counselor.college.collegename}</td>
                        </tr>
                        <tr>
                            <th>教工号:</th>
                            <td>${sessionScope.counselor.counselorid}</td>
                            <th>所在专业:</th>
                            <td>${sessionScope.counselor.college.majorname}</td>
                        </tr>
                        <tr>
                            <th>管理班级:</th>
                            <td><i id="classList" class="fas fa-info-circle"
                                   data-html="true"
                                   data-toggle="tooltip" data-placement="right"></i></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">确定要注销吗？</h5>
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
</div>
</body>
</html>
