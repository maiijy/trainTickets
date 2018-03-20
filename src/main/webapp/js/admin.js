/**
创建时间：2017.12.17
创建者：马晓婷
 */

var url;//表单提交的url
var form_method;//表单提交的方式

//站点数据框  翻页时默认发送 page 页码和rows 两个参数
$("#dg_stations").datagrid({
    fit: true,
    url: "/manage/indexStation",
    /* method:'GET',*/
    pagination: true,
    pageSize: 50,
    pageNumber: 0,
    rownumbers: true,
    singleSelect: true,
    fitColumns: true,
    loadMsg: '数据加载中......',
    idField: 'station_id',
    columns: [[
        {field: 'stationId', title: '站点id', width: 100},
        {field: 'stationName', title: '站点名称', width: 100},
        {field: 'stationAddr', title: '地址', width: 300},
        {field: 'stationRailway', title: '铁路局', width: 100},
        {field: 'stationLat', title: '站点距离', width: 100},
        // {field: 'stationLng', title: '经度', width: 100},
    ]],


});


//新增站点
function addStation() {
    $('#dlg_add_station').dialog('open').dialog('center').dialog('setTitle', '添加站点');
    $('#fm_add').form('clear');
    url = "/manage/station/add";
}

//编辑站点
function updateStation() {
    var row = $("#dg_stations").datagrid('getSelected');
    if (row) {
        $('#dlg_add_station').dialog('open').dialog('center').dialog('setTitle', '修改站点信息');
        $('#fm_add').form('load', row);
        url = '/manage/station/update?id=' + row.stationId;
    }
}


//保存站点
function saveStation() {
    $('#fm_add').form({
        url: url,
        iframe:false,
        ajax:true,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (result) {
            var result = eval('(' + result + ')');
            if (result.success) {
                $('#dlg_add_station').dialog('close');        // close the dialog
                $('#dg_stations').datagrid('reload');    // reload the user data
            } else {
                $.messager.show({
                    title: '错误',
                    msg: result.msg
                });
            }
        }
    }).submit();
}

//删除站点提示
function deleteStation() {

    var row = $('#dg_stations').datagrid('getSelected');
    if (row) {
        $.messager.confirm('确认', '你确定要删除该站点吗?', function (r) {
            if (r) {
                $.post("/manage/station/delete",
                    {id: row.stationId},
                    function (result) {
                        if (result.success) {
                            $('#dg_stations').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: '错误',
                                msg: result.msg
                            });
                        }
                    }, 'json');
            }
        });
    }

}


//搜索站点  其中name为 'station_name' value为 '吴山广场'
function searchStation(value, name) {
    $('#dg_stations').datagrid('load', JSON.parse('{"' + name + '":"' + value + '"}'));
}


//站点数据框  翻页时默认发送 page 页码和rows 两个参数
$("#dg_user").datagrid({
    fit: true,
    url:"/manage/indexUsers",
    //method:'GET',
    pagination: true,
    pageSize: 50,
    pageNumber: 1,
    rownumbers: true,
    singleSelect: true,
    fitColumns: true,
    loadMsg: '数据加载中......',
    idField: 'userCardId',
    columns: [[
        {field: 'id', title: '用户id', width: 100},
        {field: 'username', title: '用户名', width: 100},
        {field: 'psd', title: '密码', width: 100},
        {field: 'psd', title: '联系方式', width: 100},
        {field: 'psd', title: '常用联系人', width: 100}
    ]],


});

//新建用户
function addUser() {
    $('#dlg_add_user').dialog('open').dialog('center').dialog('setTitle', '添加用户');
    $('#fm_add_user').form('clear');
    url = "/manage/user/add";
}

//修改用户
function updateUser() {
    var row = $("#dg_user").datagrid('getSelected');
    if (row) {
        $('#dlg_add_user').dialog('open').dialog('center').dialog('setTitle', '修改用户信息');
        $('#fm_add_user').form('load', row);
        url =  '/manage/user/update?id=' + row.id;
    }
}

//保存用户信息
function saveUser() {
    $('#fm_add_user').form({
        url: url,
        iframe:false,
        ajax:true,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (result) {
            var result = eval('(' + result + ')');
            if (!result.success) {
                $.messager.show({
                    title: '错误',
                    msg: result.msg
                });
            } else {
                $('#dlg_add_user').dialog('close');        // close the dialog
                $('#dg_user').datagrid('reload');    // reload the user data
            }
        }
    }).submit();

}

//删除用户带提示
function deleteUser() {

    var row = $('#dg_user').datagrid('getSelected');
    if (row) {
        $.messager.confirm('确认', '你确定要删除该用户吗?', function (r) {
            if (r) {
                // console.log(row.id);
                /* $.ajax({
                 url: baseUrl + "/user/delete",
                 data: {id: row.id},
                 type: 'DELETE',
                 success: function(result) {
                 console.log(result);
                 if (result.success) {
                 $('#dg_user').datagrid('reload');    // reload the user data
                 } else {
                 $.messager.show({    // show error message
                 title: '错误',
                 msg: result.msg
                 });
                 }
                 }
                 });*/
                $.post("/manage/user/delete",
                    {id: row.id},
                    function (result) {
                        if (result.success) {
                            $('#dg_user').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: '错误',
                                msg: result.msg
                            });
                        }
                    }, 'json');
            }
        });
    }

}


//搜索用户
function searchUser(value, name) {
    $('#dg_user').datagrid('load', JSON.parse('{"' + name + '":"' + value + '"}'));
}

//车次数据框  翻页时默认发送 page 页码和rows 两个参数
$("#dg_main").datagrid({
    fit: true,
    url: "/manage/indexMotors",
    /* method:'GET',*/
    pagination: true,
    pageSize: 40,
    pageNumber: 1,
    rownumbers: true,
    singleSelect: true,
    fitColumns: true,

    loadMsg: '数据加载中......',
    idField: 'main_id',
    columns: [[
    {field: 'motorId', title: '车次id', width: 100},
    {field: 'motorName', title: '车次号', width: 100},
    {field: 'carName', title: '列车名称', width: 100},
    {field: 'carType', title: '列车类型', width: 100},
    {field: 'startName', title: '始发站', width: 100},
    {field: 'endName', title: '终点站', width: 100},
    {field: 'startTime', title: '出发时间', width: 100},
    {field: 'endTime', title: '到达时间', width: 100},
    {field: 'miles', title: '公里数', width: 100},
    ]],


});

//新建车次
function addMotor() {
    $('#dlg_add_main').dialog('open').dialog('center').dialog('setTitle', '添加车次');
    $('#fm_add_main').form('clear');
    url = "/manage/motor/add";
}

//修改车次信息
function updateMotor() {
    var row = $("#dg_main").datagrid('getSelected');
    if (row) {
        $('#dlg_add_main').dialog('open').dialog('center').dialog('setTitle', '修改车次信息');
        $('#fm_add_main').form('load', row);
        url =  '/manage/motor/update?id=' + row.motorId;
    }
}

//保存车次信息
function saveMotor() {
    $('#fm_add_main').form({
        url: url,
        iframe:false,
        ajax:true,
        onSubmit: function () {
            return $(this).form('validate');
        },
        success: function (result) {
            var result = eval('(' + result + ')');
            if (!result.success) {
                $.messager.show({
                    title: '错误',
                    msg: result.msg
                });
            } else {
                $('#dlg_add_main').dialog('close');        // close the dialog
                $('#dg_main').datagrid('reload');    // reload the user data
            }
        }
    }).submit();

}

//删除车次提示
function deleteMotor() {
    var row = $('#dg_main').datagrid('getSelected');
    if (row) {
        $.messager.confirm('确认', '你确定要删除该车次吗?', function (r) {
            if (r) {
                $.post("/manage/motor/delete",
                    {id: row.motorId},
                    function (result) {
                        console.log(result);
                        if (result.success) {
                            $('#dg_main').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: '错误',
                                msg: result.msg
                            });
                        }
                    }, 'json');
            }
        });
    }

}


//搜索车次
function searchMotor(value, name) {
    $('#dg_main').datagrid('load', JSON.parse('{"' + name + '":"' + value + '"}'));
}




//根据菜单选择tab
function changeTag(index) {
    $("#tabs").tabs('select', index);
}

//去除加载效果  显示内容
$("#loading").remove();
$("#contanier").show();

//安全退出按钮
$("#loginOut").click(function () {
    //console.log("logout");
    localStorage.is_login=false;
});

