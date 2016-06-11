<div class="container-fluid"  >
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
        <th>
          课程代码
        </th>
        <th>
          课程名称
        </th>
        <th>
          课程性质
        </th>
        <th>
          专业方向
        </th>
        <th>
          学分
        </th>
        <th>
          周学时
        </th>
        <th>
          考试时间
        </th>
        <th >
          上课时间
        </th>
        <th>
          上课地点
        </th>
        <th>
          起始结束周
        </th>
        <th>
          容量
        </th>
        <th>
          余量
        </th>
        <th>
          校区代码
        </th>
        <th>
          开课学院
        </th>
        <th>
          学生名单
        </th>
      </tr>
      </thead>
      <tbody>
      <{$valueA=Teacher::getAllCourseByTeaId()}>
      <{foreach from=$valueA item=tt}>
      <tr>
      <td><{$tt['courseid']}> </td>
      <td> <{$tt['name']}></td>
      <td> <{$tt['property']}></td>
      <td> <{$tt['direction']}></td>
      <td><{$tt['credit']}> </td>
      <td><{$tt['classhour']}> </td>
      <td><{$tt['testtime']}> </td>
        <td><{$tt['time']}></td>
      <td><{$tt['classname']}> </td>
      <td> <{$tt['startend']}></td>
      <td> <{$tt['capacity']}></td>
      <td> <{$tt['margin']}></td>
      <td> <{$tt['campus']}></td>
      <td><{$tt['collegeId']}></td>
      <td>
        <button type="button" class="btn btn-primary" onclick="detail(<{$tt['courseid']}> )">详细</button>
      </td>
      </tr>
      <{/foreach}>
      </tbody>
    </table>

  </div>
  <div style="float: inherit">
    <button type="button" class="btn btn-primary" onclick="outBack()">退出</button>
  </div>
  <script>
    function detail(courseId) {
     document.cookie="courseid="+courseId;
     window.location.href='/teacher/studentList';
    }
    function outBack() {
      window.location.href='login';
    }
  </script>
