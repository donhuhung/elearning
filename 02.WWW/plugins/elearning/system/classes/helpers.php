<?php

namespace Elearning\System\Classes;

use Auth;
use Carbon\Carbon;
use Elearning\System\Models\Province;
use Elearning\System\Models\District;
use Elearning\System\Models\UserCourse;

class Helper {

    public static function checkUser() {
        if (!Auth::check()) {
            return false;
        } else {
            return Auth::getUser();
        }
    }

    public static function getClientIp() {
        $ip_address = '';
        if (getenv('HTTP_CLIENT_IP'))
            $ip_address = getenv('HTTP_CLIENT_IP');
        else if (getenv('HTTP_X_FORWARDED_FOR'))
            $ip_address = getenv('HTTP_X_FORWARDED_FOR');
        else if (getenv('HTTP_X_FORWARDED'))
            $ip_address = getenv('HTTP_X_FORWARDED');
        else if (getenv('HTTP_FORWARDED_FOR'))
            $ip_address = getenv('HTTP_FORWARDED_FOR');
        else if (getenv('HTTP_FORWARDED'))
            $ip_address = getenv('HTTP_FORWARDED');
        else if (getenv('REMOTE_ADDR'))
            $ip_address = getenv('REMOTE_ADDR');
        else
            $ip_address = 'UNKNOWN';
        return $ip_address;
    }

    public static function getUserAgent() {
        $u_agent = $_SERVER['HTTP_USER_AGENT'];
        $bname = 'Unknown';
        $platform = 'Unknown';
        $version = "";

        //First get the platform?
        if (preg_match('/linux/i', $u_agent)) {
            $platform = 'linux';
        } elseif (preg_match('/macintosh|mac os x/i', $u_agent)) {
            $platform = 'mac';
        } elseif (preg_match('/windows|win32/i', $u_agent)) {
            $platform = 'windows';
        }

        // Next get the name of the useragent yes seperately and for good reason
        if (preg_match('/MSIE/i', $u_agent) && !preg_match('/Opera/i', $u_agent)) {
            $bname = 'Internet Explorer';
            $ub = "MSIE";
        } elseif (preg_match('/Firefox/i', $u_agent)) {
            $bname = 'Mozilla Firefox';
            $ub = "Firefox";
        } elseif (preg_match('/OPR/i', $u_agent)) {
            $bname = 'Opera';
            $ub = "Opera";
        } elseif (preg_match('/Chrome/i', $u_agent)) {
            $bname = 'Google Chrome';
            $ub = "Chrome";
        } elseif (preg_match('/Safari/i', $u_agent)) {
            $bname = 'Apple Safari';
            $ub = "Safari";
        } elseif (preg_match('/Netscape/i', $u_agent)) {
            $bname = 'Netscape';
            $ub = "Netscape";
        }

        // finally get the correct version number
        $known = array('Version', $ub, 'other');
        $pattern = '#(?<browser>' . join('|', $known) .
                ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
        if (!preg_match_all($pattern, $u_agent, $matches)) {
            // we have no matching number just continue
        }

        // see how many we have
        $i = count($matches['browser']);
        if ($i != 1) {
            //we will have two since we are not using 'other' argument yet
            //see if version is before or after the name
            if (strripos($u_agent, "Version") < strripos($u_agent, $ub)) {
                $version = $matches['version'][0];
            } else {
                $version = $matches['version'][1];
            }
        } else {
            $version = $matches['version'][0];
        }

        // check if we have a number
        if ($version == null || $version == "") {
            $version = "?";
        }

        return array(
            'userAgent' => $u_agent,
            'name' => $bname,
            'version' => $version,
            'platform' => $platform,
            'pattern' => $pattern
        );
    }

    public static function formatString($string) {
        $str = html_entity_decode($string);
        return ($str);
    }

    public static function formatMoney($money) {
        return number_format($money);
    }    

    public static function formatDate($date) {
        return date("d-m-Y", strtotime($date));
    }
    
    public static function formatDateForm($date){
        return date("Y-m-d", strtotime($date));
    }


        public static function formatHtml($string) {
        return html_entity_decode($string);
    }

    public static function randomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }    
    public static function generateRating($rating)
    {
        $html_rating = "";        
        for($i = 1; $i<=5; $i++){
            $checked = "";
            if($i <= $rating)
            {
                $checked = "checked";
            }                               
            $html_rating .='<span class="fa fa-star '.$checked.'"></span>';
        }
        return $html_rating;
    }
    
    public static function formatProvince($provine_id)
    {
        $province = Province::findOrFail($provine_id);
        return $province->name;
    }
    
    public static function formatDistrict($district_id)
    {
        $district = District::findOrFail($district_id);
        return $district->name;
    }

    public static function checkStudentCourse($course_id)
    {
        $user = self::checkUser();
        if($user)
        {
            $user_id = $user->id;
            $check_exist = UserCourse::checkStudentCourse($user_id, $course_id);
            if(!$check_exist)
            {
                $html = '<a href="javascript:void(0)" data-course="'.$course_id.'" class="btn btn-link btn-link--addcard join-course">Tham gia khóa học</a>';
                return $html;
            }
            return false;
        }
    }

    public static function getCourseByStudent()
    {
        $user = self::checkUser();
        if($user){
            $user_id = $user->id;
            $courses = UserCourse::where('student_id',$user_id)->get();
            $arrCourse = array();
            if($courses){
                foreach ($courses as $course){
                    array_push($arrCourse, $course->course_id);
                }
                return $arrCourse;
            }
            return false;
        }       
        return false; 
    }
}

?>