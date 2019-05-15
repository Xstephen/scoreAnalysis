<%--
  Created by IntelliJ IDEA.
  User: XipengCao
  Date: 2018/12/30
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basepath%>"/>
    <meta charset="UTF-8">
    <title>成绩分析系统</title>
    <link rel="shortcut icon" href="static/images/favicon.ico"/>
    <link href="static/vendor/bootstrap-4.2.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--<link href="static/vendor/fontawesome-free-5.7.2-web/css/all.min.css" rel="stylesheet" type="text/css">--%>
    <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="static/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="static/vendor/bootstrapValidator/css/bootstrapValidator.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/style.css">
    <link rel="stylesheet" href="static/vendor/jqueryToast/css/toast.style.css">
</head>

<body>
<div class="container">
    <div class="card card-login mx-auto " style="margin-top: 33%">
        <div class="card-header">登录</div>
        <div class="card-body">
            <form id="loginForm">
                <div class="form-group">
                    <div class="form-label-group">
                        <input class="form-control required" type="text" placeholder="学号/教工号" id="username"
                               name="userId" autofocus="autofocus" maxlength="20" autocomplete="current-username"/>
                        <label for="username">学号/教工号</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <input class="form-control required" type="password" placeholder="密码（默认为身份证号后6位）"
                               id="password"
                               name="userPassword" maxlength="20" autocomplete="current-password"/>
                        <label for="password">密码</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group form-inline">
                        <input class="form-control required" placeholder="验证码"
                               id="verifyCode"
                               name="verifyCode" maxlength="4"/>
                        <label class="col-4" for="verifyCode">验证码</label>
                        <img class="col-5" src="${pageContext.request.contextPath}/getVerifyCode" id="verifyImg"
                             onclick="javascript:changeImage();" style="height:calc(2.25rem + 2px)"/>
                    </div>
                </div>
                <%--<div class="form-group">--%>
                <%--<div class="checkbox">--%>
                <%--<label>--%>
                <%--<input id="rememberMe" name="rememberMe" type="checkbox" value="yes">--%>
                <%--记住我--%>
                <%--</label>--%>
                <%--</div>--%>
                <%--</div>--%>
                <button class="btn btn-primary btn-block" id="subbtn" type="submit">登录</button>
            </form>
        </div>
    </div>
</div>
<script src="static/vendor/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="static/vendor/bootstrap-4.2.1-dist/js/bootstrap.min.js"></script>
<script src="static/vendor/jqueryToast/js/toast.script.js"></script>
<script src="static/vendor/bootstrapValidator/js/bootstrapValidator.min.js"></script>
<script src="static/vendor/jsencrypt/jsencrypt.min.js"></script>
<script type="text/javascript">
    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }
    function changeImage() {
        $('#verifyImg').attr('src', '${pageContext.request.contextPath}/getVerifyCode?timestamp=' + genTimestamp());
    }

    $(document).ready(function (e) {
        var basepath = $('base').attr('href');
        //获取公钥
        var publicKey=null;
        var form = $('#loginForm')
        $.ajax({
            url: basepath+'/getPublic',
            async: false,
            cache: false,
            type: "post",
            dataType: 'json',
            success: function (data) {
                if (data.code==100) {
                    publicKey=data.content.publicKey;
                }
                else if(data.code==200){
                    $.Toast("发生错误", data.msg, "warning", {
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
            }});
        // //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
        // var curWwwPath = window.document.location.href;
        // //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
        // var pathName = window.document.location.pathname;
        // var pos = curWwwPath.indexOf(pathName);
        // //获取主机地址，如： http://localhost:8083
        // var localhostPath = curWwwPath.substring(0, pos);
        // //获取带"/"的项目名，如：/uimcardprj
        // var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        //
        //
        var loginUrl = basepath+'/checkLogin';

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
        $('#loginForm').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userId: {
                    message: '用户名输入有误！',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空！'
                        },regexp: {
                            regexp: /^[0-9]+$/,
                            message: '用户名只能包含数字'
                        }
                    }
                },
                userPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空！'
                        },stringLength: {  //长度限制
                            min: 6,
                            max: 20,
                            message: '密码必须在6到20位之间'
                        },

                    }
                },
                verifyCode:{
                    validators:{
                        notEmpty:{
                            message:'验证码不能为空！'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: '验证码只能包含字母和数字'
                        }
                    }
                }

            }
        }).on('success.form.bv', function (e) { // 表单校验成功
            e.preventDefault();
            var form = $('#loginForm');
            var encrypt= new JSEncrypt();
            encrypt.setPublicKey(publicKey);
            var username=form.find('#username').val();
            var password=form.find('#password').val();
            var verifyCode=form.find('#verifyCode').val();
            $.ajax({
                url: loginUrl,
                async: true,
                cache: false,
                type: "post",
                dataType: 'json',
                data: {
                    userId:encrypt.encrypt(username),
                    userPassword:encrypt.encrypt(password),
                    verifyCode:verifyCode
                },
                success: function (data) {
                    if (data.success) {
                        window.location.href = basepath + 'main';
                    } else {
                        //$("#errorMsg").text(data.msg);
                        $('#subbtn').attr("disabled",false);
                        changeImage();
                        $.Toast("登录失败", data.msg, "warning", {
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
                },
                error:function(){
                    $('#subbtn').attr("disabled",false);
                    changeImage();
                    $.Toast("服务器忙","请重试！", "warning", {
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
            });
        });
    });
</script>
</body>
</html>