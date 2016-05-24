<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/11
 * Time: 10:08
 */
class AdminStudent{
    private static $table = 'student';
    public static function getAllStudent(){
        return BaseClass::admingetstudent(self::$table);
    }
    public static function getAllMajor(){
        return BaseClass::admingetmajor();
    }
    public static function update_student($data){
        return BaseClass::modifyupdate_student($data);
    }
    public static function delete_student($data){
        return  BaseClass::admindelete_student($data);
    }
    public static function add_student($data){
        return BaseClass::adminadd_student($data);
    }
}