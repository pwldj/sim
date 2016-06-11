<div class="container-fluid" >
    <div class="row-fluid">
        <div class="span12">
            <span >
                 <form name="testform" action="" method="post">
                     <input class="input-sm" id="yeartext" type="text" name="yeartext" placeholder="学年">
                     <button class="btn btn-primary" id="logbutten" type="button" onclick="getscore()">学年成绩查询</button>
                     <button class="btn btn-primary" type="button" onclick="getallscore()" >全部成绩成绩查询</button>
                 </form>
            </span>
        </div>
        <div>
        <table id="table"
               data-toggle="table"
               data-show-export="true"
               data-pagination="true"
               data-click-to-select="true"
               data-toolbar="#toolbar">
            <thead>
            <tr>
                <th data-field="Sname">学生姓名</th>
                <th data-field="courseId">课程代码</th>
                <th data-field="Cname">课程名称</th>
                <th data-field="property">课程性质</th>
                <th data-field="direction">专业方向</th>
                <th data-field="credit">学分</th>
                <th data-field="score">成绩</th>
                <th data-field="coname">开课学院</th>

            </tr>
            </thead>
        </table>
        </div>
    </div>
</div>
        <script>
            var $table = $('#table');
            function getscore() {
                var data={
                    yeartext:document.getElementById("yeartext").value
                };
                $.ajax({
                    url: "/studentapi/getyearscore",
                    type:"post",
                    data:data,
                    success: successCallback,
                    error: errorCallback

                });
            }
            $(function () {
                $('#toolbar').find('select').change(function () {
                    $table.bootstrapTable('destroy').bootstrapTable({
                        exportDataType: $(this).val()
                    });
                });
            });

            function getallscore() {
                $.ajax({
                    url: "/studentapi/getallscore",
                    success: successCallback,
                    error: errorCallback
                });
            }
            function successCallback(json){

                var rows=[];
                json = $.parseJSON(json);
                for(var i=0;i<json.length;i++){
                    rows.push({

                        Sname:json[i].name,
                        Nam:json[i].Nam,
                        score:json[i].score,
                        property:json[i].property,
                        courseId:json[i].courseId,
                        direction:json[i].direction,
                        credit:json[i].credit,
                        coname:json[i].name
                    });
                }
                $table.bootstrapTable('load', json);

            }
            function errorCallback() {
                alert("查询出现错误: ");
            }

        </script>
