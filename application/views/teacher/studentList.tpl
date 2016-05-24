<div class="container-fluid"  style="background-color:rgba(255,255,255,0.5);">
  <div class="row-fluid">
    <div class="span12">
      <div class="page-header">
        <h3 align=center>
             学生名单
        </h3>
      </div>
      <div style="width: 100%">
        <{$value=course::getCourseById()}>
        <div style="width: 50%;float: left" align=center>课程代码：<{$value[0]['courseId']}></div>
        <div style="width: 50%;float: right" align=center>课程名称： <{$value[0]['name']}></div>
      </div>
    </div>
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
       <th>序号：</th>
       <th>学号：</th>
       <th>姓名：</th>
       <th>班级：</th>
       <th>专业：</th>
       <th>学院：</th>

     </tr>
     </thead>
      <tbody>
      <{$valueA=Course::getStudentByCourseId()}>
      <{$i=1}>
      <{foreach from=$valueA item=tt}>
        <tr>
         <td><{$i++}>
         </td>
          <td><{$tt['studentId']}>
          </td>
          <td><{$tt['name']}>
          </td>
          <td><{$tt['class']}>
          </td>
          <td><{$tt['major']}>
          </td>
          <td><{$tt['college']}>
          </td>
        </tr>
        <{/foreach}>
      </tbody>
    </table>
  </div>
</div>