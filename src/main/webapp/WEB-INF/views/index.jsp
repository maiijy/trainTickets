<!--
创建时间：2017.12.12
创建者：朱佳言

修改时间：2017.12.18 部分排版等细节优化
修改人：何牧野
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="refer.jsp" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/lib/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<div style="margin: 0 auto;width: 1200px;">
    <div class="list">
        <%--导航栏--%>
        <div class="header1">
            <div class="logo">
                <a href=""><img src="../../images/train.png" class="logosize" ></a>
            </div>
            <div class="menu2">
                <ul id="nav2">
                    <li><a href="/index" class="login"><B>首页</B></a></li>
                    <li><a href="" class="login"><B>车票预订</B></a></li>
                    <li><a href="" class="login"><B>车站引导</B></a></li>
                    <li><a href="" class="login"><B>投诉箱</B></a></li>
                </ul>
            </div>
            <div class="search bar3">

                <input type="text" id="search1" placeholder="">
                <button type="submit" id="search2" style="background-image: url(../../images/buttonsearch.png)"></button>

            </div>
            <c:if test="${! empty sessionScope.user}">
                <nav>
                    <ul>
                        <li>欢迎您，${sessionScope.user.username}</li>
                        <li><a href="/admin">系统管理</a></li>
                        <li><a  href="javascript:void(0)" id="logout">退出</a></li>
                    </ul>
                </nav>
            </c:if>
            <c:if test="${ empty sessionScope.user }">
                <nav>
                    <ul>
                        <li> <a href="/login" id="loginBtn" class="loginbuttun">登录</a></li>
                    </ul>
                </nav>
                <div class="login">

                        <%--<li><a href="/register">注册</a> </li>--%>
                </div>
            </c:if>


        </div>
    </div>
    <div style="height: auto">
        <%--填写信息--%>
            <div class="col-md-8 ">
                <div class="row">
                    <div class="col-md-6">
                        <a class="btn btn-info" id="high">起始查询</a>
                        <a class="btn btn-warning " id="higher">站间查询</a>
                        <a class="btn btn-success " id="highest">换乘查询</a>
                    </div>
                </div>
            </div>
            <div class="col-md-12" id="normalForm">
                <div class="row">
                <div class="col-md-1">
                    <p style="float: right;font-size: 13px;margin-top: 11px;">直达搜索：</p>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="col-sm-4 control-label" for="name">出发日</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control"  name="startDate">
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="name">出发站</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="name" placeholder="请输入出发站名称" name="start">
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="end">到达站</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="end" placeholder="请输入到达站名称" name="end">
                        </div>
                    </div>
                </div>
            </div>
                <div class="col-md-4">
                    <a class="btn btn-primary" id="searchInput">查询</a>
                    <a class="btn btn-primary short">最短路径</a>
                    <a class="btn btn-primary cheap">最低价格</a>
                </div>
            </div>
            <div class="col-md-12 " id="higherForm" hidden>
                <div class="row">
                    <div class="col-md-1">
                        <p style="float: right;font-size: 13px;margin-top: 11px;">站间搜索：</p>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="name">出发日</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control"  name="startDate">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="name">出发站</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control"  placeholder="请输入出发站名称" name="startH">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="end">到达站</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control"  placeholder="请输入到达站名称" name="endH">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-primary" id="searchHigh">查询</a>
                    <a class="btn btn-primary short">最短路径</a>
                    <a class="btn btn-primary cheap">最低价格</a>
                </div>
            </div>
            <div class="col-md-12 " id="highestForm" hidden>
                <div class="row">
                    <div class="col-md-1">
                        <p style="float: right;font-size: 13px;margin-top: 11px;">换乘搜索：</p>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="name">出发日</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control"  name="startDate">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="name">出发站</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control"  placeholder="请输入出发站名称" name="startHr">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="end">到达站</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control"  placeholder="请输入到达站名称" name="endHr">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <a class="btn btn-primary" id="searchHigher">查询</a>
                    <a class="btn btn-primary short">最短路径</a>
                    <a class="btn btn-primary cheap">最低价格</a>
                </div>
            </div>
        <%--基本信息--%>
            <div class="col-md-8 ">
                <div class="row">
                    <form class="form1">
                        <p class="kind1">车票类型：</p>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>不限 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>G-高铁 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>D-动车 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>T-特快 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>K-快速 </label>
                    </form>
                    <form class="form1">
                        <p class="kind1">出发时间：</p>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>不限 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>06:00-12:00 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>12:00-18:00 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>18:00-24:00 </label>
                    </form>
                    <form class="form1">
                        <p class="kind1">到达时间：</p>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>不限 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>06:00-12:00 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>12:00-18:00 </label>
                        <label><input name="ticket" type="radio" value=""  class="lable"/>18:00-24:00 </label>
                    </form>
                </div>
            </div>
    </div>
    <div class="row" id="detailF"hidden>
        <table class="table table-hover">
            <thead>
            <tr class="primary_col">
                <th>车次</th>
                <th>站次</th>
                <th>站名</th>
                <th>到达时间</th>
                <th>出发时间</th>
                <th>停留时间</th>
                <th>里程</th>
            </tr>
            </thead>
            <tbody id="detailForm">
            </tbody>
        </table>
    </div>
    <div style="height: 500px">
        <div class="searchinfo">
            <div class="searchmain">
                <p class="searchfont">火车列次信息</p>
            </div>
            <div id="changeForm">
                <table class="table table-hover">
                    <thead>
                    <tr class="primary_col">
                        <th>车次</th>
                        <th>列车类型</th>
                        <th>始发站</th>
                        <th>终点站</th>
                        <th>出发时间</th>
                        <th>到达时间</th>
                        <th>里程</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="carForm">
                    <c:choose>
                        <c:when test="${empty data}">
                            暂无数据
                            <%--<div style="display:flex;justify-content:center;align-items:center;"  hidden>--%>
                            <%--<img src="${ctx}/images/icon_empty_content.png"/>--%>
                            <%--</div>--%>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${data}" var="car" varStatus="num" >
                                <tr>
                                    <td>${car.motorName}</td>
                                    <td>${car.carType}</td>
                                    <td>${car.startName}</td>
                                    <td>${car.endName}</td>
                                    <td>${car.startTime}</td>
                                    <td>${car.endTime}</td>
                                    <td>${car.miles}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary"  onclick="detailR($(this))">路线查询</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/lib/jquery/jquery.min.js"></script>
<script src="${ctx}/lib/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/js/logout.js"></script>
<script src="${ctx}/js/search.js"></script>
</body>
</html>
