/**
* 创建时间：2017.12.13
* 创建者：李彤
*/
$(function () {
    var flag = checkID();
    var verifyCode = new GVerify("v_container");
    $("#login").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        var code = document.getElementById("code_input").value;
        if(username == ""){
            var dialog = art.dialog({
                title: '提示',
                content: '请输入用户名！',
                lock:true,
                ok:true,
                follow: document.getElementById('logoNav')
            });
        }else if(password == ""){
            var dialog = art.dialog({
                title: '提示',
                content: '请输入密码！',
                lock:true,
                ok:true,
                follow: document.getElementById('logoNav')
            });
        }else if(code == ""){
            var dialog = art.dialog({
                title: '提示',
                content: '请输入验证码！',
                lock:true,
                ok:true,
                follow: document.getElementById('logoNav')
            });
        }else
        {
            var res = verifyCode.validate(code);
            console.log(res);
        }
        if(res == false){
            var dialog = art.dialog({
                title: '提示',
                content: '验证码输入有误！',
                lock:true,
                ok:true,
                follow: document.getElementById('logoNav')
            });
        }
        if(username != "" && password != ""&&res == true) {
            $.ajax({
                type: "POST",                   //类型，POST或者GET
                url: "/login",        //后台url
                data: {                          //数据
                    name: username,
                    pwd: password
                },
                dataType: 'json',              //数据返回类型，可以是xml、json等
                success: function (data) {      //成功，回调函数
                    console.log(data);
                    if (data.result == '0') {
                        var dialog = art.dialog({
                            title: '提示',
                            content: '该用户不存在，请重新输入！',
                            lock:true,
                            ok:true,
                            follow: document.getElementById('logoNav')
                        });
                        reset();
                    } else if (data.result == 'success') {
                        location.href = ("/index");
                    }else  if (data.result == '1') {
                        var dialog = art.dialog({
                            title: '提示',
                            content: '密码错误，请重新输入！',
                            lock:true,
                            ok:true,
                            follow: document.getElementById('logoNav')
                        });
                        reset();
                    }else {
                        alert('未知错误，登录失败！');
                        reset();
                    }
                },
                error: function (err) {          //失败，回调函数
                    alert('未知错误，登录失败！');
                    console.log(err);
                }
            });
        }
    });

    //回车事件
    $(document).keyup(function(event){
        if(event.keyCode ==13){
            $("#login").trigger("click");
        }
    });

    //清空input
    function reset() {
        $("#username").val("");
        $("#password").val("");
    }


});
function checkID() {
    var usr = localStorage.getItem("loginName");
    var psw = localStorage.getItem("loginPwd");
    if(usr!==null)
    {
        $('#username').val(usr);
        $('#password').val(psw);
        return usr;
    }else{
        return 0;
    }
}