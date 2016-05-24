<?php /* Smarty version Smarty-3.1.18, created on 2016-05-23 10:09:45
         compiled from "D:\php\sim\application\views\student.tpl" */ ?>
<?php /*%%SmartyHeaderCode:290335732fcfa9c8bd7-56290660%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd33268791a6aaf0d44074543c2c68aec6b6ec91f' => 
    array (
      0 => 'D:\\php\\sim\\application\\views\\student.tpl',
      1 => 1464016183,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '290335732fcfa9c8bd7-56290660',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_5732fcfabfd200_96001957',
  'variables' => 
  array (
    'value' => 0,
    'content' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5732fcfabfd200_96001957')) {function content_5732fcfabfd200_96001957($_smarty_tpl) {?><!DOCTYPE html>
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
            <li><a href="#">SVN</a></li>
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
            <?php $_smarty_tpl->tpl_vars['value'] = new Smarty_variable(Student::getStudentById(), null, 0);?>
            <li class="dropdown" >
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <?php echo $_smarty_tpl->tpl_vars['value']->value[0]['name'];?>

                </a>
                <ul class="dropdown-menu">
                    <li><a href="#"><?php echo $_smarty_tpl->tpl_vars['value']->value[0]['studentId'];?>
</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><?php echo $_smarty_tpl->tpl_vars['value']->value[0]['class'];?>
班</a></li>
                </ul>
            </li>
            <li>
                <a href="../login">退出</a>
            </li>
            <li><p>"   "</p></li>
        </ul>
    </div>
</nav>

<?php echo $_smarty_tpl->tpl_vars['content']->value;?>


<footer class="footer">
    <div class="container">
        <p style="text-align: center">&copy; 北京化工大学 计科1306 选课小组;(+86) 13260163193</p>
    </div>
</footer>
</body>
</html><?php }} ?>
