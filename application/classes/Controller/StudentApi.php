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

    public function action_getStudentById()
    {
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $arr = studentInfoModify::getStudentById($data['data']);
            echo json_encode($arr);
        }
        exit;
    }
    public function action_updatestudent()
    {
        $this -> auto_render = FALSE;
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $affectNumber = studentInfoModify::update_student($data);
            echo json_encode($affectNumber);
        }
        exit;
    }


    public function action_getallscore()
    {
        $id=$_COOKIE['id'];
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $sql = 'select student.name as Sname,course.name as Cname,course.courseId,score,credit,property,direction,college.name as coname from student,course,courseselection_stu,college
                        where course.courseId=courseselection_stu.courseId and student.studentId=courseselection_stu.studentId
                        and student.studentId='.$id. ' and college.collegeId=course.collegeId';
            $arr = DB::query(Database::SELECT, $sql)->execute()->as_array();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }
    public function action_getyearscore()
    {
        $id=$_COOKIE['id'];
        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $sql = 'select student.name as Sname,course.name as Cname,course.courseId,score,credit,property,direction,college.name as coname from student,course,courseselection_stu,college
                        where course.courseId=courseselection_stu.courseId and student.studentId=courseselection_stu.studentId
                        and student.studentId='.$id. ' and college.collegeId=course.collegeId and year(testtime) ='.$data['yeartext'];

            $arr = DB::query(Database::SELECT, $sql)->execute()->as_array();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }


    public function action_geteachcourse()
    {

        if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $id = $_COOKIE['id'];
            //get $arr here.
            $sql = 'select course.courseId as courseid,course.name as coursename,courseselection_stu.assessment as assessment
                    from courseselection_stu , course
                    where courseselection_stu.studentId='.$id.' and course.courseId=courseselection_stu.courseId';
            //$sql ='select studentId as courseid from student';
            $arr = DB::query(Database::SELECT, $sql)->execute()->as_array();
            echo json_encode($arr);//建议这样写,避免0或其他情况.
            exit;
        }
    }

    public function action_submitapi(){
        //if ($this -> request -> is_ajax()) //判断是否为ajax请求
        {
            $data = $this->request->post();
            $data['courseId'];
            $id = $_COOKIE['id'];
            DB::query(Database::UPDATE, 'update courseselection_stu
                  set assessment="'.$data['text'].'
                  " where studentId='.$id.' and courseId='.$data['courseId'])->execute();
            exit;
        }
    }
}