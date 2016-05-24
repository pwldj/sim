<div id="toolbar" class="btn-group">
    <button type="button" class="btn btn-default" onclick="Adminaddteacher()" data-toggle="modal" data-target="#modalForm" data-backdrop="static">
        <i class="glyphicon glyphicon-plus"></i>
    </button>
    <button type="button" class="btn btn-default" onclick="Admindeleteteacher()">
        <i class="glyphicon glyphicon-trash"></i>
    </button>
</div>
<div class="container">
    <table id="table"
           class="col-lg-1"
           data-toggle="table"
           data-search="true"
           data-show-toggle="true"
           data-sort-name="teacherId"
           data-sort-order="asc"
           data-show-export="true"
           data-click-to-select="true"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-maintain-selected="true"
           data-unique-id="teacherId"
           data-search-align="right"
           data-toolbar-align="left"
           data-toolbar="#toolbar">
        <thead>
        <tr >
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="teacherId" data-sortable="true">教师号</th>
            <th data-field="password" data-visible="false">密码</th>
            <th data-field="name" data-sortable="true">姓名</th>
            <th data-field="sex" data-sortable="true">性别</th>
            <th data-field="collegename" data-sortable="true">学院</th>
            <th data-field="self_description" data-visible="false">个人简介</th>
            <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Action</th>
        </tr>
        </thead>
    </table>
</div>
<div class="container">
    <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="EditModalForm" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">编辑信息</h4>
                </div>
                <div class="modal-body">
                    <form id="edit_form" class="form-horizontal">
                        <div class="form-group" id="in_Id">
                            <label for="in_teacherId" class="col-sm-2 control-label">教师号</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="in_teacherId" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="in_password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" id="in_password"  readonly>
                            </div>
                            <button type="button" class="btn-success btn-sm" style="width: 85px" onclick="pwd_reset()">重置</button>
                        </div>
                        <div class="form-group">
                            <label for="in_name" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="in_name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="in_sex" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-9">
                                <select  class="form-control" id="in_sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="in_collegename" class="col-sm-2 control-label">学院</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="in_collegename">
                                    <option></option>
                                    </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="in_self_description" class="col-sm-2 control-label">个人简介</label>
                            <div class="col-sm-9">
                                <textarea rows="5" class="form-control" id="in_self_description" readonly></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" style="margin-right: 10px" class="btn btn-success" data-dismiss="modal" id="editsubmit" onclick="Adminedit_submit()">提交</button>
                    <button type="button" style="margin-right: 10px" class="btn btn-success" data-dismiss="modal" id="addsubmit" onclick="Adminadd_submit()">添加</button>
                    <button type="button" style="margin-right: 10px" class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>

<script>
    var $table = $('#table');
    var row_value;
    var edit_index;
    var allcollege;
    var toggletime=0;
    $(function () {
        $.ajax({
            url: "/adminapi/Admingetallteacher",
            success: function successCallback_Admingetallteacher(json){
                json = $.parseJSON(json);
                $table.bootstrapTable('load', json);
            },
            error: errorCallback
        });
    });
    $(function (){
        $.ajax({
            url: "/adminapi/Admingetallcollege",
            success: function successCallback_Admingetallcollege(json){
                allcollege = $.parseJSON(json);
                var optionstring = "";
                for(var item in allcollege)
                {
                    optionstring += "<option value=\""+ allcollege[item].name  +"\" >"+ allcollege[item].name +"</option>";
                }
                jQuery("#in_collegename").html(optionstring);
            },
            error: errorCallback
        });
    });
    function errorCallback(error) {
        alert("error"+JSON.stringify(error));
    }

    function actionFormatter(value, row, index) {
        return [
            '<a data-toggle="modal" data-target="#modalForm" data-backdrop="static" class="edit" style="margin-right:10px" href="javascript:void(0)" title="编辑" >',
            '<i class="glyphicon glyphicon-edit"></i>',
            '</a>',
            '<a class="remove"  style="margin-left:10px" href="javascript:void(0)" title="删除">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a>'
        ].join('');
    }
    $table.on('toggle.bs.table', function (e, $element) {
        if(toggletime%2==0){
            $table.bootstrapTable('showColumn','self_description');
        }
        else{
            $table.bootstrapTable('hideColumn','self_description');
        }
        toggletime+=1;
    });
    window.actionEvents = {
        'click .edit': function (e, value, row, index) {
            row_value=row;
            edit_index=index;
            document.getElementById("in_Id").style.display="block";
            document.getElementById("editsubmit").style.display="inline";
            document.getElementById("addsubmit").style.display="none";
            document.getElementById("in_teacherId").value=row.teacherId;
            document.getElementById("in_password").value=row.password;
            document.getElementById("in_name").value=row.name;
            document.getElementById("in_sex").value=row.sex;
            document.getElementById("in_collegename").value=row.collegename;
            document.getElementById("in_self_description").value=row.self_description;
        },
        'click .remove': function (e, value, row, index) {
            var teacherid=row.teacherId;
            var postdata=[];
                postdata.push( { data : teacherid } );
            if(confirm("你确定要删除："+row.name+"吗？"))
            {
                $.ajax({
                    url: "/adminapi/Admindeleteteacher",
                    type:"post",
                    data:{data: postdata},
                    success:function successCallback_Admindeleteteacher(result) {
                        $table.bootstrapTable('removeByUniqueId',row.teacherId);
                        alert("删除成功:"+row.name);
                    },
                    error:errorCallback
                });
            }
            else ;
        }
    };

    function pwd_reset() {

        document.getElementById('in_password').value="123456";
        Adminedit_submit();
        alert("已将密码初始化为：123456" );
    }
    function Adminedit_submit() {
        row_value.teacherId=document.getElementById("in_teacherId").value;
        row_value.password=document.getElementById("in_password").value;
        row_value.name=document.getElementById("in_name").value;
        row_value.sex=document.getElementById("in_sex").value;
        row_value.collegename=document.getElementById("in_collegename").value;
        row_value.self_description=document.getElementById("in_self_description").value;
        $.ajax({
            url: "/adminapi/Adminupdateteacher",
            type:"post",
            data:row_value,
            success:    function successCallback_Adminupdateteacher(result) {
                var name=$table.bootstrapTable('getRowByUniqueId',row_value.teacherId).name;
                $table.bootstrapTable('updateRow', {index: edit_index, row: row_value});
                alert("更新成功:"+name);
            },
            error:errorCallback
        });
//        $('#modalForm').modal('hide');
    }


    function Adminaddteacher(){
        document.getElementById("in_Id").style.display="none";
        document.getElementById("editsubmit").style.display="none";
        document.getElementById("addsubmit").style.display="inline";
        document.getElementById("in_password").value="123456";
        document.getElementById("in_name").value="";
        document.getElementById("in_sex").value="男";
        document.getElementById("in_collegename").value="";
        document.getElementById("in_self_description").value="";
    }
    function Adminadd_submit() {
        var data={
            password:document.getElementById("in_password").value,
            name:document.getElementById("in_name").value,
            sex:document.getElementById("in_sex").value,
            collegename:document.getElementById("in_collegename").value
        };
        $.ajax({
            url: "/adminapi/Adminaddteacher",
            type:"post",
            data:data,
            success:function successCallback_Adminaddteacher(result) {
                $(function () {
                    $.ajax({
                        url: "/adminapi/Admingetallteacher",
                        success: function successCallback_Admingetallteacher(json){
                            json = $.parseJSON(json);
                            $table.bootstrapTable('load', json);
                        },
                        error: errorCallback
                    });
                });
                alert("添加成功:"+document.getElementById("in_name").value);
            },
            error: errorCallback
        });
//        $('#modalForm').modal('hide');
    }

    function Admindeleteteacher() {
        var alldata=$table.bootstrapTable('getAllSelections');
        var postdata=[];
        for(var i=0;i<alldata.length;i++)
            postdata.push( { data : alldata[i]["teacherId"] } );
        var delt=new Array();
        for(var ele in alldata)
            delt[ele]=$table.bootstrapTable('getRowByUniqueId',alldata[ele].teacherId).name;
        if(confirm("你确定要删除："+delt+"吗？")){
            $.ajax({
                url: "/adminapi/Admindeleteteacher",
                type:"post",
                data: {data:postdata} ,
                success:function successCallback_Admindeleteteacher(result) {
                    for(var ele in alldata)
                        $table.bootstrapTable('removeByUniqueId',alldata[ele].teacherId);
                    alert("删除成功:"+delt);
                },
                error:errorCallback
            });
        }
        else ;
    }
</script>
