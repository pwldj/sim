<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="../../resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resource/bootstrap-table-master/src/bootstrap-table.css">
    <link rel="stylesheet" href="../../resource/bootstrap3-editable/css/bootstrap-editable.css">

    <script type="text/javascript" src="../../resource/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../resource/bootstrap-table-master/src/bootstrap-table.js"></script>
    <script type="text/javascript" src="../../resource/bootstrap-table-master/src/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="../../resource/bootstrap-table-master/src/extensions/export/bootstrap-table-export.js"></script>
    <script type="text/javascript" src="../../resource/bootstrap-table-master/src/extensions/editable/bootstrap-table-editable.js"></script>
    <script type="text/javascript" src="../../resource/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script type="text/javascript" src="../../resource/tableExport.js"></script>
</head>
<body background="../../resource/image/background.jpg">
<nav class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="/teacher">教务管理</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="/teacher/courseselect">选课查询</a></li>
            <li><a href="/teacher/teacherinfomodify">个人信息</a></li>
            <li><a href="/teacher/teacherscore">成绩管理</a></li>
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
            <{$value=Teacher::getTeacherById()}>
            <li class="dropdown" >
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <{$value[0]['name']}>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#"><{$value[0]['teacherId']}></a></li>
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