/**
* 创建时间：2017.12.14
* 创建者：何牧野
*/
$("#logout").on("click",function () {
    $.ajax({
        type: "GET",                   //类型，POST或者GET
        url: "/logout",        //后台url
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
            if(data.result == 1)
            {
                localStorage.status = 0;
                window.location.href = "index";
            }
        },
        error: function (err) {          //失败，回调函数
            alert('未知错误，登录失败！');
            console.log(err);
        }
    });
});