<?php namespace Elearning\System\Models;

use Model;

/**
 * Model
 */
class Answer extends Model
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
    public $table = 'elearning_system_answers';

    public static function store($question_id)
    {
        $total_answer = post('total-answer');        
        if($total_answer > 0)               
        {
            $is_correct = 0;
            $data_answer = post('answer');            
            if($data_answer)
            {
                for($i=1; $i<=$total_answer; $i++){
                    $data_is_correct = post('is_correct'); 
                    $answer = $data_answer[$i];           
                    if(isset($data_is_correct[$i])) 
                    {
                        $is_correct = $data_is_correct[$i];                    
                    }
                    $question_id = self::insertGetId(
                        array('question_id' => $question_id, 
                                'answer' => $answer,
                                'is_correct' =>$is_correct)
                    ); 
                }  
                return true;
            }
            return false;
        }
        return false;                
    }
}
