<%--
  Created by IntelliJ IDEA.
  User: XipengCao
  Date: 2019/2/21
  Time: 10:29
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
    <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"/>
    <link href="static/vendor/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="static/vendor/DataTables/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/vendor/jqueryToast/css/toast.style.css">
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
        <li class="nav-item">
            <a class="nav-link" href="<%=path%>/counselor/analysis">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>成绩分析</span>
            </a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">
        <li class="nav-item active">
            <a class="nav-link" href="javascript:;">
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
                <div class="align-items-stretch">
                    <div class="col-lg-12 mb-4">
                        <!-- Basic Card Example -->
                        <div class="card border-0 shadow mb-4">
                            <div class="card-header border-0 py-3">
                                <h6 id="baseTitle"
                                    class="m-0 font-weight-bold text-primary">${sessionScope.counselor.college.collegename}${sessionScope.counselor.college.majorname}课程总览</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12 mb-4">
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
                                                <div class="form-inline">
                                                    <label>&emsp;选择学期：
                                                        <select class="custom-select" id="termSelect">
                                                        </select>
                                                    </label>
                                                </div>
                                                <label>
                                                    <h6 class="card-text">
                                                        &emsp;鼠标滚轮滑动缩放图表。
                                                    </h6>
                                                </label>
                                                <%--<i class="far fa-question-circle" data-toggle="tooltip"--%>
                                                <%--data-placement="right"--%>
                                                <%--title="每课成绩将与同课程学生成绩对比，如果高于所有学生成绩的上四分位数，则成绩显示为绿色，即优异，如果低于下四分位数或未及格，则成绩显示为红色，需要注意！"></i>--%>
                                                <div id="courseChart" class="col-lg-12"
                                                     style="height:600px;"></div>
                                            </div>
                                            <div class="tab-pane fade" id="table-div" role="tabpanel"
                                                 aria-labelledby="table-tab">
                                                <div class="table-responsive">
                                                    <table id="collegeCourseTable"
                                                           class="table display table-hover"
                                                           width="100%" cellpadding="0">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">课程名</th>
                                                            <th scope="col">学年</th>
                                                            <th scope="col">学期</th>
                                                            <th scope="col">学分</th>
                                                            <th scope="col">平均分</th>
                                                            <th scope="col">挂科率</th>
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
                                <div id="courseDetailDiv" class="row">
                                    <div class="col-lg-12 mb-4">
                                        <div class="card shadow">
                                            <div class="card-header  border-0 py-3">
                                                <div class="row  form-inline">
                                                    <label>
                                                        <h6 id="courseDetailLabel" class="m-0 font-weight-bold">
                                                            课程详情
                                                        </h6>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table id="studentCourseTable"
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
<script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="static/vendor/DataTables/datatables.min.js"></script>
<script src="static/vendor/jqueryToast/js/toast.script.js"></script>
<!-- Custom scripts for all pages-->
<script src="static/js/sb-admin-2.min.js"></script>
<script src="static/js/showCharts.js"></script>

<script src="static/vendor/echarts/echarts.min.js"></script>
<script src="static/vendor/echarts/theme/walden.js"></script>
<script type="text/javascript">
    var courseChart;
    var studentCourseTable;
    var collegeCourseTable;
    var collegeCourseList = [];
    var notPassTable;

    function showChart(courseChart, collegeCourseList, yearTerm, rollinYear) {
        var select = yearTerm.split('+');
        var xData = [];
        var meanData = [];
        var failureData = [];
        var selectCollegeCourseList = [];
        for (var i = 0; i < collegeCourseList.length; i++) {
            var yearStr = collegeCourseList[i].year;
            var year = parseInt(yearStr.substring(0, 4));
            if (year < rollinYear) {
                continue;
            }
            if (!(year == parseInt(select[0]) && collegeCourseList[i].term == select[1])) {
                continue;
            }
            xData.push(collegeCourseList[i].coursename);
            meanData.push(parseInt(collegeCourseList[i].mean));
            failureData.push(((parseFloat(collegeCourseList[i].failurenum) / parseFloat(collegeCourseList[i].studentnum)) * 100).toFixed(2));
            selectCollegeCourseList.push(collegeCourseList[i]);
        }
        showCollegeCourseChart(courseChart, selectCollegeCourseList, xData, meanData, failureData);

    }

    function ajaxShowCourseDetail(url, collegeCourseInfo) {
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        var basepath = $('base').attr('href');
        $.ajax({
            url: url,
            async: true,
            cache: true,
            type: "post",
            dataType: 'json',
            data: {collegeCourseInfo: JSON.stringify(collegeCourseInfo)},
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
                    $('#courseDetailLabel').text(collegeCourseInfo.coursename + '课程详情-' + collegeCourseInfo.year + term[collegeCourseInfo.term]);
                    studentCourseTable.clear();
                    studentCourseTable.rows.add(tableList).nodes().to$().attr({
                        "data-toggle": "tooltip",
                        "title": "点击查看详情"
                    });
                    studentCourseTable.draw();
                    $('[data-toggle="tooltip"]').tooltip();
                    $('#studentCourseTable tbody').off('click').on('click', 'tr', function () {
                        var rowIndex = studentCourseTable.row(this).index();
                        var studentCourseInfo = studentCourseList[rowIndex];
                        var modal = $('#courseDetailModal');
                        var url = basepath + 'counselor/courseDetail';
                        ajaxShowModal(modal, studentCourseInfo, url);
                    });
                    if (notPassTableList.length > 0) {
                        $('#notPassDiv').show();
                        $('#notPassLabel').text(collegeCourseInfo.coursename + '课程尚未通过学生名单');
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
                            var url = basepath + 'counselor/courseDetail';
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

    function showCollegeCourseChart(chart, selectCollegeCourseList, xData, meanData, failureData) {
        var colors = ['#5793f3', '#d14a61', '#675bba'];
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        var option = {
            color: colors,

            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                }
            },
            grid: {
                right: '20%'
            },
            toolbox: {
                feature: {
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            legend: {
                data: ['平均分', '挂科率']
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    //课程名
                    data: xData
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '平均分',
                    min: 0,
                    max: 100,
                    position: 'left',
                    axisLine: {
                        lineStyle: {
                            color: colors[0]
                        }
                    },
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                {
                    type: 'value',
                    name: '挂科率',
                    min: 0,
                    max: 100,
                    position: 'right',
                    axisLine: {
                        lineStyle: {
                            color: colors[1]
                        }
                    },
                    axisLabel: {
                        formatter: '{value}%'
                    }
                },
            ],
            dataZoom: [
                {
                    type: 'inside'
                }
            ],
            series: [
                {
                    name: '平均分',
                    type: 'bar',
                    data: meanData
                },
                {
                    name: '挂科率',
                    type: 'bar',
                    yAxisIndex: 1,
                    data: failureData
                },
            ]
        };
        chart.clear();
        chart.setOption(option);
        chart.off('click');
        chart.on('click', function (params) {
            // console.log(xData[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            // chart.dispatchAction({
            //     type: 'dataZoom',
            //     startValue: xData[Math.max(params.dataIndex - zoomSize / 2, 0)],
            //     endValue: xData[Math.min(params.dataIndex + zoomSize / 2, yData.length - 1)]
            // });
            var collegeCourseInfo = selectCollegeCourseList[params.dataIndex]
            //获取该课程详情并显示courseDetailDiv
            var basepath = $('base').attr('href');
            var url = basepath + 'counselor/getStudentInfoInCourse';
            ajaxShowCourseDetail(url, collegeCourseInfo);
        });
    }

    function rowSelectEvent(table, collegeCourseList, url) {
        $('#collegeCourseTable tbody').off('click').on('click', 'tr', function () {
            var rowIndex = table.row(this).index();
            var collegeCourseInfo = collegeCourseList[rowIndex];
            ajaxShowCourseDetail(url, collegeCourseInfo);
        });
    }

    function showCollegeCourseTable(table, collegeCourseList, termScale) {
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        var tableData = [];
        var basepath = $('base').attr('href');
        var url = basepath + 'counselor/getStudentInfoInCourse';
        if (termScale == "") {
            for (var i = 0; i < collegeCourseList.length; i++) {
                tableData.push([collegeCourseList[i].coursename, collegeCourseList[i].year,
                    term[collegeCourseList[i].term], collegeCourseList[i].credit,
                    collegeCourseList[i].mean, ((parseFloat(collegeCourseList[i].failurenum) / parseFloat(collegeCourseList[i].studentnum)) * 100).toFixed(2)]);
            }
            rowSelectEvent(table, collegeCourseList, url);
        } else {
            var ssList = termScale.split('+');
            var cList = [];
            for (var i = 0; i < collegeCourseList.length; i++) {
                if (!(collegeCourseList[i].year == ssList[0] && collegeCourseList[i].term == ssList[1])) {
                    continue;
                }
                cList.push(collegeCourseList[i]);
                tableData.push([collegeCourseList[i].coursename, collegeCourseList[i].year,
                    term[collegeCourseList[i].term], collegeCourseList[i].credit,
                    collegeCourseList[i].mean, ((parseFloat(collegeCourseList[i].failurenum) / parseFloat(collegeCourseList[i].studentnum)) * 100).toFixed(2)]);
            }
            rowSelectEvent(table, cList, url);
        }

        table.clear();
        table.rows.add(tableData).nodes().to$().attr({
            "data-toggle": "tooltip",
            "title": "点击查看详情"
        });
        table.draw();
        //初始化tooltip
        $('[data-toggle="tooltip"]').tooltip();

    }

    $(document).ready(function (e) {
        var basepath = $('base').attr('href');
        courseChart = echarts.init(document.getElementById('courseChart'), 'walden');
        window.onresize = function () {
            courseChart.resize();
        };
        $('#courseDetailDiv').hide();
        $('#notPassDiv').hide();
        var classList =${sessionScope.classList};
        var rollinYear = parseInt(classList[0].classid.substring(0, 4));
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        collegeCourseTable = $('#collegeCourseTable').DataTable({
            lengthChange: false,
            paging: true,
            order: [[5, "desc"]],
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
        studentCourseTable = $('#studentCourseTable').DataTable({
            lengthChange: false,
            paging: true,
            order: [[4, "asc"]],
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
        notPassTable = $('#notPassTable').DataTable({
            lengthChange: false,
            paging: true,
            //order: [[4, "asc"]],
            ordering: false,
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
        $.ajax({
            url: basepath + 'counselor/allCourseInfo',
            async: true,
            cache: true,
            type: "post",
            dataType: 'json',
            data: {},
            success: function (data) {
                if (data.code == 100) {
                    collegeCourseList = data.content.collegeCourseList;
                    var termSelect = $('#termSelect');
                    termSelect.html('');
                    //表格选择不同学期
                    $('#collegeCourseTable_wrapper > div:nth-child(1) > div:nth-child(1)').append('<div id="collegeCourseTable_length"></div>')
                    $('#collegeCourseTable_length').attr('class', 'form-inline');
                    $('#collegeCourseTable_length').parent().parent().attr('class', 'form-inline');
                    $('#collegeCourseTable_length').html('<label>选择学期：</label>' +
                        '                                                                <select class="custom-select" id="tableTermSelect">' +
                        '                                                                    <option selected></option>' +
                        '                                                                </select>');
                    var tableTermSelect = $('#tableTermSelect');
                    var yearTermList = data.content.yearTermList;
                    for (var i = 0; i < yearTermList.length; i++) {
                        var yearTerm = yearTermList[i].split('+');
                        termSelect.append("<option value=\'" + yearTermList[i] + "\'>" + yearTerm[0] + term[yearTerm[1]] + "</option>");
                        tableTermSelect.append("<option value=\'" + yearTermList[i] + "\'>" + yearTerm[0] + term[yearTerm[1]] + "</option>");
                    }
                    showChart(courseChart, collegeCourseList, yearTermList[0], rollinYear);
                    showCollegeCourseTable(collegeCourseTable, collegeCourseList, "");

                    $('#termSelect').change(function () {
                        var select = $(this).children('option:selected').val();
                        showChart(courseChart, collegeCourseList,select, rollinYear);
                    });
                    $('#tableTermSelect').change(function () {
                        var ss = $(this).children('option:selected').val();
                        showCollegeCourseTable(collegeCourseTable, collegeCourseList, ss);
                    });
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
        $('#pic-tab').on('shown.bs.tab', function (e) {
            courseChart.resize();
            $('#courseDetailDiv').hide();
            $('#notPassDiv').hide();
        });
        $('#table-tab').on('shown.bs.tab', function (e) {
            $('#courseDetailDiv').hide();
            $('#notPassDiv').hide();
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
