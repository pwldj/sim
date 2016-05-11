<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2016-05-10 09:27:36 --- CRITICAL: ErrorException [ 8 ]: Array to string conversion ~ SYSPATH\classes\Kohana\Response.php [ 160 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\system\classes\Kohana\Response.php:160
2016-05-10 09:27:36 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\system\classes\Kohana\Response.php(160): Kohana_Core::error_handler(8, 'Array to string...', 'C:\\Users\\jinha\\...', 160, Array)
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\application\classes\Controller\Welcome.php(9): Kohana_Response->body(Array)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\system\classes\Kohana\Controller.php(84): Controller_Welcome->action_index()
#3 [internal function]: Kohana_Controller->execute()
#4 C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_Welcome))
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#8 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\kohana-v3.3.5\system\classes\Kohana\Response.php:160
2016-05-10 10:38:26 --- CRITICAL: Kohana_Exception [ 0 ]: A valid cookie salt is required. Please set Cookie::$salt in your bootstrap.php. For more information check the documentation ~ SYSPATH\classes\Kohana\Cookie.php [ 158 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Cookie.php:67
2016-05-10 10:38:26 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Cookie.php(67): Kohana_Cookie::salt('XDEBUG_SESSION', NULL)
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(151): Kohana_Cookie::get('XDEBUG_SESSION')
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(117): Kohana_Request::factory(true, Array, false)
#3 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Cookie.php:67
2016-05-10 10:39:03 --- CRITICAL: Kohana_Exception [ 0 ]: A valid cookie salt is required. Please set Cookie::$salt in your bootstrap.php. For more information check the documentation ~ SYSPATH\classes\Kohana\Cookie.php [ 158 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Cookie.php:67
2016-05-10 10:39:03 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Cookie.php(67): Kohana_Cookie::salt('XDEBUG_SESSION', NULL)
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(151): Kohana_Cookie::get('XDEBUG_SESSION')
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(117): Kohana_Request::factory(true, Array, false)
#3 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Cookie.php:67
2016-05-10 22:21:10 --- CRITICAL: ErrorException [ 1 ]: Class 'Student' not found ~ APPPATH\views\student.php [ 29 ] in file:line
2016-05-10 22:21:10 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-10 22:24:11 --- CRITICAL: View_Exception [ 0 ]: The requested view student could not be found ~ SYSPATH\classes\Kohana\View.php [ 265 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:24:11 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(145): Kohana_View->set_filename('student')
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(30): Kohana_View->__construct('student', NULL)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\application\classes\Controller\student.php(10): Kohana_View::factory('student')
#3 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller.php(84): Controller_student->action_index()
#4 [internal function]: Kohana_Controller->execute()
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#9 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:25:48 --- CRITICAL: View_Exception [ 0 ]: The requested view student.tpl could not be found ~ SYSPATH\classes\Kohana\View.php [ 265 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:25:48 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(145): Kohana_View->set_filename('student.tpl')
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(30): Kohana_View->__construct('student.tpl', NULL)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller\Template.php(33): Kohana_View::factory('student.tpl')
#3 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller.php(69): Kohana_Controller_Template->before()
#4 [internal function]: Kohana_Controller->execute()
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#9 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:27:16 --- CRITICAL: View_Exception [ 0 ]: The requested view student.tpl could not be found ~ SYSPATH\classes\Kohana\View.php [ 265 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:27:16 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(145): Kohana_View->set_filename('student.tpl')
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(30): Kohana_View->__construct('student.tpl', NULL)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller\Template.php(33): Kohana_View::factory('student.tpl')
#3 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller.php(69): Kohana_Controller_Template->before()
#4 [internal function]: Kohana_Controller->execute()
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#9 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:27:51 --- CRITICAL: View_Exception [ 0 ]: The requested view student.tpl could not be found ~ SYSPATH\classes\Kohana\View.php [ 265 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:27:51 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(145): Kohana_View->set_filename('student.tpl')
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(30): Kohana_View->__construct('student.tpl', NULL)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller\Template.php(33): Kohana_View::factory('student.tpl')
#3 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller.php(69): Kohana_Controller_Template->before()
#4 [internal function]: Kohana_Controller->execute()
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#9 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:30:11 --- CRITICAL: View_Exception [ 0 ]: The requested view student could not be found ~ SYSPATH\classes\Kohana\View.php [ 265 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:30:11 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(145): Kohana_View->set_filename('student')
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(30): Kohana_View->__construct('student', NULL)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller\Template.php(33): Kohana_View::factory('student')
#3 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller.php(69): Kohana_Controller_Template->before()
#4 [internal function]: Kohana_Controller->execute()
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#9 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:31:11 --- CRITICAL: View_Exception [ 0 ]: The requested view student.tpl could not be found ~ SYSPATH\classes\Kohana\View.php [ 265 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:31:11 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(145): Kohana_View->set_filename('student.tpl')
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(30): Kohana_View->__construct('student.tpl', NULL)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller\Template.php(33): Kohana_View::factory('student.tpl')
#3 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller.php(69): Kohana_Controller_Template->before()
#4 [internal function]: Kohana_Controller->execute()
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_student))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#9 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-10 22:32:19 --- CRITICAL: Kohana_Exception [ 0 ]: Attempted to load an invalid or missing module 'smarty' at 'MODPATH\smarty' ~ SYSPATH\classes\Kohana\Core.php [ 579 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\application\bootstrap.php:134
2016-05-10 22:32:19 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\application\bootstrap.php(134): Kohana_Core::modules(Array)
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(102): require('C:\\Users\\jinha\\...')
#2 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\application\bootstrap.php:134
2016-05-10 22:33:00 --- CRITICAL: ErrorException [ 1 ]: Class 'Student' not found ~ MODPATH\smarty\vendor\smarty\libs\sysplugins\smarty_internal_templatebase.php(151) : eval()'d code [ 55 ] in file:line
2016-05-10 22:33:00 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line
2016-05-10 22:34:35 --- CRITICAL: ErrorException [ 1 ]: Class 'student' not found ~ MODPATH\smarty\vendor\smarty\libs\sysplugins\smarty_internal_templatebase.php(165) : eval()'d code [ 55 ] in file:line
2016-05-10 22:34:35 --- DEBUG: #0 [internal function]: Kohana_Core::shutdown_handler()
#1 {main} in file:line