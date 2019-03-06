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
    <link href="static/vendor/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="static/vendor/DataTables/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/vendor/jqueryToast/css/toast.style.css">
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
            <a class="nav-link"
               href="<%=path%>/student/info">
                <i class="far fa-address-card"></i>
                <span>个人信息</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">


        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item active">
            <a class="nav-link" href="<%=path%>/student/analysis">
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
                            <i class="fas fa-caret-down" style="font-size: 1rem;color: #4e73de;" ;></i>
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
                                <h6 class="m-0 font-weight-bold text-primary">个人成绩分析</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12 mb-4">
                                        <div class="card border-0 shadow">
                                            <div class="card-header border-0 py-3">
                                                <div class="row  form-inline">
                                                    <label>
                                                        <h6 id="studentAnalaysisLabel" class="m-0 font-weight-bold">
                                                            各学期成绩总览&emsp;年级总人数:${sessionScope.studentInfo.studentCountG}&emsp;</h6>
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
                                <div class="row">
                                    <div class="col-lg-12 mb-4">
                                        <div class="card border-0 shadow">
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
                                                                &emsp;点击或鼠标滚轮滑动缩放图表。(绿色表示成绩优异，蓝色表示成绩普通，红色表示成绩较差，需要注意!)
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
                                                            <table id="studentCourseTable" class="table display"
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
<script src="static/vendor/jqueryToast/js/toast.script.js"></script>
<!-- Core plugin JavaScript-->
<script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="static/vendor/DataTables/datatables.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="static/js/sb-admin-2.min.js"></script>
<script src="static/vendor/echarts/echarts.min.js"></script>
<script src="static/vendor/echarts/theme/walden.js"></script>
<script src="static/js/showCharts.js"></script>
<script type="text/javascript">
    function ajaxGetData(studentId) {
        var basepath = $('base').attr('href');
        var result = {};
        $.ajax({
            url: basepath + 'student/allAnalysis',
            async: false,
            cache: true,
            type: "post",
            dataType: 'json',
            data: {
                studentId: studentId
            },
            success: function (data) {
                if (data.code == 100) {
                    result = data.content;
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
        return result;
    }

    var termChart;
    var rankChart;
    var courseChart;
    var studentCourseTable;
    var list = [];
    var courseList = [];
    $(document).ready(function (e) {
        /**
         * 图表
         */
        termChart = echarts.init(document.getElementById('termChart'), 'walden');
        rankChart = echarts.init(document.getElementById('rankChart'), 'walden');
        courseChart = echarts.init(document.getElementById('courseChart'), 'walden');
        var studentId =${sessionScope.student.studentid};
        var content = ajaxGetData(studentId);
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        list = content.list;
        if(list){
        courseList = content.studentCourseList;
        showChart(termChart, rankChart, list, 'term');
        var basepath = $('base').attr('href');
        var url = basepath + '/student/courseDetail';
        showStudentCourseChart(courseChart, courseList, '', url);
        window.onresize = function () {
            termChart.resize();
            rankChart.resize();
            courseChart.resize();
        };
        /*
        表格
         */
        studentCourseTable = $('#studentCourseTable').DataTable({
            lengthChange: false,
            select: true,
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
        showStudentCourseTable(studentCourseTable, courseList, '', url);

        //表格选择不同学期
        $('#studentCourseTable_wrapper > div:nth-child(1) > div:nth-child(1)').append('<div id="studentCourseTable_length"></div>')
        $('#studentCourseTable_length').attr('class', 'form-inline');
        $('#studentCourseTable_length').append('<label>&emsp;选择学期：' +
            '                                                                <select class="custom-select" id="tableTermSelect">\n' +
            '                                                                    <option selected></option>\n' +
            '                                                                </select>\n' +
            '                                                            </label>');
        var termSelect = $('#termSelect');
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
        //初始化tooltip
        $('[data-toggle="tooltip"]').tooltip();
        $('#modalFClose').click(function () {
            $('#modalBody').html("");
        });
        $('#modalClose').click(function () {
            $('#modalBody').html("");
        });
        var studentCount=${sessionScope.studentInfo.studentCountG};
        $("#selectScale").change(function () {
            var ss = $(this).children('option:selected').val();
            if (ss == "term") {
                $('#studentAnalaysisLabel').html('各学期成绩总览&emsp;年级总人数:'+studentCount+'&emsp;');
                showChart(termChart, rankChart, list, 'term');
            } else if (ss == "year") {
                $('#studentAnalaysisLabel').html('各学年成绩总览&emsp;年级总人数:'+studentCount+'&emsp;');
                showChart(termChart, rankChart, list, 'year');
            }
        });
        $("#termSelect").change(function () {
            var ss = $(this).children('option:selected').val();
            showStudentCourseChart(courseChart, courseList, ss, url);
        });
        $('#tableTermSelect').change(function () {
            var ss = $(this).children('option:selected').val();
            showStudentCourseTable(studentCourseTable, courseList, ss, url);
        });
        }
    });

</script>
</body>

</html>
