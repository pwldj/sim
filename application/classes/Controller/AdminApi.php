<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/24
 * Time: 12:32
 */
class Controller_adminapi extends Controller{
    public  function  action_manselectcourse()
    {
        if ($this->request->is_ajax()) {
            $data = $this->request->post();
            $q = BaseClass::manselectCourse($data);
            echo json_encode($q);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public  function  action_mandeletecourse()
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
    public  function  action_statetea()
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

    public function action_admingetallteacher()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = AdminTeacher::AdmingetAllTeacher();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
        }
        exit;
    }
    public function action_admingetallcollege()
    {
        if ($this->request->is_ajax()) //判断是否为ajax请求
        {
            //get $arr here.
            $arr = AdminTeacher::AdmingetAllCollege();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public function action_adminupdateteacher()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $affectNum = AdminTeacher::Adminupdateteacher($data);
            echo $affectNum;//建议这样写,避免0或其他情况.
        }
        exit;
    }
    public function action_adminaddteacher()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $array =AdminTeacher::Adminaddteacher($data);
            echo json_encode($array);//建议这样写,避免0或其他情况.
        }
        exit;
    }
    public function action_admindeleteteacher()
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

    public function action_getall1()
    {
        $this -> auto_render = FALSE;
        $data=$this->request->post();
        $arr = DB::query(Database::SELECT,$data['sql'])->execute()->as_array();

        for($i=0;$i<count($arr);$i++) {
            $sql = "select * from workout_course where  workout_course.courseid=".$arr[$i]['courseId'];
            $temp = DB::query(Database::SELECT,$sql)->execute()->as_array();
            $arr[$i]['count'] = count($temp);
        }

        echo json_encode($arr);//建议这样写,避免0或其他情况.
        exit;
    }

    public function action_getcoursework()
    {
        $this -> auto_render = FALSE;
        $data=$this->request->post();
        $arr = DB::query(Database::SELECT,$data['sql'])->execute()->as_array();
        echo json_encode($arr);//建议这样写,避免0或其他情况.
        exit;
    }
    public function action_insert(){
        $this -> auto_render = FALSE;
        //if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            Course::insert($data);
        }
    }
    
}