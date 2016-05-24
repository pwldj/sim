
<div class="container-fluid" style="background-color:rgba(255,255,255,0.5);">
    <div class="row-fluid">
        <table
                id="table"
                data-toggle="table"
                data-show-export="true"
                data-pagination="true"
                data-click-to-select="true"
                data-toolbar="#toolbar"
                data-search="true"
                data-show-toggle="true"
                class="table table-condensed table-bordered">
            <thead>
            <tr>
                <th data-field="state" data-checkbox="true"></th>
                <th data-field="courseId">
                    课程代码
                </th>
                <th data-field="name">
                    课程名称
                </th>
                <th data-field="property">
                    课程性质
                </th>
                <th data-field="direction">
                    专业方向
                </th>
                <th data-field="credit">
                    学分
                </th>
                <th data-field="classhour">
                    周学时
                </th>
                <th data-field="teachername">
                    教师姓名
                </th>
                <th data-field="weeknum">
                    上课时间
                </th>
                <th data-field="Place">
                    上课地点
                </th>
                <th data-field="testtime">
                    考试时间
                </th>
                <th data-field="capacity">
                    容量
                </th>
                <th data-field="margin">
                    余量
                </th>
                <th data-field="belong">
                    课程归属
                </th>
                <th data-field="campus">
                    校区代码
                </th>
                <th data-field="collegeId">
                    开课学院
                </th>

            </tr>
            </thead>
        </table>
    </div>
    <div class="form-group" style="float: right ">
        <button id="school_select" type="button" class="btn btn-primary" onclick="submit()">提交</button>
    </div>
</div>
<script>
    var $table = $('#table');
    $(function () {
        fresh();
    });
    function fresh() {
        $.ajax({
            url: "/studentapi/getpebystuid",
            type:"get",
            success: successCallback,
            error: errorCallback
        });
    }
    function successCallback(json){
        json = $.parseJSON(json);
        $table.bootstrapTable('load', json);
    }
    function errorCallback() {
        alert("查询出现错误: ");
    }
    function submit() {
        var post_Data = [];
        var data = $table.bootstrapTable('getSelections');
        for(var i= 0;i<data.length;i++)
            post_Data.push({data:data[i]["courseId"]});
        $.ajax({
            url:"/studentapi/selectcourse",
            type:"post",
            data:{data:post_Data},
            success:submit_success,
            error:submit_error
        });
    }
    function submit_success() {
        alert("选课成功");
        fresh();
    }
    function submit_error() {
        alert("选课失败")
    }
</script>