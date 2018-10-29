<?php namespace Elearning\System\Models;

use Model;

/**
 * subjectParent Model
 */
class SubjectParent extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_subject_parents';

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
    public $hasMany = [];
    public $belongsTo = [];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];
}
