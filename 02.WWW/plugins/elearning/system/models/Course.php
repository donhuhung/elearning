<?php namespace Elearning\System\Models;

use Model;
use Elearning\System\Classes\Helper As HelperClass;
use Response;
use System\Models\File;

/**
 * course Model
 */
class Course extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_courses';


    use \October\Rain\Database\Traits\Validation;

    public $rules = [
        'name' => 'required'
    ];

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
       'topics' => ['Elearning\System\Models\Topic']
    ];
    public $belongsTo = [
        'level' => ['Elearning\System\Models\Level'],
        'subject' => ['Elearning\System\Models\Subject'],
        'teacher' => ['RainLab\User\Models\User', 'key' => 'user_id'],
    ];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];

    /** 
      *  Set Course Name Attribute
     */
    public function setNameAttribute($value)
    {
        if(!$value)
        {
            $this->attributes['name'] = "default";
        }else
        {
            $this->attributes['name'] = $value;

        }
    }

    /** 
     *  Get Language Option in Courses Form 
     */
    public function getLanguageOptions() 
    {
        return ["AR"=>'AR', "EN"=>"EN"];
    }

    /** 
     *  Get Level Option in Courses Form 
     */
    public function getLevelOptions() 
    {
        return \Elearning\System\Models\Level::lists('name','id');
    }

    /** 
     *  Get subject Option in Courses Form 
     */
    public function getSubjectOptions() 
    {
        return \Elearning\System\Models\Subject::lists('name','id');
    }
    
    public function beforeSave()
    {
        $this->slug = str_slug($this->name);
    }
    public static function scopeHighlight(){
        return self::where('is_highlight', 1);
    }

    public static function getListAllPaging($per_item,$page){
        return self::where('publish',1)->paginate($per_item,$page);
    }

    public static function getListHomepage()
    {
        return self::highlight()->get();
    }
    
    public static function getDetail($slug)
    {
        return self::where('slug',$slug)->first();
    }
    
    public static function getOtherCourse($subject_id)
    {        
        return self::where('subject_id',$subject_id)
                ->offset(0)
                ->limit(5)
                ->get();
    }
    
    public static function getCourseByTeacher($teacher_id)
    {
        return self::where('user_id',$teacher_id)
                ->where('publish',1)
                ->offset(0)
                ->limit(3)
                ->get();
    }
    
    public static function getCoursePagination($per_item, $page)
    {
        return self::where('publish',1)
                /*->where('is_highlight',0)*/
                ->orderBy('id','DESC')
                ->paginate($per_item, $page);        
    }


    public static function store() {        
        $user = HelperClass::checkUser();
        if($user){
            $thumbnail = self::handleUploadThumbnail();
            $name = post('full_name');
            $slug = str_slug($name);  
            $user_id = $user->id;            
            return self::insertGetId(
                array('name' => $name, 
                        'slug' => $slug,
                        'level_id' =>post('level'),
                        'subject_id' => post('subject'),
                        'rating' => '5',
                        'total_student' => post('quatity'),
                        'user_id' => $user_id,
                        'is_highlight' => 0,
                        'total_lesson' => post('total_lesson'),
                        'total_time_learn' => post('total_hour'),
                        'content' => post('content'),
                        'price' => post('price'),
                        'description' => post('info_body'),
                    'thumbnail' =>$thumbnail,
                    'publish'=>1)
            );
        }        
    }
    
    public static function edit($course_id) {
        $data = self::find($course_id);
        $thumbnail = self::handleUploadThumbnail();
        if ($data) {
            $data['name'] = post('full_name');
            $data['slug'] = str_slug(post('full_name'));
            $data['level_id'] = post('subject');
            $data['subject_id'] = post('subject');
            $data['total_student'] = post('quatity');
            $data['total_lesson'] = post('total_lesson');
            $data['total_time_learn'] = post('total_hour');
            $data['content'] = post('content');
            $data['price'] = post('price');
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
    
    private static function handleUploadThumbnail() {
        $img = post('data-avatar');
        if (!empty($img)) {
            $file = new File;
            $string_base64 = explode(",", $img);            
            $fname = time() . ".jpg";
            $path = public_path() . "/storage/app/media/courses/" . $fname;
            self::base64_to_png("" . $string_base64[1], $path);
            $file->data = $path;
            $file->save();
            $pathName = "/courses/" . $fname;
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
