
    <h1 align="center">课程评价</h1></br>
    <h2 align="center">学生课程信息</h2>
    <table border="3" align="center" width="1000" id="table"
           data-toggle="table"
           data-show-export="true"
           data-pagination="true"
           data-click-to-select="true"
           data-toolbar="#toolbar">
        <thead>
        <tr>
            <th align="center" width="200" data-field="courseid">课程ID</th>
            <th align="center" width="200" data-field="coursename">课程名称</th>
            <th align="center" width="400" data-field="assessment">评价内容</th>
            <th width="200" data-field="action">操作</th>
        </tr>
        </thead>

    </table>
    <script>
        var $table = $('#table');
        $(function () {
            $.ajax({
                url: "/studentapi/geteachcourse",
                success: successCallback,
                error: errorCallback
            });
        });
        function successCallback(json){
            var rows=[];
            json = $.parseJSON(json);//$table.bootstrapTable('load', json);
            for(var i=0;i<json.length;i++){
                rows.push({
                    courseid:json[i].courseid,
                    coursename:json[i].coursename,
                    assessment:json[i].assessment,
                    action:'<a href="editassess?courseId='+json[i].courseid+'" target="_blank" >编辑</a>'
                });
            }

            $table.bootstrapTable('load', rows);
        }
        function errorCallback() {
            alert("查询出现误: ");
        }
    </script>
