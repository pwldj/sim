<div class="container" >
    <div class="modal-dialog">
        <form id="info_form" class="form-horizontal" role="form">
            <div class="form-group" id="in_Id">
                <label for="in_teacherId" class="col-sm-3 control-label">教师号</label>
                <div class="col-sm-9">
                    <label class="col control-label" id="in_teacherId" readonly>loading...</label>
                </div>
            </div>
            <div id="change_password" style="display: none">
                    <div class="form-group">
                        <label for="in_password1" class="col-sm-3 control-label">请输入新密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="in_password1" placeholder="请输入新密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="in_password2" class="col-sm-3 control-label">请再次输入新密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="in_password2" placeholder="请再次输入新密码">
                        </div>
                    </div>
            </div>
            <div class="form-group">
                <label for="in_name" class="col-sm-3 control-label">姓名</label>
                <div class="col-sm-9">
                    <label class="col control-label" id="in_name" >loading...</label>
                </div>
            </div>
            <div class="form-group">
                <label for="in_sex" class="col-sm-3 control-label">性别</label>
                <div class="col-sm-9">
                    <label  class="col control-label" id="in_sex" >loading...</label>
                </div>
            </div>
            <div class="form-group">
                <label for="in_collegename" class="col-sm-3 control-label">学院</label>
                <div class="col-sm-9">
                    <label class="col control-label" id="in_collegename" >loading...</label>
                </div>
            </div>
            <div class="form-group">
                <label for="in_self_description" class="col-sm-3 control-label">个人简介</label>
                <div class="col-sm-9">
                    <textarea rows="5" class="form-control" id="in_self_description" readonly>loading...</textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success col-sm-9" style="margin-left: 25%;display: inline" id="btn_edit" onclick="teacher_editInfo()">编辑</button>
                <button type="button" style="margin-right: 10px ;display: none" class="btn btn-success"  id="btn_submit" onclick="teacher_submitInfo()">提交</button>
                <button type="button" style="margin-right: 10px ; display: none" class="btn btn-danger" id="btn_cancel" onclick="teacher_canceleditInfo()">取消</button>
            </div>
        </form>

    </div>
</div>

<script>
    var teacherInfo;
    var postdata=getCookie("id");
    Initpage();
    function Initpage() {
        $.ajax({
            url: "/teacherapi/teacherInfoModifygetteacher",
            type:"post",
            data:{data:postdata},
            success: function successCallback_teacherInfoModifygetteacher(result) {
                teacherInfo=$.parseJSON(result);
//                alert("登录成功，欢迎你，亲爱的 "+teacherInfo[0].name);
                document.getElementById("in_teacherId").innerHTML=teacherInfo[0].teacherId;
                document.getElementById("in_name").innerHTML=teacherInfo[0].name;
                document.getElementById("in_sex").innerHTML=teacherInfo[0].sex;
                document.getElementById("in_collegename").innerHTML=teacherInfo[0].collegename;
                document.getElementById("in_self_description").value=teacherInfo[0].self_description;
            },
            error:errorCallback
        });
    }
    function errorCallback(error) {
        alert("error"+JSON.stringify(error));
    }
    function teacher_editInfo() {
        document.getElementById("btn_edit").style.display="none";
        document.getElementById("btn_submit").style.display="inline";
        document.getElementById("btn_cancel").style.display="inline";
        document.getElementById("change_password").style.display="block";
        document.getElementById("in_password1").value="";
        document.getElementById("in_password2").value="";
        document.getElementById("in_self_description").readOnly=false;
    }
    function teacher_submitInfo() {
        var pwd=teacherInfo[0].password;
        var pwd1=document.getElementById("in_password1").value;
        var pwd2=document.getElementById("in_password2").value;
        if(pwd1.length==0 && pwd2.length==0){
            pwd1=pwd;
            pwd2=pwd1;
        }
        if(pwd1 != pwd2)
            alert("两次输入的密码不一致");
        else if(pwd1.length <6)
            alert("密码长度应大于6位字符！");
        else if(pwd1.length>11)
            alert("密码长度应小于11位字符！");
        else {
            var data={
                teacherId:document.getElementById("in_teacherId").innerText,
                password:pwd1,
                name:document.getElementById("in_name").innerText,
                sex:document.getElementById("in_sex").innerText,
                collegename:document.getElementById("in_collegename").innerText,
                self_description:document.getElementById("in_self_description").value
            };
            $.ajax({
                url: "/teacherapi/teacherInfoModifyupdateteacher",
                type:"post",
                data:data,
                success: function successCallback_teacherInfoModifyupdateteacher(result) {
                    teacherInfo[0].self_description=data.self_description;
                    teacherInfo[0].password=pwd1;
                    document.getElementById("in_self_description").value=teacherInfo[0].self_description;
                    alert("修改成功!");
                },
                error:    function errorCallback_submit(error) {
                    alert("error"+JSON.stringify(error));
                }
            });
        }
        document.getElementById("btn_submit").style.display="none";
        document.getElementById("btn_cancel").style.display="none";
        document.getElementById("btn_edit").style.display="block";
        document.getElementById("change_password").style.display="none";
        document.getElementById("in_self_description").readOnly=true;
    }

    function teacher_canceleditInfo() {
        document.getElementById("in_self_description").value=teacherInfo[0].self_description;
        document.getElementById("btn_submit").style.display="none";
        document.getElementById("btn_cancel").style.display="none";
        document.getElementById("btn_edit").style.display="block";
        document.getElementById("change_password").style.display="none";
        document.getElementById("in_self_description").readOnly=true;
    }
    function getCookie(name){
        var strCookie=document.cookie;
        var arrCookie=strCookie.split("; ");
        for(var i=0;i<arrCookie.length;i++){
            var arr=arrCookie[i].split("=");
            if(arr[0]==name)return arr[1];
        }
        return "";
    }
</script>
