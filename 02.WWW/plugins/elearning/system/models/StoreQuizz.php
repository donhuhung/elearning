<?php

namespace Elearning\System\Models;

use Model;
use Elearning\System\Models\StoreQuizzContent;

/**
 * Model
 */
class StoreQuizz extends Model {

    use \October\Rain\Database\Traits\Validation;

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_store_quizz';

    public static function getListAllPaging($per_item, $page) {
        return self::where('is_active', 1)->paginate($per_item, $page);
    }
    
    public static function store() {
        $store_id = self::insertGetId(
                        array('subject_id' => post('quizz_subject'),
                            'number_question' => post('number_question'),
                            'time_quizz' => post('quizz_time'),
                            'is_active' => 1)
        );
        $quizz_content = StoreQuizzContent::store($store_id, post('number_question'));
        if($quizz_content)
            return true;
        else
            return false;
    }

    public static function edit($store_id) {
        $data = self::find($store_id);
        if ($data) {
            $data['subject_id'] = post('quizz_subject');
            $data['number_question'] = str_slug(post('number_question'));
            $data['time_quizz'] = post('quizz_time');
            $data->save();
            StoreQuizzContent::store($store_id, post('number_question'));
            return true;
        }
        return false;
    }
    
    public static function onDelete()
    {
        $course_id = post('record_id');
        if($course_id && $course_id > 0)
        {
            $data = self::find($course_id);
            if($data){
                $data['publish'] = 0;
                $data->save();
                return true;
            }              
            return false;
        }        
        return false;
    }

}
