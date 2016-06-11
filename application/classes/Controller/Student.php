<?php defined('SYSPATH') or die('No direct script access.');

class Controller_student extends Controller_Template {
    public $template = 'student.tpl';

	public function action_index()
    {
        $this->template->content = '';
	}
    public function action_selectcourse(){   //选课主页
        $this->template->content = View::factory('student/selectcourse.tpl');
    }
    public function action_profession(){     //专业选课
        $this->template->content = View::factory('student/profession.tpl');
    }
    public function action_general(){     //专业选课
        $this->template->content = View::factory('student/generalcourse.tpl');
    }
    public function action_PE(){     //专业选课
        $this->template->content = View::factory('student/PEcourse.tpl');
    }
    public function action_deletecourse(){     //专业选课
        $this->template->content = View::factory('student/deletecourse.tpl');
    }
    public function action_coursetable(){     //专业选课
        $this->template->content = View::factory('student/courseTable.tpl');
    }
    public function action_studentinfomodify(){     //专业选课
        $this->template->content = View::factory('student/studentInfoModify.tpl');
    }
    public function action_studentscore(){     //专业选课
        $this->template->content = View::factory('student/studentscore.tpl');
    }
    public function action_assesspage(){     //专业选课
        $this->template->content = View::factory('student/assesspage.tpl');
    }
    public function action_editassess(){
        $this->template->content = View::factory('student/editassess.tpl');
    }
    public function action_studentcourse(){
        $this->template->content = View::factory('student/studentcourse.tpl');
    }
} // End Welcome
