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




//teacherscore
    public function action_getStudent() {
        $courseId = $_GET['courseId'];
        $this -> auto_render = FALSE;
        if ($this -> request -> is_ajax()) {
            // 输出所有选修courseId课程的学生
            $sql = "SELECT courseselection_stu.studentId,student.name,courseselection_stu.score
                    FROM courseselection_stu,student
                    WHERE courseselection_stu.courseId='{$courseId}' and courseselection_stu.studentId=student.studentId
                    ORDER BY courseselection_stu.studentId ASC ";
            $student = DB::query(Database::SELECT, $sql)
                ->execute()
                ->as_array();
            echo json_encode($student);
            exit;
        }
    }

    public function action_updateScore() {
        $student = $_POST['student'];
        $student = json_decode($student);
        $courseId = $_POST['courseId'];
        $affectNum = 0;

        foreach ($student as $s) {
            $studentId = $s->studentId;
            $name = $s->name;
            $score = $s->score;
            if($studentId != ""){
                $sql = "UPDATE courseselection_stu SET score='{$score}' where courseId='{$courseId}' and studentId='{$studentId}'";
                $affectNum += DB::query(Database::UPDATE, $sql)->execute();
            }
        }
        echo $affectNum;
        $affectNum = 0;
        exit;
    }
}