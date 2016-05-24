<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/23
 * Time: 15:00
 */
class Controller_StudentApi extends Controller {
    public function action_getCourseByStuId()          //学生已选课程
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.

            //  echo $_COOKIE['id'];
            $arr = Course::getCourseByStuId();

            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }

    public function action_getprobystuid()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            $arr = Course::getProByStuId();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }

    public function action_selectcourse(){
        $this -> auto_render = FALSE;
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $data = $data["data"];
            for($i=0;$i<sizeof($data);$i++){
                Course::selectCourse($data[$i]["data"]);
            }

        }
    }

    public function action_getgeneralbystuid()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            $arr = Course::getGeneralByStuId();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public function action_getpebystuid()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            $arr = Course::getPEByStuId();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public function action_getallcoursebystuid()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            $arr = Course::getAllCourseByStuId();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }

    public function action_deletecoursebystuid(){
        $this -> auto_render = FALSE;
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $data = $data["data"];
            for($i=0;$i<sizeof($data);$i++){
                Course::courseDelete($data[$i]["data"]);
            }

        }
    }

    public static function getCourseTable()
    {
        return BaseClass::getCourseTable();
    }
}