
<div class="text-center">
    <h1 class="text-center text-primary">北京化工大学借教室系统</h1>
</div>
<div class="text-center form-group " align="true">
    <div class="pull-left">
        <h1 class="text-center text-primary">时间</h1>
        <select id="startW" class="form-control input-lg" >
            <option value="1">第一周</option>
            <option value="2">第二周</option>
            <option value="3">第三周</option>
            <option value="4">第四周</option>
            <option value="5">第五周</option>
            <option value="6">第六周</option>
            <option value="7">第七周</option>
            <option value="8">第八周</option>
            <option value="9">第九周</option>
            <option value="10">第十周</option>
            <option value="11">第十一周</option>
            <option value="12">第十二周</option>
            <option value="13">第十三周</option>
            <option value="14">第十四周</option>
            <option value="15">第十五周</option>
            <option value="16">第十六周</option>
        </select>
    </div>
    <div class="pull-left">
        <h1 class="text-center text-primary">星期</h1>
        <select id="week" class="form-control input-lg" >
            <option value="1">周一</option>
            <option value="2">周二</option>
            <option value="3">周三</option>
            <option value="4">周四</option>
            <option value="5">周五</option>
            <option value="6">周六</option>
            <option value="7">周日</option>
        </select>
    </div>
    <div class="pull-left">
        <h1 class="text-center text-primary">起始节</h1>
        <select id="startJ" class="form-control input-lg" >
            <option value="1">第一节</option>
            <option value="2">第二节</option>
            <option value="3">第三节</option>
            <option value="4">第四节</option>
            <option value="5">第五节</option>
            <option value="6">第六节</option>
            <option value="7">第七节</option>
            <option value="8">第八节</option>
            <option value="9">第九节</option>
            <option value="10">第十节</option>
            <option value="11">第十一节</option>
            <option value="12">第十二节</option>
            <option value="13">第十三节</option>
        </select>
    </div>
    <div class="pull-left">
        <h1 class="text-center text-primary">结束节</h1>
        <select id="endJ" class="form-control input-lg">
            <option value="1">第一节</option>
            <option value="2">第二节</option>
            <option value="3">第三节</option>
            <option value="4">第四节</option>
            <option value="5">第五节</option>
            <option value="6">第六节</option>
            <option value="7">第七节</option>
            <option value="8">第八节</option>
            <option value="9">第九节</option>
            <option value="10">第十节</option>
            <option value="11">第十一节</option>
            <option value="12">第十二节</option>
            <option value="13">第十三节</option>
        </select>
    </div>
    <div class="pull-left">
        <h1 class="text-center text-primary">人数</h1>
        <input id="num" type="text" class="form-control input-lg" placeholder="人数">
    </div>
    <div class="pull-left">
        <h1 class="text-center text-primary" onclick="check_classroom_option()">查找教室</h1>
        <select id="classroom" class="form-control input-lg" >
        </select>
    </div>
    <div class="pull-left">
        <h1 class="text-center text-primary">申请原因</h1>
        <input id="reason" type="text" class="form-control input-lg" placeholder="申请原因">
    </div>
    <div class="pull-left">
        <h1 class="text-center text-primary">确定</h1>
        <button type="button" class="btn btn-default btn-lg" onclick="select_option()">确定</button>
    </div>
</div>
<div>
    <table id="table"
           data-toggle="table"
           data-show-export="true"
           data-pagination="true"
           data-click-to-select="true"
           data-search="true"
           data-toolbar="#toolbar">
        <thead>
        <tr>
            <th data-field="id">编号</th>
            <th data-field="startweek">时间(第几周)</th>
            <th data-field="weeknum">星期</th>
            <th data-field="Place">教室</th>
            <th data-field="startsection">开始时间</th>
            <th data-field="endsection">结束时间</th>
            <th data-field="occupationreason">占用原因</th>
        </tr>
        </thead>
    </table>
    <script>
        var $table = $('#table');
        var data={ sql:'select workout_course.id,workout_course.occupationreason,classroom.Place,weeknum,startweek,startsection,endsection from workout_course,classroom where classroom.Id=workout_course.classroomid and  workout_course.courseid=0 ORDER BY (workout_course.id) DESC;'};
        $(function()
        {
            selectall();
        });
        function selectall() {
            $.ajax({
                url: "/adminapi/getall",
                type:"post",
                data:data,
                success: successCallback,
                error: errorCallback
            });
        }
        function successCallback(json){
            json = $.parseJSON(json);
            $table.bootstrapTable('load', json);
        }
        function errorCallback() {
            alert("查询显示出现错误: ");
        }
    </script>
</div>
<script>
    function check_classroom_option()
    {
        var data={ sql:'select Id,Place ,Capacity from classroom where Capacity>=\''+document.getElementById("num").value+'\' and Id not in ( select classroomid from workout_course where weeknum = \''+document.getElementById("week").value+'\'and (startweek<=\''+document.getElementById("startW").value+'\' and \''+document.getElementById("startW").value+'\'<=endweek) and   ((startsection<=\''+document.getElementById("startJ").value+'\' and \''+document.getElementById("startJ").value+'\'<=endsection) or (startsection<=\''+document.getElementById("endJ").value+'\' and \''+document.getElementById("endJ").value+'\'<=endsection)))' };
        $.ajax({
            url: "/adminapi/getall",
            type:"post",
            data:data,
            success: function successCallback(json) {
                json = $.parseJSON(json);
                //清空所有选项
                $("#classroom").empty();//Jquery 清空选项
                $("#classroom").append("<option value=" + "NULL" + ">请选择</option>");
                for (var i = 0; i < json.length; i++) {
                    $("#classroom").append("<option value=" + json[i].Id + ">" + json[i].Place + "("+json[i].Capacity+")"+"</option>");
                    classroom=json[i].Place;
                }
            },
            error: function errorCallback(){
                alert("教室查询出现错误!");
            }
        });
    }
    function select_option()
    {
        var data={ sql: 'select * from workout_course where classroomid=\''+document.getElementById("classroom").value+'\' and weeknum = \''+document.getElementById("week").value+'\' and (startweek<=\''+document.getElementById("startW").value+'\' and \''+document.getElementById("startW").value+'\'<=endweek)  and ((startsection<=\''+document.getElementById("startJ").value+'\' and \''+document.getElementById("startJ").value+'\'<=endsection) or (startsection<=\''+document.getElementById("endJ").value+'\' and \''+document.getElementById("endJ").value+'\'<=endsection))' };
        $.ajax({
            url: "/adminapi/getall",
            type:"post",
            data:data,
            success: function successCallback(json)
            {
                json = $.parseJSON(json);
                if(json.length>0)
                {
                            alert('时间地点冲突');
                }
                else
                {
                    insert_classroom_option();
                }
                //清空所有选项
            },
            error: function errorCallback(){
                alert("出现错误!");
            }
        });
    }
    function insert_classroom_option()
    {
        if (document.getElementById('endJ').value >= document.getElementById('startJ').value )
        {
                var data = {
                    weeknum: document.getElementById('week').value,
                    startsection: document.getElementById('startJ').value,
                    endsection: document.getElementById('endJ').value,
                    classroomid: document.getElementById('classroom').value,
                    courseid: 0,
                    startweek: document.getElementById('startW').value,
                    endweek: document.getElementById('startW').value,
                    occupationreason:document.getElementById('reason').value
                };
                $.ajax({
                    url: "/adminapi/insert",
                    type: "post",
                    data: data,
                    success: function successCallback(json) {

                     alert("插入成功!");
                        selectall();
                     //reloadtable();
                     },
                    error: function errorCallback() {
                        alert("插入出现错误!");
                    }
                });
        }
        else {
            alert("时间错误！");
        }
    }
</script>
