<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/11
 * Time: 10:08
 */

class studentInfoModify{
    public static function getStudentById($data){
        return BaseClass::modifygetStudentById($data);
    }
    public static function update_student($data){
        return BaseClass::modifyupdate_student($data);
    }
}