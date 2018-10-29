<?php namespace Elearning\System\Models;

use Model;

/**
 * Topic Model
 */
class Topic extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_topics';

    /**
     * @var array Guarded fields
     */
    protected $guarded = ['*'];

    /**
     * @var array Fillable fields
     */
    protected $fillable = [];

    /**
     * @var array Relations
     */
    public $hasOne = [];
    public $hasMany = [
       'lessons' => ['Khalil/Elearning/Models/Level']
    ];
    public $belongsTo = [
       'course' => ['Khalil/Elearning/Models/course']
    ];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];
}
