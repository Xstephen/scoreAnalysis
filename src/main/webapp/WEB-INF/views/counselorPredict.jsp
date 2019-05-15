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
        <li class="nav-item">
            <a class="nav-link" href="<%=path%>/counselor/analysis">
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
        <li class="nav-item">
            <a class="nav-link active" href="javascript:;">
                <i class="fas fa-fw fa-book"></i>
                <span>成绩预测</span>
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
                                <h6 id="baseTitle" class="m-0 font-weight-bold text-primary">可能挂科学生名单</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12 mb-4">
                                        <div class="table-responsive">
                                            <table id="predictList" class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th>
                                                        学号
                                                    </th>
                                                    <th>
                                                        学生姓名
                                                    </th>
                                                    <th>
                                                        年级
                                                    </th>
                                                    <th>
                                                        班级号
                                                    </th>
                                                    <th>
                                                        已挂科数
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
                    <span>学生成绩分析 2019</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    </div>
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
<div class="modal fade" id="predictDetailModal" tabindex="-1" role="dialog" aria-labelledby="predictDetailTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="predictDetailTitle">可能挂科课程列表</h5>
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
    var predictListTable;
    var basepath = $('base').attr('href');
    function ajaxShowPredictDetail(modal,studentid) {
        modal.modal();
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        };
        $.ajax({
            url: basepath+'counselor/studentPredictInfo',
            async: false,
            cache: true,
            type: "post",
            dataType: 'json',
            data: {
                studentId:studentid
            },
            success: function (data) {
                if (data.code == 100) {
                    //查询成功，填充modal窗的table
                    var predictScoreList = data.content.predictScoreList;
                    modal.find('#modalBody').html('<table class="table table-borderless">' +
                            ' <thead>\n' +
                        '                                                <tr>\n' +
                        '                                                    <th>\n' +
                        '                                                        课程号\n' +
                        '                                                    </th>\n' +
                        '                                                    <th>\n' +
                        '                                                        课程名\n' +
                        '                                                    </th>\n' +
                        '                                                    <th>\n' +
                        '                                                        学年\n' +
                        '                                                    </th>\n' +
                        '                                                    <th>\n' +
                        '                                                        学期\n' +
                        '                                                    </th>\n' +
                        '                                                </tr>\n' +
                        '                                                </thead>'+
                        '<tbody>\n' +
                        '  </tbody></table>');
                    for (var i = 0; i < predictScoreList.length; i++) {
                        modal.find('#modalBody table tbody').append('<tr>' +
                            '<td>' + predictScoreList[i].course.courseid+'</td>' +
                            '<td>' + predictScoreList[i].course.coursename+'</td>' +
                            '<td>' + predictScoreList[i].year+'</td>' +
                            '<td>' + term[predictScoreList[i].term] + '</td>' +
                            '</tr>');
                    }
                } else if (data.code == 200) {
                    //查询失败
                    // $.Toast("查询失败", data.msg, "warning", {
                    //     stack: true,
                    //     has_icon: true,
                    //     has_close_btn: false,
                    //     fullscreen: false,
                    //     width: 400,
                    //     spacing: 20,
                    //     timeout: 3000,
                    //     border_radius: 8,
                    //     sticky: false,
                    //     position_class: "toast-top-right",
                    //     has_progress: false,
                    //     rtl: false,
                    // });
                    modal.find('#modalBody').html(data.msg);
                }
            }
        });
    }
    $(document).ready(function (e) {

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
        predictListTable = $('#predictList').DataTable({
            lengthChange: false,
            paging: true,
            order: [[4, "desc"]],
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
        var studentList = [];
        //查询所有学生信息
        $.ajax({
            url: basepath + 'counselor/allPredictStudentList',
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
                    var studentListData = [];
                    for (var i = 0; i < studentList.length; i++) {
                        studentListData.push([studentList[i].studentid, studentList[i].studentname, studentList[i].grade, studentList[i].classid,studentList[i].failuresum]);
                    }
                    predictListTable.clear();
                    predictListTable.rows.add(studentListData).nodes().to$().attr({
                        "data-toggle": "tooltip",
                        "title": "点击查看详情"
                    });
                    predictListTable.draw();
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
        $('#predictList tbody').off("click").on('click', 'tr', function () {
            var studentid = $(this).find('td:first').text();
            var modal=$('#predictDetailModal');
            ajaxShowPredictDetail(modal,studentid);
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
