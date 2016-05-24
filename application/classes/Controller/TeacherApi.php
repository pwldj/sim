<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/23
 * Time: 15:00
 */
class Controller_TeacherApi extends Controller{
    public function action_teacherInfoModifygetteacher()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $arr = Teacher::teacherInfoModifygetteacher($data['data']);
            echo json_encode($arr);//建议这样写,避免0或其他情况.
        }
        exit;
    }
    public function action_teacherInfoModifyupdateteacher()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $affectNum = Teacher::teacherInfoModifyupdateteacher($data);
            echo $affectNum;//建议这样写,避免0或其他情况.
        }
        exit;
    }
}