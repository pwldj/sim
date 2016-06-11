
<div class="container-fluid">
    <div class="row-fluid">
        <button id="teaStatement" type="button" class="btn btn-primary" onclick="alltea()">其他老师课表</button>
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
                <th data-field="courseid">
                    课程号
                </th>
                <th data-field="name">
                    课程名字
                </th>
                <th data-field="classhour">
                    上课时间
                </th>
                <th data-field="classname">
                    上课地点
                </th>
            </tr>
            </thead>
            <tbody>
            <{$valueA=statement::getAllCourseByTeaId()}>
            <{foreach from=$valueA item=tt}>
                <tr>
                    <td><{$tt['courseid']}> </td>
                    <td> <{$tt['name']}></td>
                    <td><{$tt['time']}> </td>
                    <td><{$tt['classname']}> </td>
                </tr>
            <{/foreach}>
            </tbody>
        </table>
    <script>
        function alltea() {
            window.location.href='/teacher/query';
        }
    </script>
</div>
</div>