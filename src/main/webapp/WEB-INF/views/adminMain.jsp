<%--
  Created by IntelliJ IDEA.
  User: XipengCao
  Date: 2019/2/15
  Time: 16:15
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
    <link href="static/vendor/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="static/vendor/DataTables/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/vendor/jqueryToast/css/toast.style.css">
    <link href="static/vendor/fontawesome-free-5.7.2-web/css/all.min.css" rel="stylesheet" type="text/css">

    <style>
        .table-hover > tbody > tr:hover > td,
        .table-hover > tbody > tr:hover > td {
            cursor: pointer;
        }

    </style>
</head>
<body id="page-top">
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=path%>/">
            <div style="font-size:2rem;">
                <i class="fas fa-chart-line"></i>
            </div>
            <div class="sidebar-brand-text mx-3">成绩分析系统</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Dashboards Accordion Menu -->
        <li class="nav-item active">
            <a class="nav-link" href="javascript:;">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>成绩分析</span>
            </a>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider">


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
                    <div class="input-group justify-content-end">
                        <label>${sessionScope.administrator.adminname},您好！</label>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav mr-auto ml-md-auto">

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user" style="font-size: 1rem;color: #4e73de;"></i>
                            <i class="fas fa-caret-down" style="font-size: 1rem;color: #4e73de;" ;></i>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right border-0 shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#infoModal">
                                <i class="far fa-address-card fa-sm fa-fw mr-2 text-gray-400"></i>
                                个人信息
                            </a>
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
                        <div class="card border-0 shadow mb-4">
                            <div class="card-header border-0 py-3">
                                <h6 id="baseTitle" class="m-0 font-weight-bold text-primary">学生成绩总览</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12 mb-4">
                                        <div class="card shadow mb-4">
                                            <div class="card-header border-0 py-0">
                                                <div class="form-inline m-0">
                                                    <nav aria-label="breadcrumb">
                                                        <ol id="collegeAnalysisOl"
                                                            class="breadcrumb m-0 bg-transparent">
                                                            <li class="breadcrumb-item active m-0" aria-current="page">
                                                                学院
                                                            </li>
                                                        </ol>
                                                    </nav>
                                                    <label>成绩总览</label>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <label>
                                                    <h6 class="card-text">
                                                        &emsp;鼠标滚轮滑动缩放图表。
                                                    </h6>
                                                </label>
                                                <i id="collegeChartTitle" class="far fa-question-circle"
                                                   data-toggle="tooltip"
                                                   data-placement="right"
                                                   title="显示各学院当前在校生的挂科率，挂科率越高越需要注意！"></i>
                                                <div id="fPercentageChart" class="col-lg-12"
                                                     style="height:300px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="collegeAnalysisDiv" class="row align-items-stretch">
                    <div class="col-lg-12 mb-4">
                        <div class="card border-0 shadow mb-4">
                            <div class="card-header border-0 py-3">
                                <h6 id="collegeTitle" class="m-0 font-weight-bold text-primary">学生成绩分析</h6>
                            </div>
                            <div class="card-body">
                                <ul class="nav nav-tabs" id="collegeAnalysisTab" role="tablelist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="scoreAnalysis" data-toggle="tab"
                                           href="#scoreAnalysisDiv" role="tab" aria-controls="scoreAnalysisDiv"
                                           aria-selected="true">成绩分析</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="courseAnalysis" data-toggle="tab"
                                           href="#courseAnalysisDiv" role="tab" aria-controls="courseAnalysisDiv"
                                           aria-selected="true">课程分析</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="collegeAnalysisContent">
                                    <div class="tab-pane fade show active" id="scoreAnalysisDiv" role="tabpanel"
                                         aria-labelledby="scoreAnalysisDiv-tab">
                                        <div id="selectDiv" class="row">
                                            <div class="form-inline">
                                                <label>&emsp;选择学年：
                                                    <select class="custom-select" id="yearSelectMain">
                                                        <option selected></option>
                                                    </select>
                                                </label>
                                                <label>&emsp;选择学期：
                                                    <select class="custom-select" id="termSelectMain">
                                                        <option selected></option>
                                                    </select>
                                                </label>
                                            </div>
                                        </div>
                                        <div id="listDiv" class="row">
                                            <div id="studentListDiv" class="col-lg-12 mb-4">
                                                <div class="card shadow">
                                                    <div class="card-header border-0 py-3 form-inline">
                                                        <h6 id="rankTitle" class="m-0 font-weight-bold">学生列表</h6>
                                                        <i class="far fa-question-circle" data-toggle="tooltip"
                                                           data-placement="right"
                                                           title="显示学生各学期智育成绩排名，默认显示截至当前学期总排名"></i>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <div id="studentList_wrapper"
                                                                 class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                                <div class="row">
                                                                    <div class="col-sm-12 col-md-6"></div>
                                                                    <div class="col-sm-12 col-md-6">
                                                                        <div id="studentList_search"
                                                                             class="dataTables_filter">
                                                                            <label>
                                                                                搜索:
                                                                                <input id="searchInput"
                                                                                       type="search" name="search"
                                                                                       class="form-control form-control-sm"
                                                                                       aria-controls="studentList"/>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <table id="studentList" class="table table-hover">
                                                                <thead>
                                                                <tr>
                                                                    <th>
                                                                        学号
                                                                    </th>
                                                                    <th>
                                                                        学生姓名
                                                                    </th>
                                                                    <th>
                                                                        学院
                                                                    </th>
                                                                    <th>
                                                                        专业
                                                                    </th>
                                                                    <th>
                                                                        年级
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--<div id="attentionDiv" class="col-lg-4 mb-4">--%>
                                                <%--<div id="attentionListCard" class="card shadow">--%>
                                                <%--<div class="card-header border-0 py-3 form-inline">--%>
                                                <%--<h6 class="m-0 font-weight-bold">挂科较多学生列表</h6>--%>
                                                <%--<i class="far fa-question-circle" data-toggle="tooltip"--%>
                                                <%--data-placement="right"--%>
                                                <%--title="截至当前学期，挂科次数大于5门的学生列表。"></i>--%>
                                                <%--</div>--%>
                                                <%--<div class="card-body">--%>
                                                <%--<div class="table-responsive">--%>
                                                <%--<table id="attentionList" class="table table-hover">--%>
                                                <%--<thead>--%>
                                                <%--<tr>--%>
                                                <%--<th>--%>
                                                <%--学号--%>
                                                <%--</th>--%>
                                                <%--<th>--%>
                                                <%--姓名--%>
                                                <%--</th>--%>
                                                <%--<th>--%>
                                                <%--挂科数--%>
                                                <%--</th>--%>
                                                <%--</tr>--%>
                                                <%--</thead>--%>
                                                <%--<tbody>--%>
                                                <%--</tbody>--%>
                                                <%--</table>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--<div id="ascendListCard" class="card shadow">--%>
                                                <%--<div class="card-header border-0 py-3 form-inline">--%>
                                                <%--<h6 class="m-0 font-weight-bold">成绩上升学生名单</h6>--%>
                                                <%--<i class="far fa-question-circle" data-toggle="tooltip"--%>
                                                <%--data-placement="right"--%>
                                                <%--title="截至当前学期，每个学期排名都上升的学生列表。"></i>--%>
                                                <%--</div>--%>
                                                <%--<div class="card-body">--%>
                                                <%--<div id="ascendListDiv" class="table-responsive">--%>
                                                <%--<table id="ascendList" class="table table-hover">--%>
                                                <%--<thead>--%>
                                                <%--<tr>--%>
                                                <%--<th>--%>
                                                <%--学号--%>
                                                <%--</th>--%>
                                                <%--<th>--%>
                                                <%--姓名--%>
                                                <%--</th>--%>
                                                <%--</tr>--%>
                                                <%--</thead>--%>
                                                <%--</table>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                            </div>
                                        </div>
                                        <div id="dataShowDiv" class="row">
                                            <div class="col-lg-12 mb-4">
                                                <div id="dataShowCard" class="card shadow">
                                                    <div class="card-header border-0 py-3">
                                                        <div class="row  form-inline">
                                                            <label>
                                                                <h6 class="m-0 font-weight-bold"></h6>
                                                            </label>
                                                            <div>
                                                                <select class="custom-select" id="selectScale">
                                                                    <option value="term">学期</option>
                                                                    <option value="year">学年</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div id="termChart" class="col-lg-6"
                                                                 style="height:300px;"></div>
                                                            <div id="rankChart" class="col-lg-6"
                                                                 style="height:300px;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="studentCourseDiv" class="row">
                                            <div class="col-lg-12 mb-4">
                                                <div id="studentCourseCard" class="card shadow">
                                                    <div class="card-header  border-0 py-3">
                                                        <div class="row  form-inline">
                                                            <label>
                                                                <h6 class="m-0 font-weight-bold">
                                                                    各课程成绩总览&emsp;
                                                                </h6>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <ul class="nav nav-tabs" id="studentCourseTab" role="tablist">
                                                            <li class="nav-item">
                                                                <a class="nav-link active" id="pic-tab"
                                                                   data-toggle="tab"
                                                                   href="#pic-div" role="tab" aria-controls="pic-div"
                                                                   aria-selected="true">统计图</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" id="table-tab" data-toggle="tab"
                                                                   href="#table-div" role="tab"
                                                                   aria-controls="table-div"
                                                                   aria-selected="false">表格</a>
                                                            </li>
                                                        </ul>
                                                        <div class="tab-content" id="tabContent">
                                                            <div class="tab-pane fade show active" id="pic-div"
                                                                 role="tabpanel"
                                                                 aria-labelledby="pic-tab">
                                                                <%--<div class="row">--%>
                                                                <div class="form-inline">
                                                                    <label>&emsp;选择学期：
                                                                        <select class="custom-select" id="termSelect">
                                                                            <option selected></option>
                                                                        </select>
                                                                    </label>
                                                                </div>
                                                                <%--</div>--%>
                                                                <%--<div class="row form-inline">--%>
                                                                <label>
                                                                    <h6 class="card-text">
                                                                        &emsp;鼠标滚轮滑动缩放图表。(绿色表示成绩优异，蓝色表示成绩普通，红色表示成绩较差，橙色表示该门课程尚未通过，需要注意!)
                                                                    </h6>
                                                                </label>
                                                                <i class="far fa-question-circle" data-toggle="tooltip"
                                                                   data-placement="right"
                                                                   title="每课成绩将与同课程学生成绩对比，如果高于所有学生成绩的上四分位数，则成绩显示为绿色，即优异，如果低于下四分位数或未及格，则成绩显示为红色，需要注意！"></i>
                                                                <%--</div>--%>
                                                                <%--<div class="row">--%>
                                                                <div id="courseChart" class="col-lg-12"
                                                                     style="height:600px;"></div>
                                                                <%--</div>--%>
                                                            </div>
                                                            <div class="tab-pane fade" id="table-div" role="tabpanel"
                                                                 aria-labelledby="table-tab">
                                                                <div class="table-responsive">
                                                                    <table id="studentCourseTable"
                                                                           class="table display table-hover"
                                                                           width="100%" cellpadding="0">
                                                                        <thead>
                                                                        <tr>
                                                                            <th scope="col">课程名</th>
                                                                            <th scope="col">学年</th>
                                                                            <th scope="col">学期</th>
                                                                            <th scope="col">学分</th>
                                                                            <th scope="col">学时</th>
                                                                            <th scope="col">成绩</th>
                                                                            <th scope="col">排名</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="courseAnalysisDiv" role="tabpanel"
                                         aria-labelledby="courseAnalysisDiv-tab">
                                        <div id="courseInMajorListDiv">
                                            <div class="row">
                                                <div class="col-lg-12 mb-4">
                                                    <div class="card shadow">
                                                        <div class="card-header border-0 py-3 form-inline">
                                                            <h6 id="courseInMajorTitle" class="m-0 font-weight-bold">
                                                                课程列表</h6>
                                                            <i class="far fa-question-circle" data-toggle="tooltip"
                                                               data-placement="right"
                                                               title="显示学生各学期智育成绩排名，默认显示截至当前学期总排名"></i>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <div id="courseInMajorList_wrapper"
                                                                     class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                                    <div class="row">
                                                                        <div class="col-sm-12 col-md-6">
                                                                            <div id="tableTermSelectDiv"
                                                                                 class="dataTables_filter form-inline">
                                                                                <label>选择学期：</label>
                                                                                <select class="custom-select"
                                                                                        id="tableTermSelect">
                                                                                    <option selected></option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-12 col-md-6">
                                                                            <div id="courseInMajorList_search"
                                                                                 class="dataTables_filter">
                                                                                <label>
                                                                                    搜索:
                                                                                    <input id="searchCourseInput"
                                                                                           type="search" name="search"
                                                                                           class="form-control form-control-sm"
                                                                                           aria-controls="studentList"/>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <table id="courseInMajorList" class="table table-hover">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>
                                                                            课程号
                                                                        </th>
                                                                        <th>
                                                                            课程名
                                                                        </th>
                                                                        <th>
                                                                            学分
                                                                        </th>
                                                                        <th>
                                                                            学时
                                                                        </th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="courseInMajorChartDiv" class="row">
                                                <div id="courseInMajorChart" class="col-lg-12"
                                                     style="height:600px;"></div>
                                            </div>
                                            <div id="courseDetailDiv" class="row">
                                                <div class="col-lg-12 mb-4">
                                                    <div class="card shadow">
                                                        <div class="card-header  border-0 py-3">
                                                            <div class="row  form-inline">
                                                                <label>
                                                                    <h6 id="courseDetailLabel"
                                                                        class="m-0 font-weight-bold">
                                                                        课程详情
                                                                    </h6>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <table id="courseTable"
                                                                       class="table display table-hover"
                                                                       width="100%" cellpadding="0">
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">学号</th>
                                                                        <th scope="col">姓名</th>
                                                                        <th scope="col">班级号</th>
                                                                        <th scope="col">成绩</th>
                                                                        <th scope="col">排名</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id='notPassDiv' class="row">
                                                <div class="col-lg-12  mb-4 ">
                                                    <div class="card shadow">
                                                        <div class="card-header  border-0 py-3">
                                                            <div class="row  form-inline">
                                                                <label>
                                                                    <h6 id="notPassLabel" class="m-0 font-weight-bold">
                                                                        未通过学生列表
                                                                    </h6>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <table id="notPassTable"
                                                                       class="table display table-hover"
                                                                       width="100%" cellpadding="0">
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">学号</th>
                                                                        <th scope="col">姓名</th>
                                                                        <th scope="col">班级号</th>
                                                                        <th scope="col">成绩</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                            <td>${sessionScope.administrator.adminname}</td>
                        </tr>
                        <tr>
                            <th>教工号:</th>
                            <td>${sessionScope.administrator.adminid}</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 课程成绩详情modal-->
    <!-- Modal -->
    <div class="modal fade" id="courseDetailModal" tabindex="-1" role="dialog" aria-labelledby="courseDetailTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="courseDetailTitle">课程详情</h5>
                    <button id="modalClose" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div id="modalBody" class="modal-body">
                </div>
                <div class="modal-footer">
                    <button id="modalFClose" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
<!-- Bootstrap core JavaScript-->
<script src="static/vendor/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="static/vendor/popper/popper.min.js"></script>
<script src="static/vendor/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="static/vendor/DataTables/datatables.min.js"></script>
<script src="static/vendor/jqueryToast/js/toast.script.js"></script>
<!-- Custom scripts for all pages-->
<script src="static/js/sb-admin-2.min.js"></script>
<script src="static/js/showCharts.js"></script>
<script src="static/js/adminMainScoreAnalysis.js"></script>

<script src="static/vendor/echarts/echarts.min.js"></script>
<script src="static/vendor/echarts/theme/walden.js"></script>
<script type="text/javascript">
    var failurePercentageChart;
    var basepath = $('base').attr('href');
    var termChart;
    var rankChart;
    var courseChart;
    var courseInMajorChart;
    var courseInMajorListTable
    var courseTable;
    var notPassTable;

    function ajaxShowCourseInMajor(preInfo) {
        $('#tableTermSelectDiv').hide();
        if (courseInMajorListTable != null) {
            courseInMajorListTable.destroy();
            $('#courseInMajorList').empty();
            $('#courseInMajorList').html('<thead>\n' +
                '                                                                    <tr>\n' +
                '                                                                        <th>\n' +
                '                                                                            课程号\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            课程名\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            学分\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            学时\n' +
                '                                                                        </th>\n' +
                '                                                                    </tr>\n' +
                '                                                                    </thead>');
        }

        courseInMajorListTable = $('#courseInMajorList').DataTable({
            serverSide: true,
            processing: true,//载入数据的时候是否显示载入中
            pageLength: 10,
            ordering: false,
            pagingType: "full_numbers",
            autoWidth: false,
            stateSave: true,
            searching: false,
            lengthChange: false,
            paging: true,
            scrollCollapse: true,
            destroy: true,
            //select: true,
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            ajax: {
                type: "post",
                url: basepath + "admin/getCourseInMajor",
                async: true,
                cache: true,
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                data: function (d) {
                    var param = {};
                    param.draw = d.draw;
                    param.start = d.start;
                    param.length = d.length;
                    var searchStr = $('#searchCourseInput').val();
                    if (searchStr != null && searchStr != "") {
                        param.search = searchStr;
                    }
                    param["collegeid"] = preInfo.college.collegeid;
                    param["majorid"] = preInfo.college.majorid;
                    return JSON.stringify(param);//自定义需要传递的参数。
                },
                dataFilter: function (data) {
                    result = JSON.parse(data);
                    if (result.code == 100) {
                        if (preInfo.college.majorname == null) {
                            $('#courseInMajorTitle').text(preInfo.college.collegename + preInfo.college.majorid);
                        } else {
                            $('#courseInMajorTitle').text(preInfo.college.collegename + preInfo.college.majorname);
                        }
                        // $('#collegeAnalysisDiv').show();
                        //封装返回数据
                        var returnData = {};
                        var info = result.content.info;
                        returnData.draw = info.draw;
                        returnData.recordsTotal = info.total;
                        returnData.recordsFiltered = info.total;//后台不实现过滤功能，每次查询均视作全部结果
                        returnData.data = info.pageData;//返回的数据列表
                        return JSON.stringify(returnData);//这几个参数都是datatable需要的，必须要
                    } else if (result.code == 200) {
                        $.Toast("查询失败", data.msg, "warning", {
                            stack: true,
                            has_icon: true,
                            has_close_btn: false,
                            fullscreen: false,
                            width: 400,
                            spacing: 20,
                            timeout: 3000,
                            border_radius: 8,
                            sticky: false,
                            position_class: "toast-top-right",
                            has_progress: false,
                            rtl: false
                        });
                    }
                }
            },
            "drawCallback": function (settings) {
                //渲染完毕后的回调
                //默认选中第一行
                //$("tbody tr",$table).eq(0).click();
            },
            columns: [
                {"data": "courseid"},
                {"data": "course.coursename"},
                {"data": "course.credit"},
                {"data": "course.classhour"}
            ]
        });
        //给courseInMajorList注册行点击事件
        $('#courseInMajorList tbody').off("click").on('click', 'tr', function () {
            var courseid = $(this).find('td:first').text();
            var coursename = $(this).find('td:first').next().text();
            var collegeid = preInfo.college.collegeid;
            var majorid = preInfo.college.majorid;
            //显示该课程，各年级的成绩对比
            ajaxShowCourseCompare(collegeid, majorid, courseid, coursename);
        });
        //给搜索框注册
        //查询按钮
        $("#searchCourseInput").off("keydown").on("keydown",function (e) {
            if (e.keyCode == 13) {
                courseInMajorListTable.draw();//查询后不需要保持分页状态，回首页
            }
        });
    }

    function ajaxShowCourseCompare(collegeid, majorid, courseid, coursename) {
        $.ajax({
            url: basepath + 'admin/getCourseCompareDetail',
            async: true,
            cache: true,
            type: "post",
            dataType: 'json',
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                collegeid: collegeid,
                majorid: majorid,
                courseid: courseid
            }),
            success: function (data) {
                if (data.code == 100) {
                    var compareList = data.content.compareList;
                    var maxList = [];
                    var minList = [];
                    var meanList = [];
                    var medianList = [];
                    var gradeList = [];
                    for (var i = 0; i < compareList.length; i++) {
                        //最大值
                        maxList.push(compareList[i].maxscore);
                        //最小值
                        minList.push(compareList[i].minscore);
                        //平均值
                        meanList.push(compareList[i].mean);
                        //中位数
                        medianList.push(compareList[i].median);
                        gradeList.push(compareList[i].year);
                    }
                    var option = {
                        title: {
                            text: coursename + "成绩对比",
                            //subtext: '纯属虚构'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['最大值', '最小值', '平均值', '中位数']
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: {show: true},
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        calculable: true,
                        xAxis: [
                            {
                                type: 'category',
                                boundaryGap: false,
                                data: gradeList
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                axisLabel: {
                                    formatter: '{value} °C'
                                }
                            }
                        ],
                        series: [
                            {
                                name: '最大值',
                                type: 'line',
                                data: maxList,
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                },
                                markLine: {
                                    data: [
                                        {type: 'average', name: '平均值'}
                                    ]
                                }
                            },
                            {
                                name: '最小值',
                                type: 'line',
                                data: minList,
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                },
                                markLine: {
                                    data: [
                                        {type: 'average', name: '平均值'}
                                    ]
                                }
                            },
                            {
                                name: '平均值',
                                type: 'line',
                                data: meanList,
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                },
                                markLine: {
                                    data: [
                                        {type: 'average', name: '平均值'}
                                    ]
                                }
                            },
                            {
                                name: '中位数',
                                type: 'line',
                                data: medianList,
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                },
                                markLine: {
                                    data: [
                                        {type: 'average', name: '平均值'}
                                    ]
                                }
                            }
                        ]
                    };
                    $('#courseInMajorChartDiv').show();
                    courseInMajorChart.setOption(option);
                    courseInMajorChart.resize();
                }
            }
        });

    }

    function ajaxShowCourseInGrade(preInfo) {
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        if (courseInMajorListTable != null) {
            courseInMajorListTable.destroy();
            $('#courseInMajorList').empty();
            $('#courseInMajorList').html('<thead>\n' +
                '                                                                    <tr>\n' +
                '                                                                        <th>\n' +
                '                                                                            课程号\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            课程名\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            学年\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            学期\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            学分\n' +
                '                                                                        </th>\n' +
                '                                                                        <th>\n' +
                '                                                                            学时\n' +
                '                                                                        </th>\n' +
                '                                                                    </tr>\n' +
                '                                                                    </thead>');
        }
        courseInMajorListTable = $('#courseInMajorList').DataTable({
            serverSide: true,
            processing: true,//载入数据的时候是否显示载入中
            pageLength: 10,
            ordering: false,
            pagingType: "full_numbers",
            autoWidth: false,
            stateSave: true,
            searching: false,
            lengthChange: false,
            paging: true,
            scrollCollapse: true,
            destroy: true,
            //select: true,
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            ajax: {
                type: "post",
                url: basepath + "admin/getCourseInGrade",
                async: true,
                cache: true,
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                data: function (d) {
                    var param = {};
                    param.draw = d.draw;
                    param.start = d.start;
                    param.length = d.length;
                    var searchStr = $('#searchCourseInput').val();
                    if (searchStr != null && searchStr != "") {
                        param.search = searchStr;
                    }
                    param["collegeid"] = preInfo.college.collegeid;
                    param["majorid"] = preInfo.college.majorid;
                    param["grade"] = preInfo.grade;
                    var ss=$('#tableTermSelect').children('option:selected').val();
                    if(ss!=null && ss!=''){
                        var ssList=ss.split('+');
                        param['year']=ssList[0];
                        param['term']=ssList[1];
                    }
                    return JSON.stringify(param);//自定义需要传递的参数。
                },
                dataFilter: function (data) {
                    result = JSON.parse(data);
                    if (result.code == 100) {
                        if (preInfo.college.majorname == null) {
                            $('#courseInMajorTitle').text(preInfo.college.collegename + preInfo.college.majorid + preInfo.grade + '级');
                        } else {
                            $('#courseInMajorTitle').text(preInfo.college.collegename + preInfo.college.majorname + preInfo.grade + '级');
                        }
                        // $('#collegeAnalysisDiv').show();
                        //封装返回数据
                        var returnData = {};
                        var info = result.content.info;
                        returnData.draw = info.draw;
                        returnData.recordsTotal = info.total;
                        returnData.recordsFiltered = info.total;//后台不实现过滤功能，每次查询均视作全部结果
                        var pageData = info.pageData;//返回的数据列表
                        for (var i = 0; i < pageData.length; i++) {
                            pageData[i].term = term[pageData[i].term];
                        }
                        returnData.data = pageData;
                        return JSON.stringify(returnData);//这几个参数都是datatable需要的，必须要
                    } else if (result.code == 200) {
                        $.Toast("查询失败", data.msg, "warning", {
                            stack: true,
                            has_icon: true,
                            has_close_btn: false,
                            fullscreen: false,
                            width: 400,
                            spacing: 20,
                            timeout: 3000,
                            border_radius: 8,
                            sticky: false,
                            position_class: "toast-top-right",
                            has_progress: false,
                            rtl: false
                        });
                    }
                }
            },
            "drawCallback": function (settings) {
                //渲染完毕后的回调
                //默认选中第一行
                //$("tbody tr",$table).eq(0).click();
            },
            columns: [
                {"data": "courseid"},
                {"data": "course.coursename"},
                {"data": "year"},
                {"data": "term"},
                {"data": "course.credit"},
                {"data": "course.classhour"}
            ]
        });
        //ajax请求该年级的学期
        $.ajax({
            type: "post",
            url: basepath + "admin/getTermInGrade",
            async: true,
            cache: true,
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                collegeid:preInfo.college.collegeid,
                majorid:preInfo.college.majorid,
                grade:preInfo.grade
            }),
            success:function (data) {
                if(data.code==100){
                    //表格选择不同学期
                    $('#tableTermSelectDiv').show();
                    var tableTermSelect = $('#tableTermSelect');
                    tableTermSelect.html('<option selected></option>');
                    var yearTermList = data.content.yearTermList;
                    for (var i = 0; i < yearTermList.length; i++) {
                        var yearTerm = yearTermList[i].split('+');
                        tableTermSelect.append("<option value=\'" + yearTermList[i] + "\'>" + yearTerm[0] + term[yearTerm[1]] + "</option>");
                    }
                    //注册选择学期事件
                    tableTermSelect.off("change").on("change",function () {
                        courseInMajorListTable.draw();
                    });
                }else if(result.code==200){
                    $.Toast("查询失败", data.msg, "warning", {
                        stack: true,
                        has_icon: true,
                        has_close_btn: false,
                        fullscreen: false,
                        width: 400,
                        spacing: 20,
                        timeout: 3000,
                        border_radius: 8,
                        sticky: false,
                        position_class: "toast-top-right",
                        has_progress: false,
                        rtl: false
                    });
                }
            }
        });
        //给courseInMajorList注册行点击事件
        $('#courseInMajorList tbody').off("click").on('click', 'tr', function () {
            var courseid = $(this).find('td:first').text();
            var coursename = $(this).find('td:first').next().text()
            var year = $(this).find('td:first').next().next().text();
            var term = $(this).find('td:first').next().next().next().text();
            if (term == "春季学期") {
                term = "1";
            } else {
                term = "2";
            }
            var collegeid = preInfo.college.collegeid;
            var majorid = preInfo.college.majorid;
            var grade = preInfo.grade;
            //显示该课程的学生名单
            ajaxShowCourseDetail(collegeid, majorid, courseid, coursename, year, term, grade);
        });
        //给搜索框注册
        //查询按钮
        $("#searchCourseInput").off("keydown").on("keydown",function (e) {
            if (e.keyCode == 13) {
                courseInMajorListTable.draw();//查询后不需要保持分页状态，回首页
            }
        });
    }

    function ajaxShowCourseDetail(collegeid, majorid, courseid, coursename, year, term, grade) {
        var termMap = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        $.ajax({
            url: basepath + "admin/getStudentInfoInCourse",
            async: true,
            cache: true,
            type: "post",
            dataType: 'json',
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify({
                collegeid: collegeid,
                majorid: majorid,
                courseid: courseid,
                year: year,
                term: term,
                grade: grade
            }),
            success: function (data) {
                if (data.code == 100) {
                    var studentCourseList = data.content.studentCourseList;
                    var tableList = [];
                    var notPassList = [];
                    var notPassTableList = [];
                    for (var i = 0; i < studentCourseList.length; i++) {
                        if (studentCourseList[i].pass == 0) {
                            notPassTableList.push([studentCourseList[i].studentid, studentCourseList[i].student.studentname, studentCourseList[i].student.classid,
                                studentCourseList[i].score]);
                            notPassList.push(studentCourseList[i]);
                        }
                        tableList.push([studentCourseList[i].studentid, studentCourseList[i].student.studentname, studentCourseList[i].student.classid
                            , studentCourseList[i].score, studentCourseList[i].studentrank]);
                    }
                    $('#courseDetailDiv').show();
                    $('#courseDetailLabel').text(coursename + '课程详情-' + year + termMap[term]);
                    courseTable = $('#courseTable').DataTable({
                        lengthChange: false,
                        paging: true,
                        order: [[4, "asc"]],
                        scrollCollapse: true,
                        //select: true,
                        destroy: true,
                        language: {
                            "sProcessing": "处理中...",
                            "sLengthMenu": "显示 _MENU_ 项结果",
                            "sZeroRecords": "没有匹配结果",
                            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                            "sInfoPostFix": "",
                            "sSearch": "搜索:",
                            "sUrl": "",
                            "sEmptyTable": "表中数据为空",
                            "sLoadingRecords": "载入中...",
                            "sInfoThousands": ",",
                            "oPaginate": {
                                "sFirst": "首页",
                                "sPrevious": "上页",
                                "sNext": "下页",
                                "sLast": "末页"
                            },
                            "oAria": {
                                "sSortAscending": ": 以升序排列此列",
                                "sSortDescending": ": 以降序排列此列"
                            }
                        }
                    });
                    courseTable.clear();
                    courseTable.rows.add(tableList).nodes().to$().attr({
                        "data-toggle": "tooltip",
                        "title": "点击查看详情"
                    });
                    courseTable.draw();
                    $('[data-toggle="tooltip"]').tooltip();
                    $('#courseTable tbody').off('click').on('click', 'tr', function () {
                        var rowIndex = courseTable.row(this).index();
                        var studentCourseInfo = studentCourseList[rowIndex];
                        var modal = $('#courseDetailModal');
                        var url = basepath + 'admin/courseDetail';
                        ajaxShowModal(modal, studentCourseInfo, url);
                    });
                    if (notPassTableList.length > 0) {
                        $('#notPassDiv').show();
                        $('#notPassLabel').text(coursename + '课程尚未通过学生名单');
                        notPassTable = $('#notPassTable').DataTable({
                            lengthChange: false,
                            paging: true,
                            //order: [[4, "asc"]],
                            ordering: false,
                            scrollCollapse: true,
                            destroy: true,
                            //select: true,
                            language: {
                                "sProcessing": "处理中...",
                                "sLengthMenu": "显示 _MENU_ 项结果",
                                "sZeroRecords": "没有匹配结果",
                                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                                "sInfoPostFix": "",
                                "sSearch": "搜索:",
                                "sUrl": "",
                                "sEmptyTable": "表中数据为空",
                                "sLoadingRecords": "载入中...",
                                "sInfoThousands": ",",
                                "oPaginate": {
                                    "sFirst": "首页",
                                    "sPrevious": "上页",
                                    "sNext": "下页",
                                    "sLast": "末页"
                                },
                                "oAria": {
                                    "sSortAscending": ": 以升序排列此列",
                                    "sSortDescending": ": 以降序排列此列"
                                }
                            }
                        });
                        notPassTable.clear();
                        notPassTable.rows.add(notPassTableList).nodes().to$().attr({
                            "data-toggle": "tooltip",
                            "title": "点击查看详情"
                        });
                        notPassTable.draw();
                        $('#notPassTable tbody').off('click').on('click', 'tr', function () {
                            var rowIndex = notPassTable.row(this).index();
                            var studentCourseInfo = notPassList[rowIndex];
                            var modal = $('#courseDetailModal');
                            var url = basepath + 'admin/courseDetail';
                            ajaxShowModal(modal, studentCourseInfo, url);
                        });
                    }
                } else if (data.code == 200) {
                    //查询失败
                    $.Toast("查询失败", data.msg, "warning", {
                        stack: true,
                        has_icon: true,
                        has_close_btn: false,
                        fullscreen: false,
                        width: 400,
                        spacing: 20,
                        timeout: 3000,
                        border_radius: 8,
                        sticky: false,
                        position_class: "toast-top-right",
                        has_progress: false,
                        rtl: false,
                    });
                }
            }
        });
    }

    $(document).ready(function (e) {
        $('[data-toggle="tooltip"]').tooltip();
        termChart = echarts.init(document.getElementById('termChart'), 'walden');
        rankChart = echarts.init(document.getElementById('rankChart'), 'walden');
        courseChart = echarts.init(document.getElementById('courseChart'), 'walden');
        courseInMajorChart = echarts.init(document.getElementById('courseInMajorChart'), 'walden')
        studentCourseTable = $('#studentCourseTable').DataTable({
            lengthChange: false,
            //select: true,
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            }
        });
        $('#dataShowDiv').hide();
        $('#studentCourseDiv').hide();
        $('#selectDiv').hide();
        $('#courseAnalysis').hide();
        $('#courseInMajorChartDiv').hide();
        $('#courseDetailDiv').hide();
        $('#notPassDiv').hide();
        $('#tableTermSelectDiv').hide();
        failurePercentageChart = echarts.init(document.getElementById('fPercentageChart'), 'walden');
        window.onresize = function () {
            failurePercentageChart.resize();
            termChart.resize();
            rankChart.resize();
            courseChart.resize()
            courseInMajorChart.resize();
        };
        //查询各学院、专业、年级的挂科率
        var collegeList = [];
        var majorList = [];
        var gradeList = [];
        $.ajax({
            url: basepath + 'admin/getFailurePercentage',
            async: true,
            cache: true,
            type: "post",
            dataType: 'json',
            data: {},
            success: function (data) {
                if (data.code == 100) {
                    collegeList = data.content.collegeList;
                    majorList = data.content.majorList;
                    gradeList = data.content.gradeList;
                    //先绘制全学院的柱状图
                    var xData = [];
                    var yData = [];
                    var yMax = 0;
                    for (var i = 0; i < collegeList.length; i++) {
                        xData.push(collegeList[i].college.collegename);
                        var percentage = parseFloat(collegeList[i].percentage) * 100;
                        yData.push(parseInt(percentage));
                        if (percentage > yMax) {
                            yMax = percentage;
                        }
                    }
                    yMax = yMax + yMax * 0.1;
                    showCollegeChart(failurePercentageChart, xData, yData, yMax);
                    var listMap = {
                        "学院": collegeList,
                        "专业": majorList,
                        "年级": gradeList
                    };
                    var selectMap = {
                        "学院": collegeList
                    }
                    var nextMap = {
                        "学院": "专业",
                        "专业": "年级"
                    };
                    ajaxShowCollegeAnalysis("all", {}, "学生成绩分析");
                    failurePercentageChart.off('click');
                    //图表点击事件绑定
                    failurePercentageChart.on('click', function (params) {
                        $('#dataShowDiv').hide();
                        $('#studentCourseDiv').hide();
                        $('#courseInMajorChartDiv').hide();
                        //判断当前范围
                        var scale = $('#collegeAnalysisOl li').last().text().trim();
                        var collegeAnalysisOl = $('#collegeAnalysisOl');
                        var aText;
                        var collegeAnalysisDivTitle;
                        var preInfo;
                        if (scale in selectMap) {
                            preInfo = selectMap[scale][params.dataIndex];
                            if (scale == "学院") {
                                aText = preInfo.college.collegename;
                                collegeAnalysisDivTitle = preInfo.college.collegename;
                            } else if (scale == "专业") {
                                if (preInfo.college.majorname == null) {
                                    aText = preInfo.college.majorid;
                                } else {
                                    aText = preInfo.college.majorname;
                                }
                                collegeAnalysisDivTitle = preInfo.college.collegename + aText;
                                $('#courseAnalysis').show();
                                //显示该专业的课程总览，图表显示各年级的成绩对比
                                $('#courseDetailDiv').hide();
                                $('#notPassDiv').hide();
                                ajaxShowCourseInMajor(preInfo);
                            } else {
                                aText = preInfo.grade + "级";
                                if (preInfo.college.majorname == null) {
                                    collegeAnalysisDivTitle = preInfo.college.collegename + preInfo.college.majorid + aText;
                                } else {
                                    collegeAnalysisDivTitle = preInfo.college.collegename + preInfo.college.majorname + aText;
                                }
                                //修改studentList的宽度
                                $('#studentListDiv').removeClass("col-lg-12");
                                $('#studentListDiv').addClass("col-lg-8");
                                ajaxShowAttentionList(preInfo);
                                //显示该年级的课程总览，图表显示课程信息
                                $('#courseDetailDiv').hide();
                                $('#notPassDiv').hide();
                                ajaxShowCourseInGrade(preInfo);
                            }
                        } else {
                            preInfo = selectMap["年级"][params.dataIndex];
                            aText = preInfo.grade + "级";
                            if (preInfo.college.majorname == null) {
                                collegeAnalysisDivTitle = preInfo.college.collegename + preInfo.college.majorid + aText;
                            } else {
                                collegeAnalysisDivTitle = preInfo.college.collegename + preInfo.college.majorname + aText;
                            }
                            ajaxShowAttentionList(preInfo);
                            ajaxShowCourseInGrade(preInfo);
                        }
                        ajaxShowCollegeAnalysis(scale, preInfo, collegeAnalysisDivTitle);
                        if (scale == "学院" || scale == "专业") {
                            collegeAnalysisOl.append('<li class="breadcrumb-item">' + aText + '</li>');
                            collegeAnalysisOl.append('<li class="breadcrumb-item active" aria-current="page">' + nextMap[scale] + '</li>')
                            $('#collegeAnalysisOl li').last().prev().prev().removeClass("active").removeAttr("aria-current").html('<a href="javascript:;">' + scale + '</a>');
                            $('#collegeAnalysisOl li').last().prev().prev().find('a').on('click', function () {
                                $('#dataShowDiv').hide();
                                $('#studentCourseDiv').hide();
                                $('#courseAnalysis').hide();
                                $('#selectDiv').hide();
                                $('#scoreAnalysis').tab('show');
                                $('#studentListDiv').removeClass("col-lg-8");
                                $('#attentionDiv').remove();
                                $('#studentListDiv').addClass("col-lg-12");
                                var aList = selectMap[scale];
                                var xData = [];
                                var yData = [];
                                var yMax = 0;
                                if (scale == "学院") {
                                    ajaxShowCollegeAnalysis("all", {}, "学生成绩分析")
                                } else if (scale == "专业") {
                                    ajaxShowCollegeAnalysis("学院", preInfo, preInfo.college.collegename);
                                }
                                for (var i = 0; i < aList.length; i++) {
                                    if (scale == "学院") {
                                        xData.push(aList[i].college.collegename);
                                    } else if (scale == "专业") {
                                        if (aList[i].college.majorname == null) {
                                            xData.push(aList[i].college.majorid);
                                        } else {
                                            xData.push(aList[i].college.majorname);
                                        }
                                    }
                                    var percentage = parseFloat(aList[i].percentage) * 100;
                                    yData.push(parseInt(percentage));
                                    if (percentage > yMax) {
                                        yMax = percentage;
                                    }
                                }
                                yMax = yMax + yMax * 0.1;
                                showCollegeChart(failurePercentageChart, xData, yData, yMax);
                                //后面的都删掉
                                $(this).parent().nextAll().remove();
                                var aText = $(this).text();
                                $(this).parent().html(aText);
                            });
                            //显示点击对应图表
                            var nextList = listMap[nextMap[scale]];
                            var selectList = [];
                            var xData = [];
                            var yData = [];
                            var yMax = 0;
                            for (var i = 0; i < nextList.length; i++) {
                                if (nextMap[scale] == "专业") {
                                    if (!(nextList[i].collegeid == preInfo.collegeid)) {
                                        continue;
                                    }
                                    selectList.push(nextList[i]);
                                    if (nextList[i].college.majorname == null) {
                                        xData.push(nextList[i].college.majorid);
                                    } else {
                                        xData.push(nextList[i].college.majorname);
                                    }
                                } else if (nextMap[scale] == "年级") {
                                    if (!((nextList[i].collegeid == preInfo.collegeid) & (nextList[i].majorid == preInfo.majorid))) {
                                        continue;
                                    }
                                    selectList.push(nextList[i]);
                                    xData.push(nextList[i].grade + "级");
                                }

                                var percentage = parseFloat(nextList[i].percentage) * 100;
                                yData.push(parseInt(percentage));
                                if (percentage > yMax) {
                                    yMax = percentage;
                                }
                            }
                            yMax = yMax + yMax * 0.1;
                            selectMap[nextMap[scale]] = selectList;
                            showCollegeChart(failurePercentageChart, xData, yData, yMax);
                            //显示选择该年
                        } else if (scale == "年级") {
                            collegeAnalysisOl.append('<li class="breadcrumb-item active" aria-current="page">' + aText + '</li>');
                            $('#collegeAnalysisOl li').last().prev().removeClass("active").removeAttr("aria-current").html('<a href="javascript:;">' + scale + '</a>');
                            $('#collegeAnalysisOl li').last().prev().find('a').on('click', function () {
                                $('#dataShowDiv').hide();
                                $('#studentCourseDiv').hide();
                                var aList = selectMap[scale];
                                var xData = [];
                                var yData = [];
                                var yMax = 0;
                                $('#studentListDiv').removeClass("col-lg-8");
                                $('#attentionDiv').remove();
                                $('#studentListDiv').addClass("col-lg-12");
                                if (aList[0].college.majorname == null) {
                                    ajaxShowCollegeAnalysis("专业", preInfo, aList[0].college.collegename + aList[0].college.majorid);
                                } else {
                                    ajaxShowCollegeAnalysis("专业", preInfo, aList[0].college.collegename + aList[0].college.majorname);
                                }
                                for (var i = 0; i < aList.length; i++) {
                                    xData.push(aList[i].grade + "级");
                                    var percentage = parseFloat(aList[i].percentage) * 100;
                                    yData.push(parseInt(percentage));
                                    if (percentage > yMax) {
                                        yMax = percentage;
                                    }
                                }
                                yMax = yMax + yMax * 0.1;
                                showCollegeChart(failurePercentageChart, xData, yData, yMax);
                                $('#courseDetailDiv').hide();
                                $('#notPassDiv').hide();
                                ajaxShowCourseInMajor(preInfo);
                                //后面的都删掉
                                $(this).parent().nextAll().remove();
                                var aText = $(this).text();
                                $(this).parent().html(aText);
                            });
                        } else {
                            var preInfo = selectMap["年级"][params.dataIndex];
                            $('#collegeAnalysisOl li').last().text(preInfo.grade + "级");
                        }
                    });
                } else if (data.code == 200) {
                    $.Toast("查询失败", data.msg, "warning", {
                        stack: true,
                        has_icon: true,
                        has_close_btn: false,
                        fullscreen: false,
                        width: 400,
                        spacing: 20,
                        timeout: 3000,
                        border_radius: 8,
                        sticky: false,
                        position_class: "toast-top-right",
                        has_progress: false,
                        rtl: false
                    });
                }
            }
        });
        $('#scoreAnalysis').on('shown.bs.tab', function (e) {
            attentionListTable.draw();
            ascendListTable.draw();
        });
    });
</script>
</body>

</html>
