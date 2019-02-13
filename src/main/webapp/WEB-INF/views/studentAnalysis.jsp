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
    <link href="static/vendor/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet">
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
                                            <div class="card-body">
                                                <div class="row  form-inline">
                                                    <label>
                                                        <h5 class="card-text">
                                                            各学期成绩总览&emsp;年级总人数:${sessionScope.studentInfo.studentCountG}&emsp;
                                                        </h5>
                                                    </label>
                                                    <div>
                                                        <select class="custom-select" id="selectScale">
                                                            <option value="term">学期</option>
                                                            <option value="year">学年</option>
                                                        </select>
                                                    </div>
                                                </div>
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
                                            <div class="card-body">
                                                <div class="row  form-inline">
                                                    <label>
                                                        <h5 class="card-text">
                                                            各课程成绩总览
                                                        </h5>
                                                    </label>

                                                </div>
                                                <div class="row form-inline">
                                                    <label>
                                                        <h6 class="card-text">
                                                            &emsp;&emsp;&emsp;&emsp;点击或鼠标滚轮滑动缩放图表。(绿色表示成绩优异，蓝色表示成绩普通，红色表示成绩较差，需要注意!)
                                                        </h6>
                                                    </label>
                                                    <i class="far fa-question-circle" data-toggle="tooltip"
                                                       data-placement="right" title="每课成绩将与同课程学生成绩对比，如果高于所有学生成绩的上四分位数，则成绩显示为绿色，即优异，如果低于下四分位数，则成绩显示为红色，需要注意！"></i>
                                                </div>
                                                <div class="row">
                                                    <div id="courseChart" class="col-lg-12" style="height:600px;"></div>
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
</div>
<!-- Bootstrap core JavaScript-->
<script src="static/vendor/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="static/vendor/popper/popper.min.js"></script>
<script src="static/vendor/bootstrap-4.2.1-dist/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="static/js/sb-admin-2.min.js"></script>


<script src="static/vendor/echarts/echarts.min.js"></script>
<script src="static/vendor/echarts/theme/walden.js"></script>
<script type="text/javascript">
    function showTermLineChart(chart, xData, yData) {
        var option = {
            title: {
                text: '各学期成绩变化',
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['加权成绩']
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
                    data: xData,
                    axisLabel: {
                        interval: 0,
                        padding: [0, -5],
                        rotate: 45,
                    },
                }
            ],
            yAxis:
                {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    },
                    max: 100,
                    boundaryGap: [0.2, 0.2],
                }
            ,
            series: [
                {
                    name: '加权成绩',
                    type: 'line',
                    data: yData,
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
            ]
        };
        chart.setOption(option);
    }

    function showRankLineChart(chart, xData, yData, rankChange) {
        var option = {
            title: {
                text: '各学期排名变化',
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['年级排名']
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
                    data: xData,
                    axisLabel: {
                        interval: 0,
                        padding: [0, -5],
                        rotate: 45,
                    },
                }
            ],
            yAxis:
                {
                    type: 'category',

                    boundaryGap: [0.2, 0.2],
                }
            ,
            series: [
                {
                    name: '年级排名',
                    type: 'line',
                    data: yData,
                    markPoint: {
                        data: [],
                        symbolSize: 20,
                        symbolOffset: [0, -10],
                        label: {
                            show: true,
                            formatter: function (params) {
                                if (params.value < 0) {
                                    return '{up|↑' + (-params.value) + '}';
                                } else if (params.value > 0) {
                                    return '{down|↓' + (params.value) + '}';
                                }
                            },
                            rich: {
                                up: {
                                    color: 'green',
                                },
                                down: {
                                    color: 'red',
                                }
                            }
                        },
                        itemStyle: {
                            color: '#ffffff',
                        }
                    },
                },
            ]
        };
        for (var i = 0; i < rankChange.length; i++) {
            var change = parseInt(rankChange[i]);
            if (change == 0) {
                continue;
            }
            option.series[0].markPoint.data.push({name: '成绩变化', value: change, xAxis: i, yAxis: i})
        }
        chart.setOption(option);
    }

    function showCourseBarChart(chart, xData, yData, greatMap) {
        var yMax = 100;
        var dataShadow = [];

        for (var i = 0; i < yData.length; i++) {
            dataShadow.push(yMax);
        }

        var option = {
            title: {
                // text: '特性示例：渐变色 阴影 点击缩放',
                //  subtext: '点击或鼠标滚轮滑动缩放图表。(绿色表示成绩优异，蓝色表示成绩普通，红色表示成绩较差，需要注意！)'
            },
            tooltip: {
                trigger: 'axis',
                formatter: '{b}<br/>成绩:{c1}'
            },
            grid: {
                left: '10%',
                bottom: '25%'
            },
            xAxis: {
                data: xData,
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: false
                },
                axisLabel: {
                    interval: 0,
                    padding: [0, -5],
                    rotate: 45,
                    formatter: function (value) {
                        var ret = "";//拼接加\n返回的类目项
                        var maxLength = 10;//每项显示文字个数
                        var valLength = value.length;//X轴类目项的文字个数
                        var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
                        if (rowN > 1)//如果类目项的文字大于3,
                        {
                            for (var i = 0; i < rowN; i++) {
                                var temp = "";//每次截取的字符串
                                var start = i * maxLength;//开始截取的位置
                                var end = start + maxLength;//结束截取的位置
                                //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
                                temp = value.substring(start, end) + "\n";
                                ret += temp; //凭借最终的字符串
                            }
                            return ret;
                        } else {
                            return value;
                        }
                    }
                },
                z: 10
            },
            yAxis: {
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        color: '#999'
                    }
                }
            },
            dataZoom: [
                {
                    type: 'inside'
                }
            ],
            series: [
                { // For shadow
                    type: 'bar',
                    itemStyle: {
                        color: 'rgba(0,0,0,0.05)'
                    },
                    barGap: '-100%',
                    barCategoryGap: '40%',
                    data: dataShadow,
                    animation: false
                },
                {
                    type: 'bar',
                    // itemStyle: {
                    //     emphasis: {
                    //         color: new echarts.graphic.LinearGradient(
                    //             0, 0, 0, 1,
                    //             [
                    //                 {offset: 0, color: '#2378f7'},
                    //                 {offset: 0.7, color: '#2378f7'},
                    //                 {offset: 1, color: '#83bff6'}
                    //             ]
                    //         )
                    //     }
                    // },
                    data: yData
                }
            ]
        };
        chart.setOption(option);
        // Enable data zoom when user click bar.
        var zoomSize = 6;
        chart.on('click', function (params) {
            console.log(xData[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            chart.dispatchAction({
                type: 'dataZoom',
                startValue: xData[Math.max(params.dataIndex - zoomSize / 2, 0)],
                endValue: xData[Math.min(params.dataIndex + zoomSize / 2, yData.length - 1)]
            });
        });
    }

    var list = [];
    var courseList = [];
    $("#selectScale").change(function () {
        var ss = $(this).children('option:selected').val();
        if (ss == "term") {
            showChart(termChart, rankChart, 'term');
        } else if (ss == "year") {
            showChart(termChart, rankChart, 'year');
        }
    });

    function ajaxGetData(studentId) {
        var basepath = $('base').attr('href');
        var result = {};
        $.ajax({
            url: basepath + 'student/allAnalysis',
            async: false,
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

    function showChart(termChart, rankChart, scale) {
        var length = list.length;
        var term = {
            '0': '学年',
            '1': '春季学期',
            '2': '秋季学期'
        }
        var xData = [];
        var yData = [];
        if (length > 0) {
            for (var i = 0; i < length; i++) {
                if (list[i]['year'] !== null && list[i]['term'] !== null) {
                    if (scale == 'term') {
                        if (list[i]['term'] == '0') {
                            continue;
                        }
                    } else {
                        if (list[i]['term'] != '0') {
                            continue;
                        }
                    }
                    xData.push(list[i]['year'] + '\n' + term[list[i]['term']]);
                }
                if (list[i]['weightscore'] !== null) {
                    yData.push(list[i]['weightscore']);
                }
            }
            showTermLineChart(termChart, xData, yData);
            //显示成绩排名
            xData = [];
            yData = [];
            var rankChange = []
            for (var i = 0; i < length; i++) {
                if (list[i]['year'] !== null && list[i]['term'] !== null) {
                    if (scale == 'term') {
                        if (list[i]['term'] == '0') {
                            continue;
                        }
                    } else {
                        if (list[i]['term'] != '0') {
                            continue;
                        }
                    }
                    xData.push(list[i]['year'] + '\n' + term[list[i]['term']]);
                }
                if (list[i]['studentrank'] !== null) {
                    yData.push(list[i]['studentrank']);
                }
                if (list[i]['scorechange'] !== null) {
                    rankChange.push(list[i]['scorechange']);
                }
            }
            showRankLineChart(rankChart, xData, yData, rankChange);
        }
    }

    var termChart;
    var rankChart;
    var courseChart;
    $(document).ready(function (e) {
        /**
         * 图表
         */
        termChart = echarts.init(document.getElementById('termChart'), 'walden');
        rankChart = echarts.init(document.getElementById('rankChart'), 'walden');
        courseChart = echarts.init(document.getElementById('courseChart'), 'walden');
        var studentId =${sessionScope.student.studentid};
        var content = ajaxGetData(studentId);
        list = content.list;
        courseList = content.studentCourseList;
        showChart(termChart, rankChart, 'term');
        var xData = [];
        var yData = [];
        var greatMap = {};
        var col = new echarts.graphic.LinearGradient(
            0, 0, 0, 1,
            [
                {offset: 0, color: '#6be6c1'},
                {offset: 0.5, color: '#39f08f'},
                {offset: 1, color: '#39f08f'}
            ]
        );
        var nCol = new echarts.graphic.LinearGradient(
            0, 0, 0, 1,
            [
                {offset: 0, color: '#83bff6'},
                {offset: 0.5, color: '#188df0'},
                {offset: 1, color: '#188df0'}
            ]
        );
        var bCol = new echarts.graphic.LinearGradient(
            0, 0, 0, 1,
            [
                {offset: 0, color: '#f61b69'},
                {offset: 0.5, color: '#f01835'},
                {offset: 1, color: '#f01835'}
            ]
        );
        for (var i = 0; i < courseList.length; i++) {
            xData.push(courseList[i].course.coursename);
            yData.push({name: courseList[i].course.coursename, value: courseList[i].score,})

            if (parseInt(courseList[i].great) == 1) {
                yData[i]['itemStyle'] = {color: col};
            } else if (parseInt(courseList[i].great) == 2) {
                yData[i]['itemStyle'] = {color: nCol};
            } else {
                yData[i]['itemStyle'] = {color: bCol};
            }
        }
        showCourseBarChart(courseChart, xData, yData, greatMap);
        window.onresize = function () {
            termChart.resize();
            rankChart.resize();
            courseChart.resize();
        };
        //初始化tooltip
        $('[data-toggle="tooltip"]').tooltip()
    });

</script>
</body>

</html>
