<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2016-05-11 02:44:06 --- CRITICAL: ErrorException [ 1 ]: Call to a member function as_array() on array ~ APPPATH\classes\Baseclass.php [ 14 ] in file:line
2016-05-11 02:44:06 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-11 02:54:50 --- CRITICAL: Database_Exception [ 1062 ]: Duplicate entry '12343' for key 'PRIMARY' of table 'rb0681il8b80i8lh.student' [ insert into student values (12343,"123","123") ] ~ MODPATH\database\classes\Kohana\Database\MySQLi.php [ 171 ] in C:\Users\xiaotian\Desktop\kohana\modules\database\classes\Kohana\Database\Query.php:251
2016-05-11 02:54:50 --- DEBUG: #0 C:\Users\xiaotian\Desktop\kohana\modules\database\classes\Kohana\Database\Query.php(251): Kohana_Database_MySQLi->query(2, 'insert into stu...', false, Array)
#1 C:\Users\xiaotian\Desktop\kohana\application\classes\Baseclass.php(15): Kohana_Database_Query->execute()
#2 C:\Users\xiaotian\Desktop\kohana\application\classes\Student.php(11): BaseClass::getstudent('student')
#3 C:\Users\xiaotian\Desktop\kohana\application\cache\smarty_compiled\6b0cd4cfa23021a1f7e478b5219531598f7a8558.file.student.tpl.php(55): Student::getAllStudent()
#4 C:\Users\xiaotian\Desktop\kohana\modules\smarty\vendor\smarty\libs\sysplugins\smarty_internal_templatebase.php(182): content_5732dd08420525_04772972(Object(Smarty_Internal_Template))
#5 C:\Users\xiaotian\Desktop\kohana\modules\smarty\classes\Smarty\View.php(383): Smarty_Internal_TemplateBase->fetch('C:\\Users\\xiaoti...')
#6 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Controller\Template.php(44): Smarty_View->render()
#7 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Controller.php(87): Kohana_Controller_Template->after()
#8 [internal function]: Kohana_Controller->execute()
#9 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#10 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#11 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#12 C:\Users\xiaotian\Desktop\kohana\index.php(118): Kohana_Request->execute()
#13 {main} in C:\Users\xiaotian\Desktop\kohana\modules\database\classes\Kohana\Database\Query.php:251
2016-05-11 02:55:02 --- CRITICAL: Database_Exception [ 1062 ]: Duplicate entry '12343' for key 'PRIMARY' of table 'rb0681il8b80i8lh.student' [ insert into student values (12343,"123","123") ] ~ MODPATH\database\classes\Kohana\Database\MySQLi.php [ 171 ] in C:\Users\xiaotian\Desktop\kohana\modules\database\classes\Kohana\Database\Query.php:251
2016-05-11 02:55:02 --- DEBUG: #0 C:\Users\xiaotian\Desktop\kohana\modules\database\classes\Kohana\Database\Query.php(251): Kohana_Database_MySQLi->query(2, 'insert into stu...', false, Array)
#1 C:\Users\xiaotian\Desktop\kohana\application\classes\Baseclass.php(15): Kohana_Database_Query->execute()
#2 C:\Users\xiaotian\Desktop\kohana\application\classes\Student.php(11): BaseClass::getstudent('student')
#3 C:\Users\xiaotian\Desktop\kohana\application\cache\smarty_compiled\6b0cd4cfa23021a1f7e478b5219531598f7a8558.file.student.tpl.php(55): Student::getAllStudent()
#4 C:\Users\xiaotian\Desktop\kohana\modules\smarty\vendor\smarty\libs\sysplugins\smarty_internal_templatebase.php(182): content_5732dd08420525_04772972(Object(Smarty_Internal_Template))
#5 C:\Users\xiaotian\Desktop\kohana\modules\smarty\classes\Smarty\View.php(383): Smarty_Internal_TemplateBase->fetch('C:\\Users\\xiaoti...')
#6 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Controller\Template.php(44): Smarty_View->render()
#7 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Controller.php(87): Kohana_Controller_Template->after()
#8 [internal function]: Kohana_Controller->execute()
#9 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#10 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#11 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#12 C:\Users\xiaotian\Desktop\kohana\index.php(118): Kohana_Request->execute()
#13 {main} in C:\Users\xiaotian\Desktop\kohana\modules\database\classes\Kohana\Database\Query.php:251
2016-05-11 03:00:12 --- CRITICAL: ErrorException [ 1 ]: Call to undefined method Log::DEBUG() ~ APPPATH\classes\Baseclass.php [ 14 ] in file:line
2016-05-11 03:00:12 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-11 03:16:32 --- CRITICAL: ErrorException [ 2 ]: preg_match(): Compilation failed: missing ) at offset 16 ~ SYSPATH\classes\Kohana\Route.php [ 423 ] in file:line
2016-05-11 03:16:32 --- DEBUG: #0 [internal function]: Kohana_Core::error_handler(2, 'preg_match(): C...', 'C:\\Users\\xiaoti...', 423, Array)
#1 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Route.php(423): preg_match('#^(?:(?:/index)...', '', NULL)
#2 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request.php(472): Kohana_Route->matches(Object(Request))
#3 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request.php(949): Kohana_Request::process(Object(Request), Array)
#4 C:\Users\xiaotian\Desktop\kohana\index.php(118): Kohana_Request->execute()
#5 {main} in file:line
2016-05-11 03:16:33 --- CRITICAL: ErrorException [ 2 ]: preg_match(): Compilation failed: missing ) at offset 16 ~ SYSPATH\classes\Kohana\Route.php [ 423 ] in file:line
2016-05-11 03:16:33 --- DEBUG: #0 [internal function]: Kohana_Core::error_handler(2, 'preg_match(): C...', 'C:\\Users\\xiaoti...', 423, Array)
#1 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Route.php(423): preg_match('#^(?:(?:/index)...', 'favicon.ico', NULL)
#2 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request.php(472): Kohana_Route->matches(Object(Request))
#3 C:\Users\xiaotian\Desktop\kohana\system\classes\Kohana\Request.php(949): Kohana_Request::process(Object(Request), Array)
#4 C:\Users\xiaotian\Desktop\kohana\index.php(118): Kohana_Request->execute()
#5 {main} in file:line