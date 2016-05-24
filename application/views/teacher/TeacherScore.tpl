<div class="container">
    <h1 class="text-center">Score Typing Table</h1>
    <hr />
    <div id="toolbar">
        <div class="col-sm-2">
            <button id="editable" value="1" class="btn btn-warning">编辑中</button>
        </div>
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <select name="course" id="courseId" onchange="onchangeCourse(this)" class="form-control btn-success">
                <option value=0>选择课程</option>
                <{$course = TeacherScore::getCourse()}>
                <{foreach from=$course item=c}>
                    <option value= <{$c['courseId']}>><{$c['name']}></option>
                <{/foreach}>
            </select>
        </div>
    </div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-search="true"
           data-show-refresh="true"
           data-show-toggle="true"
           data-show-columns="true"
           data-show-export="true"
           data-response-handler="responseHandler"
           data-id-field="studentId"
           data-url="resource/data"
           data-striped="true"
           data-pagination = "true"
           data-page-list = "[20,50,100,200]">
        <thead>
        <tr>
            <th data-width="30%" data-align="center" data-field="studentId" data-sortable="true">学号</th>
            <th data-width="30%" data-align="center" data-field="name">姓名</th>
            <th data-width="40%" data-align="center" data-field="score" data-editable="true" data-type="number">成绩</th>   <!--data-type需要核对-->
        </tr>
        </thead>
    </table>
    <br />
    <div>
        <button id="submit" class="btn btn-success btn-block btn-lg btn-outline">Update</button>
    </div>
</div>



<script>
    $.fn.editable.defaults.mode = 'inline';

    var $editable = $('#editable');
    $editable.on('click',function(){
        $('#table .editable').editable('toggleDisabled');
        changeState(this);
    });

    $('#table .editable').editable({
        type: 'number',
        title: 'Enter Score'
    });
    $('#table .editable').on('hidden', function(e, reason){
        alert("hidden");
        if(reason === 'save' || reason === 'nochange') {
            var $next = $(this).closest('tr').next().find('#score');
            if($('#autoopen').is(':checked')) {
                setTimeout(function() {
                    $next.editable('show');
                }, 300);
            } else {
                $next.focus();
            }
        }
    });
    function changeState(target) {
        if(target.value == 0) {
            target.value="1";
            target.className="btn btn-warning";
            target.innerHTML="编辑中";
        }else {
            target.value="0";
            target.className="btn btn-default";
            target.innerHTML="未编辑";
        }
    }
</script>

<script>
    $('#table').bootstrapTable( { 'exportTypes': ['excel', 'txt'] } );
</script>

<script>
    // make editable regions from plugin
    $('td span').editable({
        type: 'number',
        name: 'score',
        url: '/teacherapi/updatescore',
        title: 'Enter score'
    });

    // takes the name from the header and uses that as our return key for json
    $('#submit').on('click',function(){
        // try josn
        var tbl = $('tbody tr').map(function(i, v) {
            var $td = $('td', this);
            return {
                studentId: $td.eq(0).text(), // ++i
                name: $td.eq(1).text(),
                score: $td.eq(2).text()
            };
        }).get();

        //$("code p").html(JSON.stringify(tbl));
        // Save the amended table to LocalStorage - overwrite
        localStorage.setItem("tbljson", JSON.stringify(tbl));

        var courseId = $('#courseId').children('option:selected').val();

        // 上传数据库
        $.ajax({
            type: "POST",
            url: "/teacherapi/updatescore",
            data: { student: localStorage.getItem("tbljson"), courseId: courseId },
            success: function (result) {
                alert("Success! Affected Rows:" + result);
                //alert(result);
            },
            error: function (error) {
                alert("error:" + error);
            }
        });
    });//end click

</script>

<script>
    // 提取courseId的学生
    // !清空页面localdata json；
    var $table = $('#table');

    // javascript方式
    function onchangeCourse(object) {
        //alert(object.value);    //courseId
        $.ajax({
            url: "/teacherapi/getstudent?courseId="+object.value,
            success: successCallback,
            error: errorCallback
        });
    }
    function successCallback(json) {
        //alert("successCallback");
        json = $.parseJSON(json);
        $table.bootstrapTable('load', json);
    }
    function errorCallback(json) {
        alert("查询出现错误.");
    }
</script>

