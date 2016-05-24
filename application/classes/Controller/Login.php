<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/13
 * Time: 0:56
 */
class Controller_login extends Controller_Template{
    public $template = 'login.tpl';
    public function action_index(){
//        $this->template->test = View::factory('student.tpl');
    }


    public function action_getmessageapi(){
        $this -> auto_render = FALSE;
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $mess = DB::query(Database::SELECT,"select * from message where audiences = 0 and useful = 1" )->execute()->as_array();
            echo json_encode($mess);//建议这样写,避免0或其他情况.
            exit;
        }
    }


    public function action_loginapi(){
        $this -> auto_render = FALSE;
        //if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $query = Login::loginchack($data);
            if (sizeof($query) == 1)
                echo 'success';
            else
                echo 'false';
            exit;

        }
    }
    
}