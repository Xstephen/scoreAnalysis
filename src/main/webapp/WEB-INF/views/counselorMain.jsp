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
        <li class="nav-item">
            <a class="nav-link" href="<%=path%>/counselor/courseAnalysis">
                <i class="fas fa-fw fa-book"></i>
                <span>课程分析</span>
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
                        <label>${sessionScope.counselor.counselorname},您好！</label>
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

                        <!-- Basic Card Example -->
                        <div class="card border-0 shadow mb-4">
                            <div class="card-header border-0 py-3">
                                <h6 id="baseTitle" class="m-0 font-weight-bold text-primary">学生成绩总览</h6>
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
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-8 mb-4">
                                        <div class="card shadow">
                                            <div class="card-header border-0 py-3 form-inline">
                                                <h6 id="rankTitle" class="m-0 font-weight-bold">学生排名</h6>
                                                <i class="far fa-question-circle" data-toggle="tooltip"
                                                   data-placement="right"
                                                   title="显示学生各学期智育成绩排名，默认显示截至当前学期总排名"></i>
                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
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
                                                                加权成绩
                                                            </th>
                                                            <th>
                                                                排名
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
                                    <div class="col-lg-4 mb-4">
                                        <div id="attentionListCard" class="card shadow">
                                            <div class="card-header border-0 py-3 form-inline">
                                                <h6 class="m-0 font-weight-bold">挂科较多学生列表</h6>
                                                <i class="far fa-question-circle" data-toggle="tooltip"
                                                   data-placement="right"
                                                   title="截至当前学期，挂科次数大于5门的学生列表。"></i>
                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table id="attentionList" class="table table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>
                                                                学号
                                                            </th>
                                                            <th>
                                                                姓名
                                                            </th>
                                                            <th>
                                                                挂科数
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="ascendListCard" class="card shadow">
                                            <div class="card-header border-0 py-3 form-inline">
                                                <h6 class="m-0 font-weight-bold">成绩上升学生名单</h6>
                                                <i class="far fa-question-circle" data-toggle="tooltip"
                                                   data-placement="right"
                                                   title="截至当前学期，每个学期排名都上升的学生列表。"></i>
                                            </div>
                                            <div class="card-body">
                                                <div id="ascendListDiv" class="table-responsive">
                                                    <table id="ascendList" class="table table-hover">
                                                        <thead>
                                                        <tr>
                                                            <th>
                                                                学号
                                                            </th>
                                                            <th>
                                                                姓名
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

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
                                                    <div id="termChart" class="col-lg-6" style="height:300px;"></div>
                                                    <div id="rankChart" class="col-lg-6" style="height:300px;"></div>
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
                                                        <a class="nav-link active" id="pic-tab" data-toggle="tab"
                                                           href="#pic-div" role="tab" aria-controls="pic-div"
                                                           aria-selected="true">统计图</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="table-tab" data-toggle="tab"
                                                           href="#table-div" role="tab" aria-controls="table-div"
                                                           aria-selected="false">表格</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content" id="tabContent">
                                                    <div class="tab-pane fade show active" id="pic-div" role="tabpanel"
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
                        </div>
                    </div>
                    <!-- /.container-fluid -->
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

<script src="static/vendor/echarts/echarts.min.js"></script>
<script src="static/vendor/echarts/theme/walden.js"></script>
<script type="text/javascript">
    var list = [];
    var courseList = [];
    var termChart;
    var rankChart;
    var courseChart;
    var studentCourseTable;
    var studentListTable;
    var attentionListTable;
    var ascendListTable;

    function ajaxShowCharts(studentid, studentname, basepath, length) {
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        $.ajax({
            url: basepath + 'counselor/studentAnalysis',
            async: true,
            cache: true,
            type: "post",
            dataType: 'json',
            data: {
                studentId: studentid
            },
            success: function (data) {
                if (data.code == 100) {
                    list = data.content.list;
                    courseList = data.content.studentCourseList;
                    $('#dataShowDiv').show();
                    $('#studentCourseDiv').show();
                    $('#studentCourseCard > div.card-header.border-0.py-3 > div > label > h6').html(studentname + '同学各课程成绩总览&emsp;');
                    var yearSelectValue = $('#yearSelectMain').val();
                    var termSelectValue = $('#termSelectMain').val();
                    if (yearSelectValue != "") {
                        showChart(termChart, rankChart, list, 'year');
                        $('#dataShowCard > div.card-header.border-0.py-3 > div > label > h6').html(studentname + '同学各学年成绩总览&emsp;年级总人数:' + length + ':&emsp;');
                        $('#selectScale').val('year');
                    } else {
                        showChart(termChart, rankChart, list, 'term');
                        $('#dataShowCard > div.card-header.border-0.py-3 > div > label > h6').html(studentname + '同学各学期成绩总览&emsp;年级总人数:' + length + ':&emsp;');
                        $('#selectScale').val('term');
                    }
                    $("#selectScale").change(function () {
                        var ss = $(this).children('option:selected').val();
                        if (ss == "term") {
                            $('#dataShowCard > div.card-header.border-0.py-3 > div > label > h6').html(studentname + '同学各学期成绩总览&emsp;年级总人数:' + length + ':&emsp;');
                            showChart(termChart, rankChart, list, 'term');
                        } else if (ss == "year") {
                            $('#dataShowCard > div.card-header.border-0.py-3 > div > label > h6').html(studentname + '同学各学年成绩总览&emsp;年级总人数:' + length + ':&emsp;');
                            showChart(termChart, rankChart, list, 'year');
                        }
                    });
                    var url = basepath + 'counselor/courseDetail';
                    var termSelect = $('#termSelect');
                    termSelect.html('<option selected></option>');
                    //表格选择不同学期
                    $('#studentCourseTable_wrapper > div:nth-child(1) > div:nth-child(1)').append('<div id="studentCourseTable_length"></div>')
                    $('#studentCourseTable_length').attr('class', 'form-inline');
                    $('#studentCourseTable_length').parent().parent().attr('class', 'form-inline');
                    $('#studentCourseTable_length').html('<label>选择学期：</label>' +
                        '                                                                <select class="custom-select" id="tableTermSelect">' +
                        '                                                                    <option selected></option>' +
                        '                                                                </select>');
                    var tableTermSelect = $('#tableTermSelect');
                    for (var i = 0; i < list.length; i++) {
                        if (list[i].term == '0') {
                            continue;
                        }
                        var termvalue = list[i].year + '+' + list[i].term;
                        var termtext = list[i].year + term[list[i].term];
                        termSelect.append("<option value=\'" + termvalue + "\'>" + termtext + "</option>");
                        tableTermSelect.append("<option value=\'" + termvalue + "\'>" + termtext + "</option>");
                    }
                    termSelect.val(termSelectValue);
                    tableTermSelect.val(termSelectValue);
                    showStudentCourseChart(courseChart, courseList, termSelectValue, url);
                    showStudentCourseTable(studentCourseTable, courseList, termSelectValue, url);

                    $("#termSelect").change(function () {
                        var ss = $(this).val();
                        showStudentCourseChart(courseChart, courseList, ss, url);
                    });
                    $('#tableTermSelect').change(function () {
                        var ss = $(this).children('option:selected').val();
                        showStudentCourseTable(studentCourseTable, courseList, ss, url);
                    });
                    termChart.resize();
                    rankChart.resize();
                    courseChart.resize();
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

    function yearSelectMainChange(studentList, ss) {
        $('#dataShowDiv').hide();
        $('#studentCourseDiv').hide();
        var studentListData = [];
        var ascendList = [];
        var attentionList = [];
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        if (ss == "") {
            //修改标题显示
            $('#baseTitle').text("学生成绩总览");
            $('#rankTitle').text("学生排名");
            $('#attentionListCard i').attr('data-original-title', "截至当前学期，挂科次数大于5门的学生列表。");
            $('#ascendListCard i').attr('data-original-title', "截至当前学期，每个学期排名都上升的学生列表。");
            ascendListTable.destroy(true);
            $('#ascendListDiv').html('<table id="ascendList" class="table table-hover">\n' +
                '                                                        <thead>\n' +
                '                                                        <tr>\n' +
                '                                                            <th>\n' +
                '                                                                学号\n' +
                '                                                            </th>\n' +
                '                                                            <th>\n' +
                '                                                                姓名\n' +
                '                                                            </th>\n' +
                '                                                        </tr>\n' +
                '                                                        </thead>\n' +
                '                                                    </table>');
            ascendListTable = $('#ascendList').DataTable({
                lengthChange: false,
                paging: false,
                searching: false,
                autoWidth: true,
                info: false,
                scrollY: "200px",
                scrollCollapse: true,
                ordering: false,
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
            for (var i = 0; i < studentList.length; i++) {
                studentListData.push([studentList[i].studentid, studentList[i].studentname, studentList[i].weightscore, studentList[i].studentrank]);
                if (parseInt(studentList[i].failuresum) > 5) {
                    attentionList.push([studentList[i].studentid, studentList[i].studentname, studentList[i].failuresum]);
                }
                if (parseInt(studentList[i].studentascend) == 1) {
                    ascendList.push([studentList[i].studentid, studentList[i].studentname]);
                }

            }
            studentListTable.clear();
            studentListTable.rows.add(studentListData).nodes().to$().attr({
                "data-toggle": "tooltip",
                "title": "点击查看详情"
            });
            studentListTable.draw();
            attentionListTable.clear();
            attentionListTable.rows.add(attentionList).nodes().to$().attr({
                "data-toggle": "tooltip",
                "title": "点击查看详情"
            });
            attentionListTable.draw();
            ascendListTable.clear();
            ascendListTable.rows.add(ascendList).nodes().to$().attr({
                "data-toggle": "tooltip",
                "title": "点击查看详情"
            });
            ascendListTable.draw();
            $('#ascendList tbody').off("click").on('click', 'tr', function () {
                var studentid = $(this).find('td:first').text();
                var studentname = $(this).find('td:first').next().text();
                var basepath = $('base').attr('href');
                ajaxShowCharts(studentid, studentname, basepath, studentList.length);
            });
        } else {
            //修改标题显示
            $('#baseTitle').text("学生成绩总览-" + ss + "学年");
            $('#rankTitle').text(ss + "学年学生排名");
            var year = ss;
            $('#attentionListCard i').attr('data-original-title', year + "学年存在挂科的学生名单。");
            $('#ascendListCard i').attr('data-original-title', year + "学年排名较上学期排名上升的学生名单。");
            var basepath = $('base').attr('href');
            var yearStudentList = [];
            $.ajax({
                url: basepath + 'counselor/yearStudentAnalysisInfo',
                async: false,
                cache: true,
                type: "post",
                dataType: 'json',
                data: {year: year},
                success: function (data) {
                    if (data.code == 100) {
                        //成功
                        // var tbody = $('#studentList tbody');
                        yearStudentList = data.content.yearStudentList;
                        for (var i = 0; i < yearStudentList.length; i++) {
                            studentListData.push([yearStudentList[i].studentid, yearStudentList[i].student.studentname, yearStudentList[i].weightscore, yearStudentList[i].studentrank]);
                            if (parseInt(yearStudentList[i].failurenum) > 0) {
                                attentionList.push([yearStudentList[i].studentid, yearStudentList[i].student.studentname, yearStudentList[i].failurenum]);
                            }
                            if (parseInt(yearStudentList[i].scorechange) < -10) {
                                ascendList.push([yearStudentList[i].studentid, yearStudentList[i].student.studentname, '↑' + (-parseInt(yearStudentList[i].scorechange))]);
                            }
                        }
                        ascendListTable.destroy(true);
                        $('#ascendListDiv').html('<table id="ascendList" class="table table-hover">\n' +
                            '                                                        <thead>\n' +
                            '                                                        <tr>\n' +
                            '                                                            <th>\n' +
                            '                                                                学号\n' +
                            '                                                            </th>\n' +
                            '                                                            <th>\n' +
                            '                                                                姓名\n' +
                            '                                                            </th>\n' +
                            '                                                            <th>\n' +
                            '                                                                上升名次\n' +
                            '                                                            </th>\n' +
                            '                                                        </tr>\n' +
                            '                                                        </thead>\n' +
                            '                                                    </table>');
                        ascendListTable = $('#ascendList').DataTable({
                            lengthChange: false,
                            paging: false,
                            searching: false,
                            autoWidth: true,
                            info: false,
                            scrollY: "200px",
                            scrollCollapse: true,
                            order: [[2, "desc"]],
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
                        studentListTable.clear();
                        studentListTable.rows.add(studentListData).nodes().to$().attr({
                            "data-toggle": "tooltip",
                            "title": "点击查看详情"
                        });
                        studentListTable.draw();
                        attentionListTable.clear();
                        attentionListTable.rows.add(attentionList).nodes().to$().attr({
                            "data-toggle": "tooltip",
                            "title": "点击查看详情"
                        });
                        attentionListTable.draw();
                        ascendListTable.clear();
                        ascendListTable.rows.add(ascendList).nodes().to$().attr({
                            "data-toggle": "tooltip",
                            "title": "点击查看详情"
                        });
                        ascendListTable.draw();
                        $('#ascendList tbody').off("click").on('click', 'tr', function () {
                            var studentid = $(this).find('td:first').text();
                            var studentname = $(this).find('td:first').next().text();
                            var basepath = $('base').attr('href');
                            ajaxShowCharts(studentid, studentname, basepath, studentList.length);
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
        }
    }

    function termSelectMainChange(studentList, ss) {
        $('#dataShowDiv').hide();
        $('#studentCourseDiv').hide();
        var studentListData = [];
        var ascendList = [];
        var attentionList = [];
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        if (ss == "") {
            //修改标题显示
            $('#baseTitle').text("学生成绩总览");
            $('#rankTitle').text("学生排名");
            $('#attentionListCard i').attr('data-original-title', "截至当前学期，挂科次数大于5门的学生列表。");
            $('#ascendListCard i').attr('data-original-title', "截至当前学期，每个学期排名都上升的学生列表。");
            ascendListTable.destroy(true);
            $('#ascendListDiv').html('<table id="ascendList" class="table table-hover">\n' +
                '                                                        <thead>\n' +
                '                                                        <tr>\n' +
                '                                                            <th>\n' +
                '                                                                学号\n' +
                '                                                            </th>\n' +
                '                                                            <th>\n' +
                '                                                                姓名\n' +
                '                                                            </th>\n' +
                '                                                        </tr>\n' +
                '                                                        </thead>\n' +
                '                                                    </table>');
            ascendListTable = $('#ascendList').DataTable({
                lengthChange: false,
                paging: false,
                searching: false,
                autoWidth: true,
                info: false,
                scrollY: "200px",
                scrollCollapse: true,
                ordering: false,
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
            for (var i = 0; i < studentList.length; i++) {
                studentListData.push([studentList[i].studentid, studentList[i].studentname, studentList[i].weightscore, studentList[i].studentrank]);
                if (parseInt(studentList[i].failuresum) > 5) {
                    attentionList.push([studentList[i].studentid, studentList[i].studentname, studentList[i].failuresum]);
                }
                if (parseInt(studentList[i].studentascend) == 1) {
                    ascendList.push([studentList[i].studentid, studentList[i].studentname]);
                }

            }

            studentListTable.clear();
            studentListTable.rows.add(studentListData).nodes().to$().attr({
                "data-toggle": "tooltip",
                "title": "点击查看详情"
            });
            studentListTable.draw();
            attentionListTable.clear();
            attentionListTable.rows.add(attentionList).nodes().to$().attr({
                "data-toggle": "tooltip",
                "title": "点击查看详情"
            });
            attentionListTable.draw();
            ascendListTable.clear();
            ascendListTable.rows.add(ascendList).nodes().to$().attr({
                "data-toggle": "tooltip",
                "title": "点击查看详情"
            });
            ascendListTable.draw();
            $('#ascendList tbody').off("click").on('click', 'tr', function () {
                var studentid = $(this).find('td:first').text();
                var studentname = $(this).find('td:first').next().text();
                var basepath = $('base').attr('href');
                ajaxShowCharts(studentid, studentname, basepath, studentList.length);
            });
        } else {
            var yearTerm = ss.split('+');
            //修改标题显示
            $('#baseTitle').text("学生成绩总览-" + yearTerm[0] + term[yearTerm[1]]);
            $('#rankTitle').text(yearTerm[0] + term[yearTerm[1]] + "学生排名");
            $('#attentionListCard i').attr('data-original-title', yearTerm[0] + term[yearTerm[1]] + "学期存在挂科的学生名单。");
            $('#ascendListCard i').attr('data-original-title', yearTerm[0] + term[yearTerm[1]] + "排名较上学期排名上升的学生名单。");
            var basepath = $('base').attr('href');
            var termStudentList = [];
            $.ajax({
                url: basepath + 'counselor/termStudentAnalysisInfo',
                async: false,
                cache: true,
                type: "post",
                dataType: 'json',
                data: {
                    year: yearTerm[0],
                    term: yearTerm[1]
                },
                success: function (data) {
                    if (data.code == 100) {
                        //成功
                        // var tbody = $('#studentList tbody');
                        termStudentList = data.content.termStudentList;
                        for (var i = 0; i < termStudentList.length; i++) {
                            studentListData.push([termStudentList[i].studentid, termStudentList[i].student.studentname, termStudentList[i].weightscore, termStudentList[i].studentrank]);
                            if (parseInt(termStudentList[i].failurenum) > 0) {
                                attentionList.push([termStudentList[i].studentid, termStudentList[i].student.studentname, termStudentList[i].failurenum]);
                            }
                            if (parseInt(termStudentList[i].scorechange) < -10) {
                                ascendList.push([termStudentList[i].studentid, termStudentList[i].student.studentname, '↑' + (-parseInt(termStudentList[i].scorechange))]);
                            }
                        }
                        ascendListTable.destroy(true);
                        $('#ascendListDiv').html('<table id="ascendList" class="table table-hover">\n' +
                            '                                                        <thead>\n' +
                            '                                                        <tr>\n' +
                            '                                                            <th>\n' +
                            '                                                                学号\n' +
                            '                                                            </th>\n' +
                            '                                                            <th>\n' +
                            '                                                                姓名\n' +
                            '                                                            </th>\n' +
                            '                                                            <th>\n' +
                            '                                                                上升名次\n' +
                            '                                                            </th>\n' +
                            '                                                        </tr>\n' +
                            '                                                        </thead>\n' +
                            '                                                    </table>');
                        ascendListTable = $('#ascendList').DataTable({
                            lengthChange: false,
                            paging: false,
                            searching: false,
                            autoWidth: true,
                            info: false,
                            scrollY: "200px",
                            scrollCollapse: true,
                            order: [[2, "desc"]],
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
                        studentListTable.clear();
                        studentListTable.rows.add(studentListData).nodes().to$().attr({
                            "data-toggle": "tooltip",
                            "title": "点击查看详情"
                        });
                        studentListTable.draw();
                        attentionListTable.clear();
                        attentionListTable.rows.add(attentionList).nodes().to$().attr({
                            "data-toggle": "tooltip",
                            "title": "点击查看详情"
                        });
                        attentionListTable.draw();
                        ascendListTable.clear();
                        ascendListTable.rows.add(ascendList).nodes().to$().attr({
                            "data-toggle": "tooltip",
                            "title": "点击查看详情"
                        });
                        ascendListTable.draw();
                        $('#ascendList tbody').off("click").on('click', 'tr', function () {
                            var studentid = $(this).find('td:first').text();
                            var studentname = $(this).find('td:first').next().text();
                            var basepath = $('base').attr('href');
                            ajaxShowCharts(studentid, studentname, basepath, studentList.length);
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
        }
    }

    $(document).ready(function (e) {
        termChart = echarts.init(document.getElementById('termChart'), 'walden');
        rankChart = echarts.init(document.getElementById('rankChart'), 'walden');
        $('#dataShowDiv').hide();
        courseChart = echarts.init(document.getElementById('courseChart'), 'walden');
        $('#studentCourseDiv').hide();
        window.onresize = function () {
            termChart.resize();
            rankChart.resize();
            courseChart.resize();
        };
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        var basepath = $('base').attr('href');
        var serviceInfo = '${info}';
        if (serviceInfo != "") {
            $.Toast("提示", serviceInfo, "warning", {
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
        var classList =${sessionScope.classList};
        var title = "";
        for (var i = 0; i < classList.length; i++) {
            title += classList[i].classid + '<br\>'
        }
        $('#classList').attr("title", title);
        //初始化tooltip
        $('[data-toggle="tooltip"]').tooltip();
        studentListTable = $('#studentList').DataTable({
            lengthChange: false,
            paging: true,
            order: [[3, "asc"]],
            scrollCollapse: true,
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
        attentionListTable = $('#attentionList').DataTable({
            lengthChange: false,
            paging: false,
            searching: false,
            autoWidth: true,
            info: false,
            scrollY: "200px",
            scrollCollapse: true,
            order: [[2, "desc"]],
            destroy:true,
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
        ascendListTable = $('#ascendList').DataTable({
            lengthChange: false,
            paging: false,
            searching: false,
            autoWidth: true,
            info: false,
            scrollY: "200px",
            scrollCollapse: true,
            ordering: false,
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
        var studentList = [];
        var termList = [];
        var yearList = [];
        //查询所有学生信息
        $.ajax({
            url: basepath + 'counselor/allStudentInfo',
            async: false,
            cache: true,
            type: "post",
            dataType: 'json',
            data: {},
            success: function (data) {
                if (data.code == 100) {
                    //成功
                    // var tbody = $('#studentList tbody');
                    studentList = data.content.studentList;
                    yearList = data.content.yearList;
                    termList = data.content.yearTermList;
                    // for (var i = 0; i < studentList.length; i++) {
                    //     tbody.append('<tr data-toggle="tooltip" title="点击查看详情">' +
                    //         '<td>' + studentList[i].studentid + '</td>' +
                    //         '<td>' + studentList[i].studentname + '</td>' +
                    //         '<td>' + studentList[i].weightscore + '</td>' +
                    //         '<td>' + studentList[i].studentrank + '</td>' +
                    //         '</tr>'
                    //     )
                    // }
                    var studentListData = [];
                    var ascendList = [];
                    var attentionList = [];
                    for (var i = 0; i < studentList.length; i++) {
                        studentListData.push([studentList[i].studentid, studentList[i].studentname, studentList[i].weightscore, studentList[i].studentrank]);
                        if (parseInt(studentList[i].failuresum) > 5) {
                            attentionList.push([studentList[i].studentid, studentList[i].studentname, studentList[i].failuresum]);
                        }
                        if (parseInt(studentList[i].studentascend) == 1) {
                            ascendList.push([studentList[i].studentid, studentList[i].studentname]);
                        }

                    }
                    studentListTable.clear();
                    studentListTable.rows.add(studentListData).nodes().to$().attr({
                        "data-toggle": "tooltip",
                        "title": "点击查看详情"
                    });
                    studentListTable.draw();
                    attentionListTable.clear();
                    attentionListTable.rows.add(attentionList).nodes().to$().attr({
                        "data-toggle": "tooltip",
                        "title": "点击查看详情"
                    });
                    attentionListTable.draw();
                    ascendListTable.clear();
                    ascendListTable.rows.add(ascendList).nodes().to$().attr({
                        "data-toggle": "tooltip",
                        "title": "点击查看详情"
                    });
                    ascendListTable.draw();
                    var yearSelectMain = $('#yearSelectMain');
                    yearSelectMain.html('<option selected></option>');
                    for (var i = 0; i < yearList.length; i++) {
                        yearSelectMain.append("<option value=\'" + yearList[i] + "\'>" + yearList[i] + "学年" + "</option>");
                    }
                    yearSelectMain.change(function () {
                        $('#termSelectMain').get(0).selectedIndex = 0;  //设置Select索引值为1的项选中
                        var ss = $(this).children('option:selected').val();
                        yearSelectMainChange(studentList, ss);
                    });
                    var termSelectMain = $('#termSelectMain');
                    termSelectMain.html('<option selected></option>');
                    for (var i = 0; i < termList.length; i++) {
                        var yearTerm = termList[i].split('+');
                        termSelectMain.append("<option value=\'" + termList[i] + "\'>" + yearTerm[0] + term[yearTerm[1]] + "</option>");
                    }
                    termSelectMain.change(function () {
                        $('#yearSelectMain').get(0).selectedIndex = 0;  //设置Select索引值为1的项选中
                        var ss = $(this).children('option:selected').val();
                        termSelectMainChange(studentList, ss);
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
        //初始化tooltip
        $('[data-toggle="tooltip"]').tooltip();
        //datatable初始化
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
        $('#studentList tbody').off("click").on('click', 'tr', function () {
            var studentid = $(this).find('td:first').text();
            var studentname = $(this).find('td:first').next().text();
            var basepath = $('base').attr('href');
            ajaxShowCharts(studentid, studentname, basepath, studentList.length);
        });
        $('#attentionList tbody').off("click").on('click', 'tr', function () {
            var studentid = $(this).find('td:first').text();
            var studentname = $(this).find('td:first').next().text();
            var basepath = $('base').attr('href');
            ajaxShowCharts(studentid, studentname, basepath, studentList.length);
        });
        $('#ascendList tbody').off("click").on('click', 'tr', function () {
            var studentid = $(this).find('td:first').text();
            var studentname = $(this).find('td:first').next().text();
            var basepath = $('base').attr('href');
            ajaxShowCharts(studentid, studentname, basepath, studentList.length);
        });
        $('#pic-tab').on('shown.bs.tab', function (e) {
            courseChart.resize();
        });
        $('#modalFClose').click(function () {
            $('#modalBody').html("");
        });
        $('#modalClose').click(function () {
            $('#modalBody').html("");
        });
    });
</script>
</body>

</html>
