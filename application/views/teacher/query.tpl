<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="page-header">

                <h1>
                    教务管理系统
                </h1>
            </div>
        </div>
        <table id="tableTea"
               data-toggle="table"
               data-show-export="true"
               data-pagination="true"
               data-click-to-select="true"
               data-toolbar="#toolbar"
               data-search="true"
               data-show-toggle="true">
            <class="table table-condensed table-bordered">
            <thead>
            <tr>
                <th data-field="teacherId">
                    教师号
                </th>
                <th data-field="teachername">
                    教师名字
                </th>
                <th data-field="courseid">
                    课程号
                </th>
                <th data-field="name">
                    课程名称
                </th>
                <th data-field="time">
                    上课时间
                </th>
                <th data-field="classname">
                    上课地点
                </th>
            </tr>
            </thead>
        </table>
        <script>
                var $table = $('#tableTea');
                $(function () {
                    $.ajax({
                        url: "/teacherapi/Tea",
                        type:"get",
                        success: successCallback,
                        error: errorCallback
                    });
                });
                function successCallback(json){
                    json = $.parseJSON(json);
                    $table.bootstrapTable('load', json);
                }
                function errorCallback() {
                    alert("查询出现错误: ");
                }
            function outBack() {
                window.location.href='Admin';
            }
        </script>
</div>
</div>