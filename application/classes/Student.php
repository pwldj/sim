<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/11
 * Time: 10:08
 */
class Student{
    private static $table = 'student';
    public static function getStudentById()    //根据Id获取学生信息
    {
        $data = $_COOKIE['id'];
        return BaseClass::getStudentById($data);
    }
    public static function getAllStudent(){
        return BaseClass::getAllStu();
    }
}