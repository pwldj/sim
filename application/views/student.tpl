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
</head>
<body background="../../resource/image/background.jpg">
<nav class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="/student">教务管理</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    选课
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/student/selectcourse">已选课程</a></li>
                    <li><a href="/student/profession">专业选课</a></li>
                    <li><a href="/student/general">校选课</a></li>
                    <li><a href="/student/pe">体育选课</a></li>
                    <li class="divider"></li>
                    <li><a href="/student/deletecourse">退选</a></li>
                    <li class="divider"></li>
                    <li><a href="/student/coursetable">查看课程表</a></li>
                </ul>
            </li>
            <li><a href="/student/studentinfomodify">个人信息</a></li>
            <li><a href="/student/studentcourse">上课时间查询</a></li>
            <li><a href="/student/studentscore">成绩查询</a></li>
            <li><a href="/student/assesspage">编辑评价</a></li>

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
            <{$value=Student::getStudentById()}>
            <li class="dropdown" >
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <{$value[0]['name']}>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#"><{$value[0]['studentId']}></a></li>
                    <li class="divider"></li>
                    <li><a href="#"><{$value[0]['class']}>班</a></li>
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