<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="../../resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resource/bootstrap-table-master/src/bootstrap-table.css">

    <script src="../../resource/bootstrap/js/jquery.min.js"></script>
    <script src="../../resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../resource/bootstrap-table-master/src/bootstrap-table.js"></script>
    <script src="../../resource/bootstrap-table-master/src/extensions/export/bootstrap-table-export.js"></script>
    <style type="text/css">
        body{
            font-family: 'microsoft yahei',Arial,sans-serif;
            margin:0;
            padding:0;
        }
    </style>
</head>
<body>


<div id="loginModal" class="modal show">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="text-center text-primary">登录</h1>
            </div>
            <div class="modal-body">
                <form action="" class="form col-md-12 center-block">
                    <div class="form-group">
                        <input id="id" type="text" class="form-control input-lg" placeholder="学号">
                    </div>
                    <div class="form-group">
                        <input id="password" type="password" class="form-control input-lg" onkeydown="if(event.keyCode==13){logbutten.click()}" placeholder="登录密码">
                    </div>
                    <div>
                        <select id="person" class="form-control input-lg">
                            <option value="student">学生</option>
                            <option value="teacher">教师</option>
                            <option value="admin">管理员</option>
                        </select>
                    </div>
                    </br>
                    <div class="form-group">
                        <button id="logbutten" type="button" class="btn btn-primary btn-lg btn-block" onclick="login()">立刻登录</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer"  style=" white-space:normal; word-break:break-all; word-wrap:break-word;">
                <p id="message">
                </p>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $.ajax({
            url:"/login/getmessageapi",
            success:success_mess,
            error:error_mess
        });
    });
    function success_mess(mess) {
        mess = $.parseJSON(mess);
        var i=0;
        mytime = setInterval(function(){showme()}, 2000);
        function showme() {
            $('#message').text(mess[i++].text);
            i=i%mess.length;
        }
    }
    function error_mess() {
        alert("获取通知信息失败");
    }
    function login() {
        var data ={
            id:document.getElementById('id').value,
            password:document.getElementById('password').value,
            person:document.getElementById("person").value
        };
        $.ajax({
            url: "/login/loginapi",
            type:"post",
            data:data,
            success: successCallback,
            error: errorCallback
        });
        function successCallback(res){
            if(res=="success") {
                document.cookie="id="+data.id;
                if(data.person == "student"){
                    window.location.href = 'student';
                }
                else if(data.person=="teacher"){
                    window.location.href = 'teacher';
                }
                else{
                    window.location.href = 'admin';
                }
            }
            else alert('登录失败');
        }
        function errorCallback(){
            alert('登录失败');
        }
    }

</script>
</body>
</html>