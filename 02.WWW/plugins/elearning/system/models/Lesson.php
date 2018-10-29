<?php namespace Elearning\System\Models;

use Model;
use Elearning\System\Classes\Helper As HelperClass;
use Response;
use System\Models\File;

/**
 * Lesson Model
 */
class Lesson extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'elearning_system_lessons';

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
      'media' => ['Elearning\System\Models\Media']       
    ];
    public $belongsTo = [
      'topic' => ['Elearning\System\Models\Topic']
    ];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [
       
    ];
    public $attachMany = [];

    public static function store() {        
        $user = HelperClass::checkUser();		
        if($user){
            $thumbnail = self::handleUploadThumbnail();
            $name = post('full_name');
            $slug = str_slug($name);  
            $user_id = $user->id;   
            $parameters = json_encode(post('parameters'));
            return self::insertGetId(
                array('name' => $name, 
                        'slug' => $slug,
                        'description' => post('info_body'),
                    'parameters' => $parameters,
                    'user_id' => $user_id,
                    'thumbnail' =>$thumbnail,
                    'topic_id' =>1)
            );
        }       
		return false;
    }

    private static function handleUploadThumbnail() {
        $img = post('data-avatar');
        if ($img) {
            $file = new File;
            $string_base64 = explode(",", $img);            
            $fname = time() . ".jpg";
            $path = public_path() . "/storage/app/media/lessons/" . $fname;
            self::base64_to_png("" . $string_base64[1], $path);
            $file->data = $path;
            $file->save();
            $pathName = "/lessons/" . $fname;
            return $pathName;
        }
        return Response::json(array(
                    'status' => 0,
                    'message' => 'Error'
        ));
    }

    private static function base64_to_png($base64_string, $output_file) {
        $ifp = fopen($output_file, "wb");
        fwrite($ifp, base64_decode($base64_string));
        fclose($ifp);
        return( $output_file );
    }

    public static function getListAllPaging($per_item,$page){
        return self::paginate($per_item,$page);
    }
}
