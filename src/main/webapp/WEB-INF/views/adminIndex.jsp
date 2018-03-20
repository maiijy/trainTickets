<!--
创建时间：2017.12.17
创建者：马晓婷
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="refer.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>火车售票管理系统</title>
    <!--<link rel="shortcut icon" href="../../assets/icon/favicon.ico" /> -->
    <link rel="shortcut icon" href="${ctx}/images/train.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/lib/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/lib/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/lib/easyui/icons/icon_extension.min.css">

    <link  rel="stylesheet" href="${ctx}/css/loading.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/admin.css">

</head>
<body>
<!--<input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回上一页">-->
<div id="loading" style="width: 100%; height: 100%; margin: 0 auto;z-index: 20;">
    <ul id="spinners" style=" position: absolute;top: 48%;left: 48%;">
        <li class="active" >
            <div id="preloader_4">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </li>
    </ul>
</div>
<div id="contanier" class="easyui-layout" style="display:none">

    <div id="north" data-options="region:'north'" >
        <ul class="northP">
            <li><img src="${ctx}/images/train.png" style="width: 150px;"></li>
            <li class="h3">火车售票管理系统</li>
            <li></li>
        </ul>
        <p class="title_logo">
        <span style="float:right;margin-top: 8px; padding-right:20px;padding-top: 5px" class="head">欢迎 管理员  <a href="javascript:void(0);" id="back" onClick="history.back(-1);">返回</a>
            <a href="/logout" id="loginOut">安全退出</a></span>
        </p>
    </div>

    <div id="west" data-options="region:'west',split:true,hideCollapsedContent:false,collapsed:false" title="系统菜单">
        <div id="menu" class="easyui-accordion" fit="true" border="false">
            <div title="信息管理" style="padding: 10px;" >
                <div  >
                    <a class="easyui-linkbutton" data-options="iconCls:'icon-bicycle',plain:true" onclick="changeTag(0)" href="javascript:void(0);">站点管理</a>
                </div>
                <div  style="margin-top: 10px;">
                    <a class="easyui-linkbutton"  data-options="iconCls:'icon-user_mature',plain:true" onclick="changeTag(1)" href="javascript:void(0);">用户管理</a>
                </div>
                <div  style="margin-top: 10px;">
                    <a class="easyui-linkbutton"  data-options="iconCls:'icon-mian',plain:true" onclick="changeTag(2)" href="javascript:void(0);">车次管理</a>
                </div>
            </div>
        </div>
    </div>

    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">

        <div id="tabs" class="easyui-tabs"  fit="true" border="false">
            <div title="站点管理" >

                <div class="easyui-layout" fit="true">
                    <div region="north" border="false" style="margin-top:2px;border-bottom:1px solid #ddd;height:37px;padding:2px 5px;background:#fafafa;">
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="addStation()">新增</a>
                        </div>
                        <div class="datagrid-btn-separator"></div>
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-save" onclick="updateStation()">编辑</a>
                        </div>
                        <div class="datagrid-btn-separator"></div>
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="deleteStation()">删除</a>
                        </div>
                        <div style="float:right;margin-top:2px;">
                            <input id="sb_station" class="easyui-searchbox" style="float:right;"
                                   data-options="searcher:searchStation,prompt:'请输入站点名称或id',menu:'#mm'">
                            <div id="mm" style="width:120px">
                                <div data-options="name:'station_name'">名称</div>
                                <div data-options="name:'address'">站点位置</div>
                                <div data-options="name:'station_id'">id</div>
                            </div>
                        </div>
                    </div>
                    <div region="center" border="false">
                        <table id="dg_stations" style="width: 100%;"></table>
                    </div>
                </div>
            </div>
            <div  title="用户管理">

                <div class="easyui-layout" fit="true">
                    <div region="north" border="false" style="margin-top:2px;border-bottom:1px solid #ddd;height:37px;padding:2px 5px;background:#fafafa;">
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="addUser()">新增</a>
                        </div>
                        <div class="datagrid-btn-separator"></div>
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-save" onclick="updateUser()">编辑</a>
                        </div>
                        <div class="datagrid-btn-separator"></div>
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="deleteUser()">删除</a>
                        </div>
                        <div style="float:right;margin-top:2px;">
                            <input id="sb_user" class="easyui-searchbox" style="float:right;"
                                   data-options="searcher:searchUser,prompt:'请输入用户名字或id',menu:'#user_mm'">
                            <div id="user_mm" style="width:120px">
                                <div data-options="name:'username'">名字</div>
                                <div data-options="name:'id'">id</div>
                            </div>
                        </div>
                    </div>
                    <div region="center" border="false">
                        <table id="dg_user" style="width: 100%;"></table>
                    </div>
                </div>
            </div>
            <div  title="车次管理">
                <div class="easyui-layout" fit="true">
                    <div region="north" border="false" style="margin-top:2px;border-bottom:1px solid #ddd;height:37px;padding:2px 5px;background:#fafafa;">
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="addMotor()">新增</a>
                        </div>
                        <div class="datagrid-btn-separator"></div>
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-save" onclick="updateMotor()">编辑</a>
                        </div>
                        <div class="datagrid-btn-separator"></div>
                        <div style="float:left;">
                            <a href="#" class="easyui-linkbutton" plain="true" icon="icon-remove" onclick="deleteMotor()">删除</a>
                        </div>
                        <div style="float:right;margin-top:2px;">
                            <input id="sb_main" class="easyui-searchbox" style="float:right;"
                                   data-options="searcher:searchMotor,prompt:'请输入车次名称或id',menu:'#main_mm'">
                            <div id="main_mm" style="width:120px">
                                <div data-options="name:'motor_name'">车次号</div>
                                <div data-options="name:'motor_id'">车次id</div>
                            </div>
                        </div>
                    </div>
                    <div region="center" border="false">
                        <table id="dg_main" style="width: 100%;"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="south" data-options="region:'south'" split="false">
        <div class="tag">Copyright © 2017 杭州电子科技大学</div>
    </div>

</div>

<!--新建和修改站点-->
<div id="dlg_add_station" class="easyui-dialog" style="width:400px"
     closed="true" buttons="#dlg-buttons_station" >
    <form id="fm_add" method="post" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">站点信息</div>
        <div style="margin-bottom:10px">
            <input name="stationName" class="easyui-textbox" required="true" label="站点名称:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="stationAddr" class="easyui-textbox" required="true" label="站点地址：" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="stationRailway" class="easyui-textbox" required="true" label="铁路局：" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="stationLng" class="easyui-textbox" required="true" label="站点距离" style="width:100%">
        </div>
        <%--<div style="margin-bottom:10px">--%>
            <%--<input name="stationLat" class="easyui-textbox" required="true"  label="纬度:" style="width:100%">--%>
        <%--</div>--%>

    </form>
</div>
<div id="dlg-buttons_station">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveStation()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg_add_station').dialog('close')" style="width:90px">取消</a>
</div>


<!--新建和修改用户-->
<div id="dlg_add_user" class="easyui-dialog" style="width:400px"
     closed="true" buttons="#dlg-buttons_user" >
    <form id="fm_add_user" method="post" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
        <div style="margin-bottom:10px">
            <input name="id" class="easyui-textbox" required="true" label="用户id:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="username" class="easyui-textbox" required="true" label="用户名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input  name="psd" class="easyui-textbox" required="true" label="密码："style="width:100%;">
        </div>

    </form>
</div>
<div id="dlg-buttons_user">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg_add_user').dialog('close')" style="width:90px">取消</a>
</div>


<!--新建和修改车次信息-->
<div id="dlg_add_main" class="easyui-dialog" style="width:400px"
     closed="true" buttons="#dlg-buttons_main" >
    <form id="fm_add_main" method="post" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">车次信息</div>
        <div style="margin-bottom:10px">
            <input name="motorName" class="easyui-textbox" required="true" label="车次号:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="carName" class="easyui-textbox" required="true"  label="列车名称" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="carType" class="easyui-textbox" required="true" label="列车类型:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="startName" class="easyui-textbox" required="true"  label="始发站:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="endName" class="easyui-textbox" required="true"  label="终点站:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="startTime" class="easyui-textbox" required="true"  label="出发时间:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="endTime" class="easyui-textbox" required="true"  label="到达时间:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="miles" class="easyui-textbox" required="true"  label="公里数:" style="width:100%">
        </div>

    </form>
</div>
<div id="dlg-buttons_main">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveMotor()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg_add_main').dialog('close')" style="width:90px">取消</a>
</div>


<script type="text/javascript" src="${ctx}/lib/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="${ctx}/js/admin.js"></script>
</body>
</html>
