<?php

namespace Elearning\System\Models;

use Model;

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

}
