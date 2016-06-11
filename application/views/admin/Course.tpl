
<div class="text-center">
    <h1 class="text-center text-primary">北京化工大学排课系统</h1>
</div>
<div class="text-center form-group ">
    <div class="pull-left" >
        <label for="college">学院</label><select id="college" class="form-control input-lg" onchange="course_option()">
        </select>
    </div>
    <div class="pull-left">
        <label for="course">课程</label><select id="course" class="form-control input-lg">
        </select>
    </div>
    <div class="pull-left">
        <label for="startW">起始周</label><select id="startW" class="form-control input-lg" >
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
        <label for="endW">结束周</label><select id="endW" class="form-control input-lg" >
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
        <label for="week">星期</label><select id="week" class="form-control input-lg" >
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
        <label for="startJ">起始节</label><select id="startJ" class="form-control input-lg" >
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
        <label for="endJ">结束节</label><select id="endJ" class="form-control input-lg">
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
    <div class="pull-left ">
        <label for="classroom">查找教室</label><select onclick="classroom_option()" id="classroom" class="form-control input-lg" >
        </select>
    </div>
</div>
<div >
    <button id="but" type="button" class="btn btn-default btn-lg" onclick="select_option()">确定</button>
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
            <th data-field="courseid">课程编号</th>
            <th data-field="name">课程名称</th>
            <th data-field="Place">上课教室</th>
            <th data-field="weeknum">星期</th>
            <th data-field="startweek">开课周</th>
            <th data-field="endweek">结课周</th>
            <th data-field="startsection">上课时间</th>
            <th data-field="endsection">下课时间</th>
        </tr>
        </thead>
    </table>
    <script>
        var $table = $('#table');
        var data={ sql:'select workout_course.id,workout_course.courseid,course.name,classroom.Place,weeknum,startweek,endweek,startsection,endsection from workout_course,course,classroom where classroom.Id=workout_course.classroomid and course.courseId=workout_course.courseid ORDER BY (workout_course.id) DESC;'};
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
    //学院与课程获取
    $(function() {
        college_option();
        $("#course").append("<option value=" + "NULL" + "></option>");
        $("#classroom").append("<option value=" + "NULL" + "></option>");
    });
    //学院查询
    function college_option()
    {
        var data={ sql:'select name,collegeId from college'};
        $.ajax({
            url: "/adminapi/getall",
            type:"post",
            data:data,
            success: function successCallback(json) {
                json = $.parseJSON(json);
                $("#college").append("<option value=" + "NULL" + ">请选择</option>");
                for (var i = 0; i < json.length; i++) {
                    $("#college").append("<option value=" + json[i].collegeId + ">" + json[i].name + "</option>");
                }
            },
            error: function errorCallback(){
                alert("学院查询出现错误!");
            }
        });
    }
    //课程查询
    function course_option()
    {
        var data={ sql:'select name,courseId, capacity from course where collegeId=\''+document.getElementById("college").value+'\'' };
        $.ajax({
            url: "/adminapi/getall1",
            type:"post",
            data:data,
            success: function successCallback(json)
            {
                json = $.parseJSON(json);
                //清空所有选项
                $("#course").empty();//Jquery 清空选项
                $("#course").append("<option value=" + "NULL" + ">请选择</option>");
                for (var i = 0; i < json.length; i++) {
                    var x=json[i].courseId;
                    var y=json[i].name;
                    var z=json[i].capacity;
                  $("#course").append("<option value=" + x + ">" + y  + "("+z +")"+json[i].count+"</option>");
                   // var data ={ sql:'select * from workout_course where  workout_course.courseid=\''+x+'\''};
                   /* $.ajax({
                        url: "course/getall",
                        type:"post",
                        data:data,
                        success: function successCallback(json) {
                            json = $.parseJSON(json);
                            $("#course").append("<option value=" + json[0].courseId + ">" + json[0].name  + "("+json[0].capacity +")"+json.length+"</option>");
                            //course=json[i].name;
                        },
                        error: function errorCallback(){
                            alert("课程显示出现错误!");
                        }

                    });*/
                }
            },
            error: function errorCallback(){
                alert("课程查询出现错误!");
            }
        });
    }
    function classroom_option()
    {
        var data={ sql:'select Id,Place ,Capacity from classroom where Capacity>=(select capacity from course where courseId=\''+document.getElementById("course").value+'\') and Id not in ( select classroomid from workout_course where weeknum = \''+document.getElementById("week").value+'\' and ((startweek<=\''+document.getElementById("startW").value+'\' and \''+document.getElementById("startW").value+'\'<=endweek) or (startweek<=\''+document.getElementById("endW").value+'\' and \''+document.getElementById("endW").value+'\'<=endweek)) and ((startsection<=\''+document.getElementById("startJ").value+'\' and \''+document.getElementById("startJ").value+'\'<=endsection) or (startsection<=\''+document.getElementById("endJ").value+'\' and \''+document.getElementById("endJ").value+'\'<=endsection)))' };
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
        var data={ sql: 'select * from workout_course where courseid in ( select courseid from courseselection_tea where teacherId=(select teacherId from courseselection_tea where courseId=\''+document.getElementById("course").value+'\')) and weeknum = \''+document.getElementById("week").value+'\' and ((startweek<=\''+document.getElementById("startW").value+'\' and \''+document.getElementById("startW").value+'\'<=endweek) or (startweek<=\''+document.getElementById("endW").value+'\' and \''+document.getElementById("endW").value+'\'<=endweek)) and ((startsection<=\''+document.getElementById("startJ").value+'\' and \''+document.getElementById("startJ").value+'\'<=endsection) or (startsection<=\''+document.getElementById("endJ").value+'\' and \''+document.getElementById("endJ").value+'\'<=endsection))' };
        $.ajax({
            url: "/adminapi/getall",
            type:"post",
            data:data,
            success: function successCallback(json)
            {
                json = $.parseJSON(json);
                if(json.length>0)
                        {
                            var data ={ sql:'select classroom.Place,course.name ,workout_course.startsection,workout_course.endsection from classroom,course ,workout_course where classroom.Id=\''+json[0].classroomid+'\' and course.courseId=\''+json[0].courseid+'\' and workout_course.weeknum=\''+json[0].weeknum+'\' and workout_course.startsection=\''+json[0].startsection+'\' and workout_course.endsection=\''+json[0].endsection+'\' and workout_course.startweek=\''+json[0].startweek+'\' and workout_course.endweek=\''+json[0].endweek+'\' and workout_course.courseid=course.courseId and workout_course.classroomid=classroom.Id' }
                            $.ajax({
                                url: "/adminapi/getall",
                                type: "post",
                                data: data,
                                success: function successCallback(json) {
                                    json = $.parseJSON(json);
                                    alert('时间冲突\n该时间该教师在\'' + json[0].Place + '\'上\'' + json[0].name + '\'课(第\'' + json[0].startsection + '\'节-第\'' + json[0].endsection + '\'节)');
                                },
                                error: function errorCallback() {
                                    alert("出现错误!");
                                }
                            });
                        }
                else
                        {
                            insert_option();
                        }
                //清空所有选项
            },
            error: function errorCallback(){
                alert("出现错误!");
            }
        });
    }
    function insert_option()
    {
            if (document.getElementById('endJ').value >= document.getElementById('startJ').value )
            {
                if (document.getElementById('endW').value >= document.getElementById('startW').value)
                {
                    var data = {
                        weeknum: document.getElementById('week').value,
                        startsection: document.getElementById('startJ').value,
                        endsection: document.getElementById('endJ').value,
                        classroomid: document.getElementById('classroom').value,
                        courseid: document.getElementById('course').value,
                        startweek: document.getElementById('startW').value,
                        endweek: document.getElementById('endW').value,
                        occupationreason: '上课'
                    };
                    $.ajax({
                        url: "/adminapi/insert",
                        type: "post",
                        data: data,
                        success:  function successCallback(json) {

                         alert("插入成功!");
                            selectall();
                         //reloadtable();
                         },
                        error: function errorCallback() {
                            alert("插入出现错误!");
                        }
                    });
                }
                else{
                    alert("时间错误！");
                }
            }
            else {
                alert("时间错误！");
            }
    }
</script>