
<div class="container-fluid" >
    <div class="row-fluid">
        <div class="span12">
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
                  <th data-field="testtime">
                    考试时间
                  </th>
                </tr>
              </thead>
            </table>
        </div>
    </div>
</div>

<script>
  var $table = $('#table');
  $(function () {
    $.ajax({
      url: "/studentapi/getcoursebystuid",
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

</script>
