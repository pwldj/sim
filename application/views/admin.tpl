<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="../../resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resource/bootstrap-table-master/src/bootstrap-table.css">

    <script src="../../resource/bootstrap/js/jquery.min.js"></script>
    <script src="../../resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../resource/bootstrap-table-master/src/bootstrap-table.js"></script>
    <script src="../../resource/bootstrap-table-master/src/extensions/export/bootstrap-table-export.js"></script>
    <script src="//rawgit.com/hhurz/tableExport.jquery.plugin/master/tableExport.js"></script>
</head>
<body background="../../resource/image/background.jpg">
<nav class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="/admin">教务管理</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    课程管理
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/admin/manIn">手动录入</a></li>
                    <li><a href="/admin/publishcourse">发布课程</a></li>
                    <li><a href="/admin/statement">生成报表</a></li>
                </ul>
            </li>
            <li><a href="/admin/Adminteacher">教师信息管理</a></li>
            <li><a href="/admin/Adminstudent">学生信息管理</a></li>
            <li><a href="/admin/Adminscore">成绩管理</a></li>
            <li><a href="/admin/course">排课系统</a></li>
            <li><a href="/admin/classroombrower">教室借用系统</a></li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Java
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">jmeter</a></li>
                    <li><a href="#">EJB</a></li>
                    <li><a href="#">Jasper Report</a></li>
                    <li class="divider"></li>
                    <li><a href="#">分离的链接</a></li>
                    <li class="divider"></li>
                    <li><a href="#">另一个分离的链接</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <{$value=Admin::getAdminById()}>
            <li class="dropdown" >
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <{$value[0]['name']}>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#"><{$value[0]['adminId']}></a></li>
                </ul>
            </li>
            <li>
                <a href="/login">退出</a>
            </li>
            <li><p>"   "</p></li>
        </ul>
    </div>
</nav>

<{$content}>

<footer class="footer">
    <div class="container">
        <p style="text-align: center">&copy; 北京化工大学 计科1306 选课小组;(+86) 13260163193</p>
    </div>
</footer>
</body>
</html>