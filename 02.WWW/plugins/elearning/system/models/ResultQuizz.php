<?php namespace Elearning\System\Models;

use Model;
use Elearning\System\Classes\Helper As HelperClass;
use Elearning\System\Models\QuizzLog;

/**
 * Model
 */
class ResultQuizz extends Model
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
    public $table = 'elearning_system_result_quizz';
    
    public static function insertResult($total_correct)
    {
        $user = HelperClass::checkUser();
        if($user){
            $user_id = $user->id;            
            $result = self::insertGetId(
                array('quizz_id' => post('quizz_id'), 
                        'user_id' => $user_id,
                        'total_correct' =>$total_correct)
            );
            if($result){
                QuizzLog::insertLog($result);
                return true;                
            }
            return false;
        }
        return false;
    }
}
