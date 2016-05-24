<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/24
 * Time: 11:51
 */
class Controller_Teacher extends Controller_Template{
    public $template = 'teacher.tpl';

    public function action_index(){
        $this->template->content = '';
    }
    public function action_courseselect(){
        $this->template->content = View::factory('teacher/courseselect.tpl');
    }
    public function action_studentList(){
        $this->template->content = View::factory('teacher/studentList.tpl');
    }
    public function action_teacherinfomodify(){
        $this->template->content = View::factory('teacher/teacherInfoModify.tpl');
    }
    public function action_teacherscore(){
        $this->template->content = View::factory('teacher/TeacherScore.tpl');
    }
}