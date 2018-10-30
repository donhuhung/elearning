<?php namespace Elearning\System\Models;

use Model;
use Elearning\System\Classes\Helper As HelperClass;
use Elearning\System\Models\Course;

/**
 * Model
 */
class UserCourse extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_course_student';

    public static function joinCourse()
    {
        $user = HelperClass::checkUser();
        if ($user) {   
            $user_id = $user->id;   
            $course_id = post('course_id');
            $check_exist = self::checkStudentCourse($user_id,$course_id);
            if(!$check_exist || $check_exist == ""){
                return self::insertGetId(
                    array('course_id' => $course_id,                    
                        'student_id' => $user_id,                    
                        'is_active' => 1)
                );
                Course::updateTotalStudent($course_id);
            }     
            return true;       
        }
        return false;
    }

    public static function checkStudentCourse($user_id,$course_id)
    {
        return self::where('course_id',$course_id)
        ->where('student_id',$user_id)
        ->where('is_active',1)
        ->first();
    }
}
