<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/24
 * Time: 12:01
 */
class Teacher{
    private static $table = 'teacher';
    public static function getTeacherById()    //根据Id获取学生信息
    {
        return BaseClass::getTeacherById();
    }
    public  static  function  getAllCourseByTeaId()
    {
        return BaseClass::getAllCourseByTeacherId();
    }
    public static function getAllTeacher()
    {
        return BaseClass::getallTea();
    }
}