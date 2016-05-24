<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/11
 * Time: 10:03
 */
class BaseClass{
    public static function loginchack($data){            //登录验证
        $query = DB::select()->from($data['person'])
            ->where($data['person'].'Id','=' ,$data['id'] )
            ->and_where('password','=' ,$data['password'] )
            ->execute()
            ->as_array();
        return $query;
    }
    public  static  function  getCourseByStuId($table)     //获取学生已选课程
    {
        $b=$_COOKIE['id'];
        $a=DB::select('courseId')
            ->from('courseselection_stu')
            ->where('studentId','=',$b)
            ->execute()
            ->as_array();
        if(sizeof($a)) {
            $query = DB::select()
                ->from($table)->where('courseId', 'in', $a)
                ->execute()->as_array();
            return $query;
        }
        else
            return "";
    }
    public static  function  getStudentById($data)         //根据学生id获取学生信息
    {
        $query = DB::select()
            ->from('student')->where('studentId','=' ,$data)
            ->execute()->as_array();
        $queryA = DB::select()
            ->from('major')->where('majorId','=' ,$query[0]['majorId'])
            ->execute()->as_array();
        $queryB = DB::select()
            ->from('college')->where('collegeId','=' ,$queryA[0]['collegeId'])
            ->execute()->as_array();
        $query[0]['majorName']=$queryA[0]['name'];
        $query[0]['collegeName']=$queryB[0]['name'];
        return $query;
    }
    public  static  function  getProByStuId($table)      //获得专业选课根据xueshengID
    {

        $query=DB::query(Database::SELECT,"select * from course where PropertyId = 4  and courseId not in (select courseId from courseselection_stu where studentId = ".$_COOKIE['id'].")")->execute()->as_array();
        for ($i=0;$i<sizeof($query);$i++) {
            $teachername = DB::query(Database::SELECT,"select teacher.name from courseselection_tea,teacher where courseselection_tea.courseId=".$query[$i]['courseId']." and teacher.teacherId = courseselection_tea.teacherId" )->execute()->as_array();
            $query[$i]['teachername'] = '';
            foreach ($teachername as $teachervalue)
                $query[$i]['teachername'] = $query[$i]['teachername'].$teachervalue['name']." ";

            $classinf = DB::query(Database::SELECT,"select workout_course.weeknum,workout_course.startsection,workout_course.endsection,classroom.Place from workout_course,classroom where workout_course.courseId=".$query[$i]['courseId']." and workout_course.classroomid = classroom.Id")->execute()->as_array();
            $query[$i]['Place'] = '';
            $query[$i]['weeknum'] = '';
            foreach ($classinf as $classvalue) {
                $query[$i]['Place'] = $query[$i]['Place'] . $classvalue['Place'] . " ";
                $query[$i]['weeknum'] = $query[$i]['weeknum'] ."周".$classvalue['weeknum'].":".$classvalue['startsection']."-".$classvalue['endsection']."节;";
            }
        }
        return $query;

    }

    public  static  function  getGeneralByStuId($table){    //获得校选课根据学生Id
        $query=DB::query(Database::SELECT,"select * from course where PropertyId = 2 and courseId not in (select courseId from courseselection_stu where studentId = ".$_COOKIE['id'].")")->execute()->as_array();
        for ($i=0;$i<sizeof($query);$i++) {
            $teachername = DB::query(Database::SELECT,"select teacher.name from courseselection_tea,teacher where courseselection_tea.courseId=".$query[$i]['courseId']." and teacher.teacherId = courseselection_tea.teacherId" )->execute()->as_array();
            $query[$i]['teachername'] = '';
            foreach ($teachername as $teachervalue)
                $query[$i]['teachername'] = $query[$i]['teachername'].$teachervalue['name']." ";

            $classinf = DB::query(Database::SELECT,"select workout_course.weeknum,workout_course.startsection,workout_course.endsection,classroom.Place from workout_course,classroom where workout_course.courseId=".$query[$i]['courseId']." and workout_course.classroomid = classroom.Id")->execute()->as_array();
            $query[$i]['Place'] = '';
            $query[$i]['weeknum'] = '';
            foreach ($classinf as $classvalue) {
                $query[$i]['Place'] = $query[$i]['Place'] . $classvalue['Place'] . " ";
                $query[$i]['weeknum'] = $query[$i]['weeknum'] ."周".$classvalue['weeknum'].":".$classvalue['startsection']."-".$classvalue['endsection']."节;";
            }
        }
        return $query;

    }

    public  static  function  getPEByStuId($table){   //体育课
        $query=DB::query(Database::SELECT,"select * from course where PropertyId = 3 and courseId not in (select courseId from courseselection_stu where studentId = ".$_COOKIE['id'].")")->execute()->as_array();
        for ($i=0;$i<sizeof($query);$i++) {
            $teachername = DB::query(Database::SELECT,"select teacher.name from courseselection_tea,teacher where courseselection_tea.courseId=".$query[$i]['courseId']." and teacher.teacherId = courseselection_tea.teacherId" )->execute()->as_array();
            $query[$i]['teachername'] = '';
            foreach ($teachername as $teachervalue)
                $query[$i]['teachername'] = $query[$i]['teachername'].$teachervalue['name']." ";

            $classinf = DB::query(Database::SELECT,"select workout_course.weeknum,workout_course.startsection,workout_course.endsection,classroom.Place from workout_course,classroom where workout_course.courseId=".$query[$i]['courseId']." and workout_course.classroomid = classroom.Id")->execute()->as_array();
            $query[$i]['Place'] = '';
            $query[$i]['weeknum'] = '';
            foreach ($classinf as $classvalue) {
                $query[$i]['Place'] = $query[$i]['Place'] . $classvalue['Place'] . " ";
                $query[$i]['weeknum'] = $query[$i]['weeknum'] ."周".$classvalue['weeknum'].":".$classvalue['startsection']."-".$classvalue['endsection']."节;";
            }
        }
        return $query;
    }
    
    
    public static function selectCourse($data){   //  选课   公用
        $cour=DB::query(Database::SELECT,"select weeknum,startsection,endsection from workout_course where courseId=".$data)->execute()->as_array();
        $week=DB::query(Database::SELECT,"select weeknum,startsection,endsection from workout_course where courseId in (select courseId from courseselection_stu where studentId = ".$_COOKIE['id'].")")->execute()->as_array();
        $count = 0;
        $t = 0;
        for($j = 0;$j<sizeof($week);$j++)
        {
            if(($week[$j]['weeknum'] ==$cour[$t]['weeknum'])
                &&(($week[$j]['startsection']<=$cour[$t]['startsection'] && $week[$j]['endsection']>=$cour[$t]['startsection'] )
                    ||($week[$j]['startsection']<=$cour[$t]['endsection'] && $week[$j]['endsection']>=$cour[$t]['endsection'])))
            {
                $count++;
            }
        }
        if($count == 0)
        {
            $select = DB::query(Database::SELECT,'select * from courseselection_stu where studentId='.$_COOKIE['id'].' and courseId='.$data)->execute()->as_array();
            if(sizeof($select)!=1) {
                $query = DB::query(Database::INSERT, 'insert into courseselection_stu(studentId,courseId) values (' . $_COOKIE['id'] . ',' . $data . ')')->execute();
                $up = DB::query(Database::UPDATE,'update course set margin=margin-1 where courseId='.$data)->execute();
                return $query;
            }
        }
    }

    public  static  function  getAllCourseByStuId($table)  //获取所有已选课程
    {
        $query=DB::query(Database::SELECT,"select * from course where PropertyId != 1 and courseId in(select courseId from courseselection_stu where studentId = ".$_COOKIE['id'].")")->execute()->as_array();
        for ($i=0;$i<sizeof($query);$i++) {
            $teachername = DB::query(Database::SELECT,"select teacher.name from courseselection_tea,teacher where courseselection_tea.courseId=".$query[$i]['courseId']." and teacher.teacherId = courseselection_tea.teacherId" )->execute()->as_array();
            $query[$i]['teachername'] = '';
            foreach ($teachername as $teachervalue)
                $query[$i]['teachername'] = $query[$i]['teachername'].$teachervalue['name']." ";

            $classinf = DB::query(Database::SELECT,"select workout_course.weeknum,workout_course.startsection,workout_course.endsection,classroom.Place from workout_course,classroom where workout_course.courseId=".$query[$i]['courseId']." and workout_course.classroomid = classroom.Id")->execute()->as_array();
            $query[$i]['Place'] = '';
            $query[$i]['weeknum'] = '';
            foreach ($classinf as $classvalue) {
                $query[$i]['Place'] = $query[$i]['Place'] . $classvalue['Place'] . " ";
                $query[$i]['weeknum'] = $query[$i]['weeknum'] ."周".$classvalue['weeknum'].":".$classvalue['startsection']."-".$classvalue['endsection']."节;";
            }
        }
        return $query;
    }

    public static function courseDelete($data){  //删除课程
        $select = DB::query(Database::SELECT,'select * from courseselection_stu where studentId='.$_COOKIE['id'].' and courseId='.$data)->execute()->as_array();
        if(sizeof($select)==1) {
            $query = DB::query(Database::DELETE,'delete from courseselection_stu where studentId='.$_COOKIE['id'].' and courseId='.$data)->execute();
            $down = DB::query(Database::UPDATE,'update course set margin=margin+1 where courseId='.$data)->execute();
            return $query;
        }
    }


    public  static  function  getCourseTable() //课程表
    {
        $b=$_COOKIE['id'];
        $sql=DB::query(Database::SELECT,"select workout_course.courseid,weeknum,startsection,endsection,startweek,endweek,
                                Place as classname,course.name,teacher.name as teachername 
                                from workout_course,classroom,course,courseselection_tea,teacher where classroomid=classroom.Id 
                                and course.courseId=workout_course.courseid and courseselection_tea.courseId=workout_course.courseid 
                                and teacher.teacherId=courseselection_tea.teacherId and workout_course.courseid in (
                                select courseselection_stu.courseId from courseselection_stu where  courseselection_stu.studentId=$b)")->execute()->as_array();
        return $sql;
    }
    public static function getTeacherById()            //获取教师信息
    {
        $b=$_COOKIE['id'];
        $sql=DB::query(Database::SELECT,"select name,teacherId from teacher where teacherId=$b")->execute()->as_array();
        return $sql;
    }
    public  static  function getAllCourseByTeacherId()      //根据老师获取课程
    {
        $b=$_COOKIE['id'];
        $sql=DB::query(Database::SELECT,"select workout_course.courseid,weeknum,startsection,endsection,startweek,endweek,Place 
                            as classname,course.testtime,course.credit,course.name,course.capacity,course.margin,course.campus,college.name 
                            as collegeId,course.property,course.classhour,course.direction,teacher.name as teachername
                            from workout_course,classroom,course,courseselection_tea,teacher,college
                            where classroomid=classroom.Id and course.courseId=workout_course.courseid
                            and courseselection_tea.courseId=workout_course.courseid
                            and teacher.teacherId=courseselection_tea.teacherId
                            and course.collegeId=college.collegeId
                            and workout_course.courseid in (select courseselection_tea.courseId from courseselection_tea where 
                            courseselection_tea.teacherId=$b)")->execute()->as_array();
        // $a[0]=$sql[0];
        $k=0;
        $x=0;
        $i=0;
        while($k<sizeof($sql))
        {

            if ($sql[$i]['courseid'] != -1) {
                $a[$x] = $sql[$i];
                $a[$x]['time']="周".$sql[$i]['weeknum'].','.$sql[$i]['startsection']."~".$sql[$i]['endsection']."节;";
                $a[$x]['classname']=$sql[$i]['classname'].";";
                $a[$x]['startend']="第".$sql[$i]['startweek']."~".$sql[$i]['endweek']."周;";
                for ($j = $i + 1; $j < sizeof($sql); $j++) {
                    if ($sql[$i]['courseid'] == $sql[$j]['courseid']) {
                        $a[$x]['time']=$a[$x]['time']."周".$sql[$j]['weeknum'].','.$sql[$j]['startsection']."~".$sql[$j]['endsection']."节;";
                        $a[$x]['classname']=$a[$x]['classname'].$sql[$j]['classname'].";";
                        $a[$x]['startend']=$a[$x]['startend']."第".$sql[$j]['startweek']."~".$sql[$j]['endweek']."周;";
                        $sql[$i]['courseid']=-1;
                        $k++;
                        $i=$j;
                    }
                }
                $sql[$i]['courseid']=-1;
                $k++;
                $x++;
                $i=0;
            }
            else{
                $i++;
            }

        }
        return $a;
    }
    public  static  function  getCourById()               //获取课程信息
    {
        $b=$_COOKIE['courseid'];
        $sql=DB::query(Database::SELECT,"select courseId,name from course where courseId=$b")->execute()->as_array();
        return $sql;
    }
    public  static function getStuByCourseId()           //获取选课人列表
    {
        $b=$_COOKIE['courseid'];
        $sql=DB::query(Database::SELECT,"select student.studentId,student.name as name,student.class,major.name as major,college.name as college 
                    from student,courseselection_stu,major,college where courseselection_stu.studentId=student.studentId
                    and courseselection_stu.courseId=$b
                    and student.majorId=major.majorId
                    and major.collegeId=college.collegeId")->execute()->as_array();
        return $sql;
    }


    //康宁的代码
    public static function getAdminById(){                //获取管理员信息
        $b=$_COOKIE['id'];
        $sql=DB::query(Database::SELECT,"select name,adminId from admin where adminId=$b")->execute();
        return $sql;

    }

    public static function manselectCourse($data)      //手动录入课程
    {
        $query = DB::query(Database::INSERT, 'insert into courseselection_stu(studentId,courseId) values ('  . $data['snum'] . ','.$data['cnum'].')')->execute();
        $down = DB::query(Database::UPDATE,'update course set margin=margin-1 where courseId='.$data['cnum'])->execute();
        return $query;
    }
    public static function mandeleteCourse($a,$b)      //手动删持课程
    {
        //  $s=DB::query(Database::SELECT, 'select * from courseselection_stu where studentId='. $data['snum'] . 'and courseId='.$data['cnum'])->execute()->as_array();
        // if(sizeof($s)>0)
        //    {
        $query = DB::query(Database::DELETE, "delete from courseselection_stu where studentId=$a and courseId=$b")->execute();
        $down = DB::query(Database::UPDATE,"update course set margin=margin+1 where courseId=$b")->execute();
        return $query;
        //  }

    }
    
    public  static  function getallStu()
    {
        $sql=DB::query(Database::SELECT,"select student.studentId,student.name as stuName,student.sex,student.EnrollmentYear,student.class,major.name as majName,college.name as colName from student,major,college 
where student.majorId=major.majorId and major.collegeId=college.collegeId")->execute()->as_array();
        return $sql;
    }
    public static function  getallTea()
    {
        $sql=DB::query(Database::SELECT,"SELECT teacher.teacherId,teacher.name as teaName,teacher.sex,college.name as colName from teacher,college WHERE teacher.collegeId=college.collegeId")->execute()->as_array();
        return $sql;
    }

 
    
    public  static  function manSelCour()    //获取课程列表
    {
        $sql=DB::query(Database::SELECT,"select courseId,name,margin from course")->execute()->as_array();
        return $sql;
    }

    public static function subInsert($data){

        $select = DB::query(Database::SELECT,'select * from course where courseId='.$data)->execute()->as_array();
        if(sizeof($select)!=1){
            $query = DB::query(Database::INSERT, 'insert into course select courseId,name,property,credit,direction,classhour,testtime,capacity,margin,belong,campus,collegeId,PropertyId from release_course where courseId ='.$data)->execute();
            DB::query(Database::UPDATE,'update release_course set publish = 1 where courseId='.$data )->execute();
            return $query;
        }
    }

    public  static  function  releasecourse($table)
    {
        $query=DB::query(Database::SELECT,"select * from release_course where publish = 0")->execute()->as_array();
        return $query;
    }












    public static function modifygetteacherById($data){
        $query = DB::query(Database::SELECT , 'select teacherId,password,teacher.name,sex,college.name AS  collegename,self_description from teacher , college WHERE teacher.collegeId=college.collegeId AND teacherId='.$data)->execute()->as_array();
        return $query;
    }

    public static function modifyupdateTeacher($table){
        //        $collegeid=DB::query(Database::SELECT , 'select collegeId from college where name='.$table['collegename'])->execute()->as_array();
//        $query=DB::query(Database::UPDATE,'update teacher set  "name"='.$table['name'].',"password"='.$table['password'].',"sex"='.$table['sex'].',"self_description"='.$table['self_description'].',collegeId='.$collegeid.' where teacherId='.$table['teacherId'] )->execute()->as_array();
        $strsql="update teacher set name='".$table['name']."',password='".$table['password']."',sex='".$table['sex']."',self_description='".$table['self_description']."',collegeId=(select collegeId from college where name='".$table['collegename']."') where teacherId=".$table['teacherId'];

        //$strsql = "update teacher set name='孙永利',password='123456',sex='女',self_description='',collegeId=(select collegeId from college where name='信息科学与技术') where teacherId='2'";
        $query=DB::query(Database::UPDATE, $strsql)->execute();
        return $query;
    }

    public static function admingetallteacher($table){
        $query = DB::query(Database::SELECT , 'select teacherId,password,teacher.name,sex,college.name AS  collegename,self_description from teacher , college WHERE teacher.collegeId=college.collegeId')->execute()->as_array();
//        $query = DB::query(Database::SELECT , 'select * from '.$table)->execute()->as_array();
        return $query;
    }

    public static function admingetallcollege($table){
        $query=DB::query(Database::SELECT , 'select * from college')->execute()->as_array();
        return $query;
    }

    public static function adminaddteacher($data){
        $strsql="insert into teacher (name,password,sex,collegeId) value ('".$data['name']."','".$data['password']."','".$data['sex']."',(select collegeId from college where name='".$data['collegename']."'))";
//        $strsql="insert into teacher (name,password,sex,collegeId) value ('史晟辉','123456','女',(select collegeId from college where name='信息科学与技术'))"; 
        $query=DB::query(Database::INSERT, $strsql)->execute();
        return $query;
    }
    public static function admindeleteteacherById($data){
        $query=DB::query(Database::DELETE, 'delete from teacher where teacherId='.$data)->execute();
//        $query=DB::query(Database::DELETE, 'delete from teacher where teacherId=26')->execute();
        return $query;
    }







    public static function admingetmajor()
    {
        $query=DB::query(Database::SELECT,'select name from major')->execute()->as_array();
        return $query;
    }

    public static function modifyupdate_student($data)
    {
        $query=DB::query(Database::UPDATE,'update student set student.name="'.$data['name'].'",password="'.$data['password'].'",sex ="'.$data['sex'].'",class="'.$data['class'].'",EnrollmentYear="'.$data['EnrollmentYear'].'",self_description="'.$data['self_description'].'",majorId=(select majorId from major where major.name="'.$data['majorName'].'") where studentId='.$data['studentId'])->execute();

        return $query;
    }

    public static function admindelete_student($data)
    {
        $query=DB::query(Database::DELETE,'delete from student where studentId='.$data)->execute();
//        $query=DB::query(Database::DELETE,'delete from student where studentId=2013014263')->execute();
        return $query;
    }

    public static function adminadd_student($data)
    {

        $query=DB::query(Database::INSERT,'insert into student (name,password,sex,class,EnrollmentYear,self_description,majorId) VALUE ("'.$data['name'].'","'.$data['password'].'","'.$data['sex'].'","'.$data['sclass'].'","'.$data['EnrollmentYear'].'","'.$data['self_description'].'",(select majorId from major where name="'.$data['majorName'].'"))')->execute();
        return $query;
    }

    public static function modifygetStudentById($data)
    {
        $query=DB::query(Database::SELECT,'select student.name,password,sex,class,EnrollmentYear,self_description,major.name as majorName from student,major where studentId='.$data.' and student.majorId=major.majorId')->execute()->as_array();
        return $query;
    }

    public static function admingetstudent($table){
        $query = DB::query(Database::SELECT , 'select studentId,student.name,password,sex,class,EnrollmentYear,self_description,major.name as majorName from student,major where student.majorId=major.majorId')->execute()->as_array();
        return $query;
    }
    
    
    
    
    //yanse
    

    public static function selectById($table, $id) {
        $query = DB::select()
            ->from($table)
            ->where($table.'Id', '=', $id)
            ->execute()
            ->as_array();
        return $query;
    }

    public static function fetchOne($table, $key, $val) {
        $query = DB::select()
            ->from($table)
            ->where($key, '=', $val)
            ->execute()
            ->as_array();
        return $query;
    }

    public static function fetchAll($table, $key, $val, $order) {
        $query = DB::select()
            ->from($table)
            ->where($key, '=', $val)
            ->order_by($order,'asc')
            ->execute()
            ->as_array();
        return $query;
    }

    public static function insert($table, $data) {
        $key = array_keys($data);
        $index = 0;
        foreach ($key as $k) {
            $key[$index] = $table.$k;
            $index++;
        }
        // insert 插入过程
        $query = DB::insert($table, $key)
            ->values($data)
            ->execute();
        // 返回主键id 影响条数
        return $query;
    }

    public static function updateById($table, $id, $dataArray) {
        foreach ($dataArray as $key => $val) {
            $dataArray[$table.$key] = $val;
            unset($dataArray[$key]);
        }
        $query = DB::update($table)
            ->set($dataArray)
            ->where($table.'Id', '=', $id)
            ->execute();
        return $query;
    }

    public static function deleteById($table, $id) {
        return DB::delete()
            ->table($table)
            ->where($table.'Id', '=', $id)
            ->execute();
    }
    
}