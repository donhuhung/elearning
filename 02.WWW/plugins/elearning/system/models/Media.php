<?php namespace Elearning\System\Models;

use Model;

/**
 * Media Model
 */
class Media extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_media';

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
    public $belongsTo = [ 'Lesson' => ['Elearning\System\Models\Lesson']   ];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [
       'path' =>['System\Models\File', 'public' => false]
    ];
    public $attachMany = [];



    /**
    * Get All Available Extention 
    */
    public function getAllMediaType()
    {
        // return [

        //   'text'        => [ 'PDF' => '.pdf'],
        //   'video'       => [ 'MP4' => '.MP4'],
        //   'interactive' => [ 'SWF' => '.swf'],

        //    ]


        
    } 




}
