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
    <link rel="stylesheet" href="static/vendor/jqueryToast/css/toast.style.css">
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
               href="<%=path%>/student/info">
                <i class="far fa-address-card"></i>
                <span>个人信息</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">


        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
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
                                <h6 class="m-0 font-weight-bold text-primary">个人成绩总览</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6 mb-4">
                                        <div class="card border-0 bg-primary text-white shadow">
                                            <div class="card-body">
                                                姓名:${sessionScope.student.studentname}<br>
                                                学号:${sessionScope.student.studentid}<br>
                                                所在班级:${sessionScope.student.classid}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 mb-4">
                                        <div class="card border-0 bg-primary text-white shadow">
                                            <div class="card-body">
                                                加权成绩(截至当前学期):${sessionScope.student.weightscore}<br>
                                                <div class="list-inline">
                                                    不及格次数:${sessionScope.student.failuresum}
                                                    <a id="detail" class="text-white">查看详情</a>
                                                    <br></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 mb-4">
                                        <div class="card border-0 shadow">
                                            <div class="card-body">
                                                您的成绩排名(截至当前学期):${sessionScope.student.studentrank}&emsp;年级总人数:${sessionScope.studentInfo.studentCountG}<br>
                                                <div id="main" class="col-lg-12" style="height: 300px;"></div>
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
<script src="static/vendor/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>
<script src="static/vendor/jqueryToast/js/toast.script.js"></script>
<!-- Core plugin JavaScript-->
<script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="static/js/sb-admin-2.min.js"></script>


<script src="static/vendor/echarts/echarts.min.js"></script>
<script src="static/vendor/echarts/theme/walden.js"></script>
<script>
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
        //同年级学生数
        var studentNumInG =
            ${sessionScope.studentInfo.studentCountG};
        var studentRank =${sessionScope.student.studentrank};
        var studentRankChart = echarts.init(document.getElementById('main'), 'walden');
        var labelTop = {
            normal: {
                color: '#4e73de',
                label: {
                    show: true,
                    position: 'center',
                    formatter: '{b}',
                    textStyle: {
                        baseline: 'bottom'
                    }
                },
                labelLine: {
                    show: false
                }
            }
        };
        var labelFromatter = {
            normal: {
                label: {
                    formatter: function (params) {
                        return 100 - params.value + '%'
                    },
                    textStyle: {
                        baseline: 'top'
                    }
                }
            },
        }
        var labelBottom = {
            normal: {
                color: '#ccc',
                label: {
                    show: true,
                    position: 'center'
                },
                labelLine: {
                    show: false
                }
            },
            emphasis: {
                color: 'rgba(0,0,0,0)'
            }
        };
        var option = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data: ['超过学生', '未超过学生']
            },
            series: [
                {
                    name: '',
                    type: 'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data: [
                        {value: studentRank - 1, name: '未超过学生', itemStyle: labelBottom},
                        {value: studentNumInG - studentRank, name: '超过学生', itemStyle: labelTop},
                    ]
                }
            ]
        };
        studentRankChart.setOption(option);
        window.onresize = function () {
            studentRankChart.resize();
            //myChart1.resize();    //若有多个图表变动，可多写

        }
    });
</script>
</body>

</html>
