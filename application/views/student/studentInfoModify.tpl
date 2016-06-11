
<div class="container">
   <div class="modal-dialog">
    <form id="student_form" class="form-horizontal">
        <div class="form-group" id="sd">
            <label class="col-sm-2 control-label" for="in_studentId">学号</label>
            <div class="col-sm-10">
                <input id="in_studentId" type="text" placeholder="" class="form-control"  readonly>
            </div>
        </div>
        <div class="form-group">
            <!-- Text input-->
            <label class="col-sm-2 control-label" for="in_name">姓名</label>
            <div class="col-sm-10">
                <input id="in_name" type="text" placeholder="" class="form-control" readonly>
            </div>
        </div>

        <div class="form-group">
            <!-- Text input-->
            <label  class="col-sm-2 control-label"  for="in_password" >密码</label>
            <div class="col-sm-10">
                <input id="in_password" type="password" class="form-control" readonly>
                <input id="edit_password1" type="password"  class="form-control" style="display:none" placeholder="请输入你的新密码(6-11位)！">
            </div>
        </div>

        <div class="form-group" style="display:none" id="p2">
            <label class="col-sm-2 control-label" for="edit_password2">请再次输入密码:</label>
            <div class="col-sm-10">
                <input id="edit_password2" type="password"  class="form-control"  placeholder="请再次输入你的新密码！">
            </div>
        </div>

        <div class="form-group">
            <!-- Select Basic -->
            <label for="in_sex" class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <input id="in_sex" class="form-control" readonly>
            </div>
        </div>

        <div class="form-group">
            <!-- Text input-->
            <label class="col-sm-2 control-label" for="in_class">班级</label>
            <div class="col-sm-10">
                <input id="in_class" type="text"  class="form-control" readonly>
            </div>
        </div>
        <div class="form-group">
            <!-- Select Basic -->
            <label for="selectYear" class="col-sm-2 control-label">入学年份</label>
            <div class="col-sm-10">
                <input id="selectYear" class="form-control" readonly>
            </div>
        </div>

        <div class="form-group">
            <!-- Select Multiple -->
            <label for="in_selfd" class="col-sm-2 control-label">自我描述</label>
            <div class="col-sm-10">
                <textarea id="in_selfd" class="form-control" rows="5" readonly>
                    </textarea>
            </div>
        </div>
        <div class="form-group">
            <!-- Select Basic -->
            <label for="in_major" class="col-sm-2 control-label">专业</label>
            <div class="col-sm-10">
                <input id="in_major" class="form-control" readonly>
            </div>
        </div>
    </form>
       <div class="modal-footer">
        <button type="button" id="submit_btn" class="btn btn-info" style="display: none"  onclick="submit()">提交</button>
        <button type="button" id="edit_btn" class="btn btn-info col-sm-9" style="margin-left: 20%"  onclick="student_edit()">编辑</button>
        <button type="button" id="close_btn" class="btn btn-danger" style="display: none" onclick="cancel()">取消</button>
       </div>
   </div>
</div>
<script>
    var stu;
    document.getElementById('in_studentId').value= getCookie("id");
    var postdata=document.getElementById('in_studentId').value;
    InitPage();
    function InitPage(){
        $.ajax({
            url:"/studentapi/getStudentById",
            type:"post",
            data:{data:postdata},
            success: function successCallback(json)
            {
                stu=$.parseJSON(json);
                document.getElementById('in_name').value=stu[0].name;
                document.getElementById('in_password').value=stu[0].password;
                document.getElementById('in_sex').value=stu[0].sex;
                document.getElementById('in_class').value=stu[0].class;
                document.getElementById('selectYear').value=stu[0].EnrollmentYear;
                document.getElementById('in_selfd').value=stu[0].self_description;
                document.getElementById('in_major').value=stu[0].majorName;
            },
            error:errorCallback
        });
    }
    function errorCallback(error) {
        alert("查询出现错误: "+JSON.stringify(error));
    }

    function student_edit()
    {
        document.getElementById('edit_btn').style.display="none";
        document.getElementById('close_btn').style.display="inline";
        document.getElementById('submit_btn').style.display="inline";
        document.getElementById('in_password').style.display="none";
        document.getElementById('edit_password1').style.display="inline";
        document.getElementById('p2').style.display="block";
        document.getElementById('in_selfd').readOnly=false;
    }

    function getCookie(name){
        var strCookie=document.cookie;
        var arrCookie=strCookie.split("; ");
        for(var i=0;i<arrCookie.length;i++){
            var arr=arrCookie[i].split("=");
            if(arr[0]==name)
                return arr[1];
        }
        return "";
    }

    function submit() {
        var data1 = document.getElementById('edit_password1').value;
        var data2 = document.getElementById('edit_password2').value;
        if(data1.length==0 && data2.length==0){
            data1=stu[0].password;
            data2=data1;
        }
        if ( data1.length >= 6 && data1.length <= 11) {
            if (data1 == data2) {
                var data = {
                        studentId: document.getElementById('in_studentId').value,
                        password: data1,
                        name: document.getElementById('in_name').value,
                        sex: document.getElementById('in_sex').value,
                        class: document.getElementById("in_class").value,
                        EnrollmentYear: document.getElementById("selectYear").value,
                        self_description: document.getElementById("in_selfd").value,
                        majorName: document.getElementById("in_major").value,
                    };
                $.ajax({
                    url: "/studentapi/updatestudent",
                    type: "post",
                    data: data,
                    dataType: 'json',
                    success: function successCallback_update(json) {
                        alert("更新成功！" + name);
                        document.getElementById('in_password').value=data.password,
                        document.getElementById('in_selfd').value=data.self_description;
                        document.getElementById('edit_btn').style.display="inline";
                        document.getElementById('close_btn').style.display="none";
                        document.getElementById('submit_btn').style.display="none";
                        document.getElementById('in_password').style.display="inline";
                        document.getElementById('edit_password1').style.display="none";
                        document.getElementById('p2').style.display="none";
                        document.getElementById('in_selfd').readOnly=true;
                        document.getElementById('in_password').readOnly=true;
                    },
                    error: errorCallback
                });
            }
            else
            {
                alert("两次输入密码不一致，请重新输入！");
                document.getElementById('edit_password1').value = "";
                document.getElementById('edit_password2').value = "";
            }
        }
        else if (data1.length < 6) {
            alert("密码不足六位，请重新输入！");
            document.getElementById('edit_password1').value = "";
            document.getElementById('edit_password2').value = "";
        }
        else {
            alert("密码超过11位，请重新输入！");
            document.getElementById('edit_password1').value = "";
            document.getElementById('edit_password2').value = "";
        }
    }

    function cancel()
    {
        document.getElementById('in_password').value=stu[0].password;
        document.getElementById('in_selfd').value=stu[0].self_description;
        document.getElementById('edit_btn').style.display="inline";
        document.getElementById('close_btn').style.display="none";
        document.getElementById('submit_btn').style.display="none";
        document.getElementById('in_password').style.display="inline";
        document.getElementById('edit_password1').style.display="none";
        document.getElementById('p2').style.display="none";
        document.getElementById('in_selfd').readOnly=true;
        document.getElementById('in_password').readOnly=true;
    }
</script>
