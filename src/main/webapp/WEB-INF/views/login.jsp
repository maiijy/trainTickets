<!--
创建时间：2017.12.13
创建者：李彤
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="refer.jsp" %>
<html>
<head>
    <meta name="description" content="用户登录"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <!-- artDialog -->
    <link href="${ctx}/lib/artDialog/artDialog_simple.css" rel="stylesheet">

    <link href="${ctx}/css/login.css" rel="stylesheet">

    <title>登录</title>
</head>
<body>
<div class="container">
    <div id="main">
        <div class="row logoNav" id="logoNav">
            <div class="col-sm-5">
                <p>登录</p>
            </div>
        </div>

        <div class="form-horizontal" role="form">
            <div class="form-group">
                <label for="username" class="col-sm-3 control-label">用户名</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" autofocus required oninvalid="setCustomValidity('请输入用户名！');" oninput="setCustomValidity('');">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 control-label">密码</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"  required oninvalid="setCustomValidity('请输入密码！');" oninput="setCustomValidity('');">
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-3 control-label">输入图中验证码</label>
                <div class="col-sm-8">
                    <div id="v_container" style="width: 200px;height: 50px;"></div>
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-3 control-label">输入验证码</label>
                <div class="col-sm-8">
                    <input type="text" id="code_input" value="" /><%--<button id="my_button">验证</button>--%>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-4">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">记住密码
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-7">
                    <button id="login" class="btn  btn-success">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp登录&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/lib/jquery/jquery.min.js"></script>
<script src="${ctx}/lib/artDialog/jquery.artDialog.js"></script>
<script src="${ctx}/js/gVerify.js"></script>
<script src="${ctx}/js/login.js"></script>
</body>
</html>