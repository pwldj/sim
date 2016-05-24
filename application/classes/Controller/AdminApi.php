<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/24
 * Time: 12:32
 */
class Controller_Adminapi extends Controller{
    public  function  action_manselectCourse()
    {
        if ($this->request->is_ajax()) {
            $data = $this->request->post();
            $q = BaseClass::manselectCourse($data);
            echo json_encode($q);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public  function  action_mandeleteCourse()
    {
        if ($this->request->is_ajax())
        {
            $data = $this->request->post();
            $a=$data['snum'];
            $b=$data['cnum'];
            $q=BaseClass::mandeleteCourse($a,$b);
            echo json_encode($q);//建议这样写,避免0或其他情况.
            exit;
        }

    }
    public  function  action_statestu()
    {
        $this -> auto_render = FALSE;
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = Student::getAllStudent();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public  function  action_stateTea()
    {
        $this -> auto_render = FALSE;
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = Teacher::getAllTeacher();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }

    public function action_majorrelease()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            $arr = Releasecourse::getallreleasecourse();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }

    public function action_coursesub(){
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $data = $data["data"];
            for($i=0;$i<sizeof($data);$i++){
                Releasecourse::subInsert($data[$i]["data"]);
            }

        }
    }
}