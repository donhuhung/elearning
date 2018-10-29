<?php

namespace Elearning\System\Models;

use Model;
use Elearning\System\Models\Question;

/**
 * Model
 */
class StoreQuizzContent extends Model {

    use \October\Rain\Database\Traits\Validation;

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_store_quizz_info';

    public static function store($store_id, $number_question) {
        $data = self::where('store_quizz_id',$store_id)->get();
        if($data){
            foreach($data as $record){
                $record->delete();
            }
        }
        $questions = Question::randomQuestion($number_question);
        if ($questions) {
            foreach ($questions as $question) {
                self::insertGetId(
                        array('store_quizz_id' => $store_id,
                            'question_id' => $question->id)
                );
            }
            return true;
        } else
            return false;
    }

}
