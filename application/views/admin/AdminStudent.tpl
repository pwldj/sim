
<div id="toolbar" class="btn-group">
    <button type="button" class="btn btn-default" onclick="addstudent()" data-toggle="modal" data-target="#modalTable" data-backdrop="static">
        <i class="glyphicon glyphicon-plus"></i>
    </button>

    <button type="button" class="btn btn-default" onclick="deletestudent()" >
        <i class="glyphicon glyphicon-trash"></i>
    </button>
</div>

<div class="container">
<table id="table"
       class="col-lg-1"
       data-toggle="table"
       data-show-export="true"
       data-pagination="true"
       data-click-to-select="true"
       data-sort-name="studentId"
       data-sort-order="asc"
       data-search="true"
       data-show-toggle="true"
       data-unique-id="studentId"
       data-maintain-selected="true"
       data-toolbar="#toolbar">
    <thead>
    <tr>
        <th data-field="state" data-checkbox="true"></th>
        <th data-field="studentId" data-sortable="true">学号</th>
        <th data-field="name" data-sortable="true">姓名</th>
        <th data-field="password" data-sortable="true" data-visible="false">密码</th>
        <th data-field="sex" data-sortable="true">性别</th>
        <th data-field="class" data-sortable="true">班级</th>
        <th data-field="EnrollmentYear" data-sortable="true">入学年份</th>
        <th data-field="self_description" data-visible="false">自我介绍</th>
        <th data-field="majorName" data-sortable="true">专业</th>
        <th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
    </tr>
    </thead>
</table>
</div>

<div class="container">
    <!-- Button trigger modal -->
    <div class="modal fade" id="modalTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" style="font-family:'microsoft yahei',Arial,sans-serif;font-style: italic">编辑</h3>
                </div>
                <div class="modal-body">
                    <form id="edit_form" class="form-horizontal">
                            <div class="form-group" id="sd">
                                    <label class="col-sm-2 control-label" for="in_studentId">学号</label>
                                <div class="col-sm-9">
                                    <input id="in_studentId" type="text" placeholder="" class="form-control" >
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Text input-->
                                    <label class="col-sm-2 control-label" for="in_name">姓名</label>
                                <div class="col-sm-9">
                                    <input id="in_name" type="text" placeholder="" class="form-control" >
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Text input-->
                                    <label  class="col-sm-2 control-label"  for="in_password" >密码</label>
                                <div class="col-sm-7">
                                    <input id="in_password" type="password" placeholder="" class="form-control" readonly>
                                </div>
                                <button type="button" class="btn btn-info"  onclick="pwd_reset()">重置</button>
                            </div>
                            <div class="form-group">
                                <!-- Select Basic -->
                                    <label for="in_sex" class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-9">
                                    <select id="in_sex" class="form-control">
                                        <option>男</option>
                                        <option>女</option>
                                        <option></option></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Text input-->
                                    <label class="col-sm-2 control-label" for="in_class">班级</label>
                                <div class="col-sm-9">
                                    <input id="in_class" type="text"  class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Select Basic -->
                                    <label for="selectYear" class="col-sm-2 control-label">入学年份</label>
                                <div class="col-sm-9">
                                        <select id="selectYear" class="form-control" ></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Select Multiple -->
                                    <label for="in_selfd" class="col-sm-2 control-label">自我描述</label>
                                <div class="col-sm-9">
                                    <textarea id="in_selfd" class="form-control" rows="5" readonly>
                                        </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Select Basic -->
                                    <label for="in_major" class="col-sm-2 control-label">专业</label>
                                <div class="col-sm-9">
                                    <select id="in_major" class="form-control"></select>
                                 </div>
                            </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" id="edit_btn" class="btn btn-info"  onclick="submit()">提交</button>
                        <button type="button" id="add_btn" class="btn btn-info" onclick="add_submit()">添加</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>

<script>
    var $table = $('#table');
    var edit_index;
    var tagNum=0;
    $(function () {
        $.ajax({
            url: "/adminapi/getalluser",
            success: function successCallback(json){
                json = $.parseJSON(json);
                $table.bootstrapTable('load', json);
            },
            error: errorCallback
        });
    });

    $(function(){
        $.ajax({
           url:"/adminapi/getallmajor",
            success:  function successCallback_major(json)
            {
                json_major=$.parseJSON(json);
                var optionstring = "";
                for(var item in json_major)
                {
                    optionstring += "<option value=\""+ json_major[item].name +"\" >"+ json_major[item].name +"</option>";
                }
                jQuery("#in_major").html(optionstring);
            },
            error:errorCallback
        });
    });

    function errorCallback(error) {
        alert("查询出现错误: "+JSON.stringify(error));
    }


    function actionFormatter(value, row, index) {
        return [
            '<a class="edit" data-toggle="modal" data-target="#modalTable" data-backdrop="static" style="margin-right: 2px" href="javascript:void(0)" title="Edit">',
            '<i class="glyphicon glyphicon-edit"></i>',
            '</a>',
        ].join('');
    }
    window.actionEvents = {

        'click .edit': function (e, value, row, index) {
            edit_index=index;
            document.getElementById('sd').style.display="block";
            document.getElementById('edit_btn').style.display="inline";
            document.getElementById('add_btn').style.display="none";
            document.getElementById("in_studentId").value=row.studentId;
            document.getElementById("in_name").value=row.name;
            document.getElementById("in_password").value=row.password;
            document.getElementById("in_sex").value=row.sex;
            document.getElementById("in_class").value=row.class;
            document.getElementById("selectYear").value=row.EnrollmentYear;
            document.getElementById("in_selfd").value=row.self_description;
            document.getElementById("in_major").value=row.majorName;
        },
    };

    function pwd_reset() {

        document.getElementById('in_password').value="123456";
        submit();
        alert("已将密码初始化为：123456" );
    }


    var startYear=1990;//起始年份
    var endYear=new Date().getUTCFullYear();//终止年份（当前年份）
    var obj=document.getElementById('selectYear')
    onload=function(){
        for (var i=startYear;i<=endYear;i++)
            obj.options.add(new Option(i,i));
        obj.options[obj.options.length-1].selected=1
    }

   function submit()                //编辑
   {
       var data ={
           studentId: document.getElementById('in_studentId').value,
           password:document.getElementById('in_password').value,
           name: document.getElementById('in_name').value,
           sex:document.getElementById('in_sex').value,
           class:document.getElementById("in_class").value,
           EnrollmentYear:document.getElementById("selectYear").value,
           self_description:document.getElementById("in_selfd").value,
           majorName:document.getElementById("in_major").value,
       };
       $.ajax({
           url: "/adminapi/updatestudent",
           type:"post",
           data:data,
           dataType: 'json',
           success:function successCallback_update(json){
               $('#table').bootstrapTable('updateRow',{index:edit_index,row:data});
               alert("更新成功！"+name);
           },
           error: errorCallback
       });
       $('#modalTable').modal('hide');

   }


    function deletestudent()
    {
        if(confirm("你确认要删除吗？")){
            var data=$table.bootstrapTable('getAllSelections');
            var post_Data=[];
            for(var i=0;i<data.length;i++)
                post_Data.push( { data : data[i]["studentId"] } );
            $.ajax({
                url: "/adminapi/deletestudent",
                type:"post",
                data:{data:post_Data},
                success:  function successCallback_delete(json){
                    for(var item in data)
                        $table.bootstrapTable('removeByUniqueId',data[item].studentId);
                    alert("删除成功!"+json.toString());
                },
                error: errorCallback
            });
        }
        else
        {

        }
    }


    function addstudent()     //添加
    {
        document.getElementById('sd').style.display="none";
        document.getElementById('edit_btn').style.display="none";
        document.getElementById('add_btn').style.display="inline";
        document.getElementById("in_name").value="";
        document.getElementById("in_password").value="123456"
        document.getElementById("in_sex").value="";
        document.getElementById("in_class").value="";
        document.getElementById("in_selfd").value="";
        document.getElementById("in_major").value="";
    }
    function add_submit()
    {
        var data ={
            name: document.getElementById('in_name').value,
            password: document.getElementById('in_password').value,
            sex:document.getElementById('in_sex').value,
            sclass:document.getElementById("in_class").value,
            EnrollmentYear:document.getElementById("selectYear").value,
            self_description:document.getElementById("in_selfd").value,
            majorName:document.getElementById("in_major").value
        };
        $.ajax({
            url: "/adminapi/addstudent",
            type:"post",
            data:data,
            success: successCallback_add,
            error: errorCallback_add
        });
        $('#modalTable').modal('hide');
        function successCallback_add(json){
            alert(json.toString());
            $(function () {
                $.ajax({
                    url: "/adminapi/getalluser",
                    success: function successCallback(json){
                        json = $.parseJSON(json);
                        $table.bootstrapTable('load', json);
                        alert("添加成功！"+name);
                    },
                    error: errorCallback
                });
            });
        }
        function errorCallback_add(error){
            alert('添加失败'+error);
        }
    }

    $table.on('toggle.bs.table', function (e, $element) {
        if(tagNum%2==0){
            $table.bootstrapTable('showColumn','self_description');
        }
        else{
            $table.bootstrapTable('hideColumn','self_description');
        }
        tagNum+=1;
    });
</script>
