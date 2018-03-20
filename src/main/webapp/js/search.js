/**
 *  创建时间：2017.12.18
 * 创建者：朱佳言
 */
function detailR(obj) {
    var Td = $(obj).parents("tr").children("td");
    var id = Td[0].innerHTML;
    console.log(id);
    $.ajax({
        type: "POST",                   //类型，POST或者GET
        url: "/search/detail",        //后台url
        data: {                          //数据
            motorName: id
        },
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
            debugger;
            console.log(data);
            if(data.state == 0){
                $("#detailForm").html("");
                var i;
                var str ='';
                if(data.result.length == 0){
                    alert("有错");
                }else{
                    $("#detailF").show();
                    for(i=0;i<data.result.length;i++){
                        str = '<tr>\
                        <td>'+data.result[i].motorName+'</td>\
                        <td>'+data.result[i].stationNum+'</td>\
                        <td>'+data.result[i].stationName+'</td>\
                        <td>'+data.result[i].arriveTime+'</td>\
                        <td>'+data.result[i].startTime+'</td>\
                        <td>'+data.result[i].residenceTime+'</td>\
                        <td>'+data.result[i].distance+'</td>\
                        </tr>';
                        $("#detailForm").append(str);
                    }
                }
            }

        },
        error: function (err) {          //失败，回调函数
            console.log(err);
        }
    });
}
$(".short").on("click",function () {
    $.ajax({
        type: "POST",                   //类型，POST或者GET
        url: "/search/short",        //后台url
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
            debugger;
            if(data.state == 0){
                $("#carForm").html("");
                var i;
                var str ='';
                str = '<tr>\
                        <td>'+data.result.motorName+'</td>\
                        <td>'+data.result.carType+'</td>\
                        <td>'+data.result.startName+'</td>\
                        <td>'+data.result.endName+'</td>\
                        <td>'+data.result.startTime+'</td>\
                        <td>'+data.result.endTime+'</td>\
                        <td>'+data.result.miles+'</td>\
                        <td>\
                        <button type="button" class="btn btn-primary" onclick="detailR($(this))">路线查询</button>\
                        </td>\
                        </tr>';
                $("#carForm").append(str);
            }

        },
        error: function (err) {          //失败，回调函数
            console.log(err);
        }
    });
});
$(".cheap").on("click",function () {
    $.ajax({
        type: "POST",                   //类型，POST或者GET
        url: "/search/cheap",        //后台url
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
            debugger;
            console.log(data.result.length);
            if(data.state == 0){
                $("#carForm").html("");
                var i;
                var str ='';
                str = '<tr>\
                        <td>'+data.result.motorName+'</td>\
                        <td>'+data.result.carType+'</td>\
                        <td>'+data.result.startName+'</td>\
                        <td>'+data.result.endName+'</td>\
                        <td>'+data.result.startTime+'</td>\
                        <td>'+data.result.endTime+'</td>\
                        <td>'+data.result.miles+'</td>\
                        <td>\
                        <button type="button" class="btn btn-primary" onclick="detailR($(this))">路线查询</button>\
                        </td>\
                        </tr>';
                $("#carForm").append(str);
            }

        },
        error: function (err) {          //失败，回调函数
            console.log(err);
        }
    });
});
$("#searchInput").on("click",function () {
   var start = $('input[name="start"]').val();
   var end = $('input[name="end"]').val();
    $.ajax({
        type: "POST",                   //类型，POST或者GET
        url: "/search/direct",        //后台url
        data: {                          //数据
            startName: start,
            endName:end
        },
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
            if(data.state == 0){
                $("#carForm").html("");
                var i;
                var str ='';
                if(data.result.length == 0){
                    $("#carForm").html("<td></td><td></td><td></td><td></td><td>暂无直达车次</td></div>");
                }else{
                    for(i=0;i<data.result.length;i++){
                        str = '<tr>\
                        <td>'+data.result[i].motorName+'</td>\
                        <td>'+data.result[i].carType+'</td>\
                        <td>'+data.result[i].startName+'</td>\
                        <td>'+data.result[i].endName+'</td>\
                        <td>'+data.result[i].startTime+'</td>\
                        <td>'+data.result[i].endTime+'</td>\
                        <td>'+data.result[i].miles+'</td>\
                        <td>\
                        <button type="button" class="btn btn-primary" onclick="detailR($(this))">路线查询</button>\
                        </td>\
                        </tr>';
                        $("#carForm").append(str);
                    }
                }
            }

        },
        error: function (err) {          //失败，回调函数
            console.log(err);
        }
    });
});
$("#higher").on("click",function(){
    $("#detailForm").html("");
    $("#higherForm").show();
    $("#normalForm").hide();
    $("#highestForm").hide();
    $("#high").show();
    $("#highest").show();
    //$("#higher").hide();
});
$("#searchHigh").on("click",function () {
    debugger;
    var start = $('input[name="startH"]').val();
    var end = $('input[name="endH"]').val();
    console.log(start);
    console.log(end);
    $.ajax({
        type: "POST",                   //类型，POST或者GET
        url: "/search/center",        //后台url
        data: {                          //数据
            startName: start,
            endName:end
        },
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
            if(data.state == 0){
                $("#carForm").html("");
                var i;
                var str ='';
                console.log(data);
                for(i=0;i<data.result.length;i++){
                    str = '<tr>\
                        <td>'+data.result[i].car.motorName+'</td>\
                        <td>'+data.result[i].car.carType+'</td>\
                        <td>'+data.result[i].car.startName+'</td>\
                        <td>'+data.result[i].car.endName+'</td>\
                        <td>'+data.result[i].car.startTime+'</td>\
                        <td>'+data.result[i].car.endTime+'</td>\
                        <td>'+data.result[i].car.miles+'</td>\
                        <td>\
                        <button type="button" class="btn btn-primary" onclick="detailR($(this))">路线查询</button>\
                        </td>\
                        </tr>';
                    $("#carForm").append(str);
                }
            }
            else if(data.state == 1){
                debugger;
                $("#carForm").html("<td></td><td></td><td></td><td></td><td>暂无直达车次</td></div>");
            }
        },
        error: function (err) {          //失败，回调函数
            console.log(err);
        }
    });
});

$("#highest").on("click",function(){
    $("#detailForm").html("");
    $("#highestForm").show();
    $("#higherForm").hide();
    $("#normalForm").hide();
    $("#higher").show();
    $("#high").show();
    //$("#highest").hide();
});
$("#high").on("click",function(){
    $("#detailForm").html("");
    $("#normalForm").show();
    $("#higherForm").hide();
    $("#highestForm").hide();
    $("#higher").show();
    $("#highest").show();
    //$("#high").hide();
});
$("#searchHigher").on("click",function () {
    debugger;
    var start = $('input[name="startHr"]').val();
    var end = $('input[name="endHr"]').val();
    console.log(start);
    console.log(end);
    $.ajax({
        type: "POST",                   //类型，POST或者GET
        url: "/search/change",        //后台url
        data: {                          //数据
            startName: start,
            endName:end
        },
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
            if(data.state == 0){
                $("#changeForm").html("");
                var title = '<table class="table table-hover">\
                <thead>\
                    <tr class="primary_col">\
                    <th>车次</th>\
                    <th>列车类型</th>\
                    <th>始发站</th>\
                    <th>终点站</th>\
                    <th>出发时间</th>\
                    <th>到达时间</th>\
                    <th>里程</th>\
                    <th>操作</th>\
                    </tr>\
                    </thead>';
                var i;
                var str ='';
                console.log(data);
                for(i=0;i<data.result.length;i++){
                    str = '<tbody id="carForm">';
                    str += '<tr>\
                        <td>'+data.result[i].first.car.motorName+'</td>\
                        <td>'+data.result[i].first.car.carType+'</td>\
                        <td>'+data.result[i].first.car.startName+'</td>\
                        <td>'+data.result[i].first.car.endName+'</td>\
                        <td>'+data.result[i].first.car.startTime+'</td>\
                        <td>'+data.result[i].first.car.endTime+'</td>\
                        <td>'+data.result[i].first.car.miles+'</td>\
                        <td>\
                        <button type="button" class="btn btn-primary" onclick="detailR($(this))">路线查询</button>\
                        </td>\
                        </tr>';
                    str += '<tr>\
                        <td>'+data.result[i].next.car.motorName+'</td>\
                        <td>'+data.result[i].next.car.carType+'</td>\
                        <td>'+data.result[i].next.car.startName+'</td>\
                        <td>'+data.result[i].next.car.endName+'</td>\
                        <td>'+data.result[i].next.car.startTime+'</td>\
                        <td>'+data.result[i].next.car.endTime+'</td>\
                        <td>'+data.result[i].next.car.miles+'</td>\
                        <td>\
                        <button type="button" class="btn btn-primary" onclick="detailR($(this))">路线查询</button>\
                        </td>\
                        </tr></tbody></table>';
                    title += str;
                    $("#changeForm").append(title);
                }
            }
            else if(data.state == 1){
                debugger;

                $("#carForm").html("<td></td><td></td><td></td><td></td><td>暂无可换乘车次</td></div>");
            }
        },
        error: function (err) {          //失败，回调函数
            console.log(err);
        }
    });
});