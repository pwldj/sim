<div class="container-fluid" >
    <div class="row-fluid">
        <div class="span12">
            <div>
                <div style="float: left"><button id="stuStatement" type="button" class="btn btn-primary" onclick="stuStatement()">生成学生报表</button>
                    <button id="teaStatement" type="button" class="btn btn-primary" onclick="teaStatement()">生成老师报表</button>
                </div>
            </div>
        </div>
    </div>
    <div id="stutable">
    <table id="tableStu"
           data-toggle="table"
           data-show-export="true"
           data-pagination="true"
           data-click-to-select="true"
           data-search="true"
           data-show-toggle="true"
           data-toolbar="#toolbar">
        <thead>
        <tr>
            <th data-field="studentId">
                学生学号
            </th>
            <th data-field="stuName">
                学生姓名
            </th>
            <th data-field="sex">
                学生性别
            </th>
            <th data-field="class">
                学生班级
            </th>
            <th data-field="EnrollmentYear">
                入学年份
            </th>
            <th data-field="majName">
                专业
            </th>
            <th data-field="colName">
                学院
            </th>
        </tr>
        </thead>
    </table>
    </div>
    <div id="teatable">
    <table id="tableTea"
           data-toggle="table"
           data-show-export="true"
           data-pagination="true"
           data-click-to-select="true"
           data-toolbar="#toolbar"
           data-search="true"
           data-show-toggle="true">
        <thead>
        <tr>
            <th data-field="teacherId">
                教师号
            </th>
            <th data-field="teaName">
                姓名
            </th>
            <th data-field="sex">
                性别
            </th>
            <th data-field="colName">
                学院
            </th>
        </tr>
        </thead>
    </table>
    </div>
    <script>
        //康宁代码
        var $tablestu = $('#tableStu');
        var $tabletea = $('#tableTea');
        $(function () {
            $('#toolbar').find('select').change(function () {
                $tabletea.bootstrapTable('destroy').bootstrapTable({
                    exportDataType: $(this).val()
                });
                $tablestu.bootstrapTable('destroy').bootstrapTable({
                    exportDataType: $(this).val()
                });
            });
            $('#stutable').css("display","none");
            $('#teatable').css("display","none");

        });
        function stuStatement() {
            $.ajax({
                url: "/adminapi/statestu",
                type:"get",
                success: successCallback,
                error: errorCallback
            });

            function successCallback(json){
                json = $.parseJSON(json);
                $tablestu.bootstrapTable('load', json);
                $('#stutable').css("display","block");
                $('#teatable').css("display","none");
            }
            function errorCallback() {
                alert("查询出现错误: ");
            }
        }
        function teaStatement(){
            $.ajax({
                url: "/adminapi/stateTea",
                type:"get",
                success: successCallback,
                error: errorCallback
            });
            function successCallback(json){
                json = $.parseJSON(json);
                $tabletea.bootstrapTable('load', json);
                $('#teatable').css("display","block");
                $('#stutable').css("display","none");

            }
            function errorCallback() {
                alert("查询出现错误: ");
            }
        }


    </script>
