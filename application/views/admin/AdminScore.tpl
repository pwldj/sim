<div class="container-fluid" style="background-color:rgba(255,255,255,0.5);">
    <div class="row">
        <label for="college" class="col-lg-1 control-label" style="text-align:center" >学院</label>
        <div class="col-lg-2">
            <select id="college" class="form-control" onchange="major_option()">
            </select>
        </div>
        <label for="major" class="col-sm-1 control-label" style="text-align:center" >专业</label>
        <div class="col-lg-2">
            <select id="major" class="form-control">
            </select>
        </div>
    </div>
    <div class="row">
        <label for="studentId" class="col-sm-1 control-label" style="text-align:center" >学生号</label>
        <div class="col-lg-2">
            <input class="form-control" id="studentId" >
        </div>
        <label for="courseId" class="col-sm-1 control-label" style="text-align:center" >课程号</label>
        <div class="col-lg-2" >
            <input class="form-control" id="courseId" >
        </div>
        <button type="button" class="btn btn-default" id="insert" onclick="score_search()">查询</button>
    </div>
    <div class="row">
        <div class="col-md-6" ><table id="table"
                     data-toggle="table"
                     data-search="true"
                     data-show-export="true"
                     data-pagination="true"
                     data-click-to-select="true"
                     data-toolbar="#toolbar" >
                <thead>
                <tr>
                    <th data-field="SId" data-sortable="true">学号</th>
                    <th data-field="Sname">学生姓名</th>
                    <th data-field="CId">课程号</th>
                    <th data-field="Cname">课程名称</th>
                    <th data-field="score" data-sortable="true">成绩</th>
                </tr>
                </thead>
            </table></div>
        <div class="col-md-2" >
            <table id="statistic"
                   data-toggle="table"
                   data-show-export="true"
                   data-pagination="true"
                   data-click-to-select="true"
                   data-toolbar="#toolbar" >
                <thead>
                    <tr class="row-md-2">
                        <th data-field="name">名称</th>
                        <th data-field='arr'>成绩统计信息</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="col-md-4" id="container"></div>
    </div>

    <div id="container1"></div>
</div>
<script type="text/javascript" src="../../../resource/My_js/AdminGetScores.js"></script>
<script type="text/javascript" src="../../../resource/tableExport.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
