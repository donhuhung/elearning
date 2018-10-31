<?php

namespace Elearning\System\Models;

use Model;
use Request;

/**
 * Model
 */
class Answer extends Model {

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

    public static function store($question_id) {
        $total_answer = post('total-answer');
        if ($total_answer > 0) {
            $data_answer = post('answer');
            if ($data_answer) {
                for ($i = 1; $i <= $total_answer; $i++) {
                    $is_correct = 0;
                    $data_is_correct = post('is_correct');
                    $answer = $data_answer[$i];
                    if (isset($data_is_correct[$i])) {
                        $is_correct = $data_is_correct[$i];
                    }
                    $answer_id = self::insertGetId(
                                    array('question_id' => $question_id,
                                        'answer' => $answer,
                                        'is_correct' => $is_correct)
                    );
                }
                return true;
            }
            return false;
        }
        return false;
    }

    public static function checkCorrectAnswer() {
        $arrQuestion = array();
        $arrData = array();
        $data = Request::all();
        if (isset($data) && !empty($data)) {
            foreach ($data as $key => $value) {
                $question = explode("question", $key);
                if (isset($question[1])) {
                    $arrValue = array();
                    array_push($arrQuestion, $question[1]);
                    foreach ($value as $answer) {
                        $arrValue[] = $answer;
                    }
                    $arrData['question' . $question[1]] = $arrValue;
                }
            }
        }
        $arrCorrectAnswer = self::getCorrectAnswer($arrQuestion);
        $result = self::compareArray($arrData, $arrCorrectAnswer);
        return $result;
    }

    private static function getCorrectAnswer($arrQuestion) {
        $data = self::whereIn('question_id', $arrQuestion)
                ->where('is_correct', 1)
                ->groupBy('id')
                ->get();
        if ($data) {
            return self::parseCorrectAnswer($data);
        } else
            return false;
    }

    private static function parseCorrectAnswer($data) {
        $arrCorrectAnswer = array();
        $arrValue = array();
        $question_id_temp = 0;

        foreach ($data as $record) {
            if ($question_id_temp != $record->question_id) {
                $arrValue = array();
            }
            $arrValue[] = $record->id;
            $arrCorrectAnswer['question' . $record->question_id] = $arrValue;
            $question_id_temp = $record->question_id;
        }
        return $arrCorrectAnswer;
    }

    private static function compareArray($arrPost, $arrData) {
        $count = 0;
        foreach ($arrData as $key => $value) {
            if (in_array(($value), $arrPost))
                $count++;
        }
        return $count;
    }

}
