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

    public function action_Admingetallteacher()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = AdminTeacher::AdmingetAllTeacher();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
        }
        exit;
    }
    public function action_Admingetallcollege()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = AdminTeacher::AdmingetAllCollege();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public function action_Adminupdateteacher()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $affectNum = AdminTeacher::Adminupdateteacher($data);
            echo $affectNum;//建议这样写,避免0或其他情况.
        }
        exit;
    }
    public function action_Adminaddteacher()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $array =AdminTeacher::Adminaddteacher($data);
            echo json_encode($array);//建议这样写,避免0或其他情况.
        }
        exit;
    }
    public function action_Admindeleteteacher()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $alldata = $this->request->post();
            $data=$alldata["data"];
            $array=array();
            foreach ($data as $d){
                if(AdminTeacher::Admindeleteteacher($d["data"])==1){
                    array_push($array,$d['data']);
                }
            }
            echo json_encode($array);//建议这样写,避免0或其他情况.
        }
        exit;
    }

    
    
    
    

    public function action_getalluser()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = AdminStudent::getAllStudent();
            echo json_encode($arr);//建议这样写,避免0或其他情况.

        }
        exit;
    }

    public function action_getallmajor()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = AdminStudent::getAllMajor();
            echo json_encode($arr);//建议这样写,避免0或其他情况.

        }
        exit;
    }

    public function action_updatestudent()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $affectNumber = AdminStudent::update_student($data);
            echo json_encode($affectNumber);
        }
        exit;
    }

    public function action_deletestudent()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $data=$data["data"];
            $affectNumber=0;
            for($i=0;$i<sizeof($data);$i++){
                $affectNumber += AdminStudent::delete_student($data[$i]["data"]);
            }
            echo json_encode($affectNumber);

        }
        exit;
    }

    public function action_addstudent()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $query = AdminStudent::add_student($data);
            echo json_encode($query);
        }
        exit;
    }


    public function action_getall()
    {
        $data=$this->request->post();
        $arr = DB::query(Database::SELECT,$data['sql'])->execute()->as_array();
        echo json_encode($arr);//建议这样写,避免0或其他情况.
        exit;
    }
}