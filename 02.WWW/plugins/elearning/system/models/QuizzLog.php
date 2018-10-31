<?php

namespace Elearning\System\Models;

use Model;
use Elearning\System\Classes\Helper As HelperClass;
use Request;

/**
 * Model
 */
class QuizzLog extends Model {

    use \October\Rain\Database\Traits\Validation;

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_quizz_log';

    public static function insertLog($quizz_result_id) {
        $user = HelperClass::checkUser();
        if ($user) {
            $user_id = $user->id;
            $data = Request::all();
            if (isset($data) && !empty($data)) {
                foreach ($data as $key => $value) {
                    $question = explode("question", $key);
                    if (isset($question[1])) {
                        foreach ($value as $answer) {
                            self::insertGetId(
                                            array('quizz_result_id' => $quizz_result_id,
                                                'user_id' => $user_id,
                                                'question_id' => $question[1],
                                                'answer_id'=>$answer)
                            );
                        }
                    }
                }
                return true;
            }
        }
        return false;
    }

}
