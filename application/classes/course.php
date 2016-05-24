<?php

/**
 * Created by PhpStorm.
 * User: LZM20
 * Date: 2016/5/16
 * Time: 21:05
 */
class Course
{
    public  static  $table='course';
    public  static function  getCourseByStuId()     //获取学生已选课程
    {
        return BaseClass::getCourseByStuId(self::$table);
    }

    public  static function  getProByStuId()      //获得专业选课根据xueshengID
    {
        return BaseClass::getProByStuId(self::$table);
    }
    
    public  static function  getGeneralByStuId()      //获得专业选课根据xueshengID
    {
        return BaseClass::getGeneralByStuId(self::$table);
    }
    public  static function  getPEByStuId()      //获得专业选课根据xueshengID
    {
        return BaseClass::getPEByStuId(self::$table);
    }

    public static function selectCourse($data){
        return BaseClass::selectCourse($data);
    }
    public static function getAllCourseByStuId(){
        return BaseClass::getAllCourseByStuId(self::$table);
    }
    public static function courseDelete($data){
        return BaseClass::courseDelete($data);
    }
    public  static  function  getStudentByCourseId(){
        return BaseClass::getStuByCourseId();
    }
    public  static  function  getCourseById(){
        return BaseClass::getCourById();
    }
    public  static  function  manSelCour(){
        return BaseClass::manSelCour();
    }
    
}