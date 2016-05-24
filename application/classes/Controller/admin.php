<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/24
 * Time: 12:30
 */

class Controller_Admin extends Controller_Template
{
    public $template='admin.tpl';
    public function action_index(){
        $this->template->content = '';
    }
    public function action_manIn(){   //手动录入
        $this->template->content = View::factory('admin/manIn.tpl');
    }
    public function action_statement(){   
        $this->template->content = View::factory('admin/statement.tpl');
    }
    public function action_publishcourse(){   
        $this->template->content = View::factory('admin/publishcourse.tpl');
    }
    public function action_adminteacher(){   
        $this->template->content = View::factory('admin/Adminteacher.tpl');
    }
    public function action_adminstudent(){   
        $this->template->content = View::factory('admin/AdminStudent.tpl');
    }
}