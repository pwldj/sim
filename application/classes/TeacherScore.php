<?php

/**
 * Created by PhpStorm.
 * User: small
 * Date: 2016/5/16
 * Time: 17:35
 */
class TeacherScore {
    private static $table = "teacher";

    public static function setTable($table) {
        self::$table = $table;
    }

    public static function getCourse() {
        $teacherId=$_COOKIE['id'];
        $table = "courseselection_tea";
        TeacherScore::setTable($table);
        $course = TeacherScore::fetchOne("teacherId", $teacherId);
        // 查找所授课程名称
        $table = "course";
        TeacherScore::setTable($table);
        for ($i = 0; $i < count($course); $i++) {
            $temp = TeacherScore::selectById($course[$i]['courseId']);
            $course[$i]['name'] = $temp[0]['name'];
        }
        return $course;
    }

    

    public static function selectById($id) {
        return BaseClass::selectById(self::$table, $id);
    }

    public static function fetchOne($key, $val) {
        return BaseClass::fetchOne(self::$table, $key, $val);
    }

    public static function fetchAll($key, $val, $order) {
        return BaseClass::fetchAll(self::$table, $key, $val, $order);
    }

    public static function insert($data) {
        return BaseClass::insert(self::$table, $data);
    }

    public static function updateById($id, $dataArray) {
        return BaseClass::updateById(self::$table, $id, $dataArray);
    }

    public static function daleteById($id) {
        return BaseClass::deleteById(self::$table, $id);
    }

}