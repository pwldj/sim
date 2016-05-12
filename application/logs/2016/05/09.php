<?php defined('SYSPATH') OR die('No direct script access.'); ?>

2016-05-09 23:00:46 --- CRITICAL: View_Exception [ 0 ]: The requested view test could not be found ~ SYSPATH\classes\Kohana\View.php [ 265 ] in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145
2016-05-09 23:00:46 --- DEBUG: #0 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(145): Kohana_View->set_filename('test')
#1 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php(30): Kohana_View->__construct('test', NULL)
#2 C:\Users\jinha\Desktop\kohana-v3.3.5\application\classes\Controller\Welcome.php(7): Kohana_View::factory('test')
#3 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Controller.php(84): Controller_Welcome->action_index()
#4 [internal function]: Kohana_Controller->execute()
#5 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client\Internal.php(97): ReflectionMethod->invoke(Object(Controller_Welcome))
#6 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request\Client.php(114): Kohana_Request_Client_Internal->execute_request(Object(Request), Object(Response))
#7 C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\Request.php(997): Kohana_Request_Client->execute(Object(Request))
#8 C:\Users\jinha\Desktop\kohana-v3.3.5\index.php(118): Kohana_Request->execute()
#9 {main} in C:\Users\jinha\Desktop\kohana-v3.3.5\system\classes\Kohana\View.php:145