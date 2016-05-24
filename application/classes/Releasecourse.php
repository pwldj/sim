<?php
/**
 * Created by PhpStorm.
 * User: jinhan
 * Date: 2016/5/24
 * Time: 15:42
 */
class Releasecourse{
    public  static  $table='release_course';
    public  static function getallreleasecourse()
    {
        return BaseClass::releasecourse(self::$table);
    }
    public static function subInsert($data){
        return BaseClass::subInsert($data);
    }
}
