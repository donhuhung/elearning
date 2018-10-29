<?php namespace Elearning\System\Models;

use Model;

/**
 * Model
 */
class District extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_district';
    
    public static function loadDistrictByProvince($provine_id){
        return self::where('province_id',$provine_id)->get();
    }
}
