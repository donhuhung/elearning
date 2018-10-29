<?php

namespace Elearning\System\Models;

use Model;
use System\Models\File;
use Response;

/**
 * subject Model
 */
class Subject extends Model {

    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_subjects';

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
    public $hasMany = ['course' => ['Elearning\System\Models\course']];
    public $belongsTo = [];
    public $belongsToMany = [
        'level' => ['Elearning\System\Models\level']
    ];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];

    public function beforeSave() {
        $this->slug = str_slug($this->name);
    }

    public static function getList() {
        return self::where('is_active', 1)->get();
    }

    public static function getListAllPaging($per_item, $page) {
        return self::paginate($per_item, $page);
    }

    public static function store() {
        $thumbnail = self::handleUploadThumbnail();
        $name = post('full_name');
        $slug = str_slug($name);
        return self::insertGetId(
                        array('name' => $name,
                            'slug' => $slug,
                            'description' => post('info_body'),
                            'thumbnail' => $thumbnail,
                            'is_active' => 1)
        );
    }

    public static function edit($subject_id) {
        $data = self::find($subject_id);
        $thumbnail = self::handleUploadThumbnail();
        if ($data) {
            $data['name'] = post('full_name');
            $data['slug'] = str_slug(post('full_name'));
            $data['description'] = post('info_body');
            if($thumbnail)
                $data['thumbnail'] = $thumbnail;
            $data->save();
            return true;
        }
        return false;
    }
    
    public static function onDelete()
    {
        $subject_id = post('record_id');
        if($subject_id && $subject_id > 0)
        {
            $data = self::find($subject_id);
            if($data){
                $data['is_active'] = 0;
                $data->save();
                return true;
            }              
            return false;
        }        
        return false;
    }

    private static function handleUploadThumbnail() {
        $img = post('data-avatar');
        if ($img) {
            $file = new File;
            $string_base64 = explode(",", $img);
            $fname = time() . ".jpg";
            $path = public_path() . "/storage/app/media/subjects/" . $fname;
            self::base64_to_png("" . $string_base64[1], $path);
            $file->data = $path;
            $file->save();
            $pathName = "/subjects/" . $fname;
            return $pathName;
        }
        return false;
    }

    private static function base64_to_png($base64_string, $output_file) {
        $ifp = fopen($output_file, "wb");
        fwrite($ifp, base64_decode($base64_string));
        fclose($ifp);
        return( $output_file );
    }

}
