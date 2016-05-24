<?php
/**
 * Created by PhpStorm.
 * User: Vic
 * Date: 2016.5.19
 * Time: 3:00
 */
class AdminTeacher{
    private static $table = 'teacher';
    public static function AdmingetAllTeacher(){
        return BaseClass::admingetallteacher(self::$table);
    }
    public static function AdmingetAllCollege(){
        return BaseClass::admingetallcollege(self::$table);
    }
    public static function Adminupdateteacher($data){
        return BaseClass::modifyupdateTeacher($data);
    }
    public static function Adminaddteacher($data){
        return BaseClass::adminaddteacher($data);
    }
    public static function Admindeleteteacher($data){
        return BaseClass::admindeleteteacherById($data);
    }
}