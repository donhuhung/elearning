<?php namespace Elearning\System\Models;

use Model;
use Elearning\System\Classes\Helper As HelperClass;
use Elearning\System\Models\Answer;

/**
 * Model
 */
class Question extends Model
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
    public $table = 'elearning_system_question';

    public static function getListAllPaging($per_item,$page){
        return self::where('is_active',1)->paginate($per_item,$page);
    }

    public static function store() {        
        $course_id = post('qs_cate');
        $question = post('question');
        $user = HelperClass::checkUser();
        $user_id = $user->id;            
        $question_id = self::insertGetId(
            array('question' => $question, 
                    'course_id' => $course_id,
                    'is_active' =>1,
                    'user_id' => $user_id)
        );     
        if($question_id && $question_id > 0)
        {
            Answer::store($question_id);
            return $question_id;
        }
        return false;
    }
    
    public static function onDelete()
    {
        $question_id = post('record_id');
        if($question_id && $question_id > 0)
        {
            $data = self::find($question_id);
            if($data){
                $data['is_active'] = 0;
                $data->save();
                return true;
            }              
            return false;
        }        
        return false;
    }
    
    public static function randomQuestion($number_question)
    {
        return self::where('is_active', 1)->orderByRaw('RAND()')->take(10)->get();
    }
}
