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
                        <li> <a href="/admin">系统管理</a></li>
                        <li><a  href="javascript:void(0)" id="logout">退出</a></li>
                    </ul>
                </nav>
            </c:if>
            <c:if test="${ empty sessionScope.user }">
                <nav>
                    <ul>
                        <li> <a id="loginBtn" class="loginbuttun">登录</a></li>
                        <li> <a id="registerBtn" class="loginbuttun">&nbsp注册</a></li>
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
        <div class="text">
            <form action="/findpath" method="get">
                <select class="textselect">
                    <option value="单程">单程</option>
                    <option value="往返">往返</option>
                </select>
                <p class="start">出发站：</p>
                <input type="text" class="startinput" name="start">
                <p class="arrive">到达站：</p>
                <input type="text" class="arriveinput" name="end">
                <p class="gotime">出发日期：</p>
                <input type="date" class="goinput">
                <p class="backtime">返程日期：</p>
                <input type="date" class="backinput">
                <input type="submit" class="searchinput" value="查询">
            </form>

        </div>

        <%--基本信息--%>
        <div class="info">
            <div class="kind">
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
    <div style="height: 500px">
        <div class="searchinfo">
            <div class="searchmain">
                <p class="searchfont">火车列次信息</p>
            </div>
            <table class="table table-hover">
                <thead>
                <tr class="primary_col">
                    <th>车次</th>
                    <th>始发站</th>
                    <th>终点站</th>
                    <th>出发时间</th>
                    <th>到达时间</th>
                    <th>历时</th>
                    <th>余票</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%--<tr>
                    <td>G7358</td>
                    <td>杭州</td>
                    <td>上海</td>
                    <td>06:10:00</td>
                    <td>07:36:00</td>
                    <td>1时26分</td>
                    <td>
                        一等座：120张；二等座：100张；站票：55张
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary">路线查询</button>
                    </td>
                </tr>
                <tr>
                    <td>D3231</td>
                    <td>杭州</td>
                    <td>厦门北</td>
                    <td>07:16:00</td>
                    <td>14:03:00</td>
                    <td>6时47分</td>
                    <td> 一等座：20张；二等座：10张；站票：5张
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary">路线查询</button>
                    </td>
                </tr>
                <tr>
                    <td>G1228</td>
                    <td>鳌江</td>
                    <td>上海虹桥</td>
                    <td>07:06:00</td>
                    <td>11:10:00</td>
                    <td>4时4分</td>
                    <td> 一等座：120张；
                        二等座：102张；
                        站票：15张
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary">路线查询</button>
                    </td>
                </tr>--%>
                <c:forEach items="${list}" var="motor" varStatus="num">
                    <tr>
                        <td>${motor.motorName}</td>
                        <td>${motor.startName}</td>
                        <td>${motor.endName}</td>
                        <td>${motor.startTime}</td>
                        <td>${motor.endTime}</td>
                        <td>4时4分</td>
                        <td> 一等座：120张；
                            二等座：102张；
                            站票：15张
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary">路线查询</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="${ctx}/lib/jquery/jquery.min.js"></script>
<script src="${ctx}/lib/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/js/logout.js"></script>
<script src="${ctx}/js/index.js"></script>
</body>
</html>
