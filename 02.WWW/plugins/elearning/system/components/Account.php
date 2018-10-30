<?php

namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Province;
use Elearning\System\Models\District;
use Elearning\System\Models\UserCourse;
use Response;
use Elearning\System\Classes\Helper As HelperClass;
use System\Models\File;
use RainLab\User\Models\User as UserModel;

class Account extends ComponentBase {

    public function componentDetails() {
        return [
            'name' => 'Account Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties() {
        return [];
    }

    public function onRun() {
        $this->page['provinces'] = Province::all();
        $this->page['districts'] = District::all();        
    }

    public function onLoadDistrict() {
        $province_id = post('province');
        $districts = District::loadDistrictByProvince($province_id);
        return Response::json(array(
                    'status' => 1,
                    'districts' => $districts
        ));
    }

    public function onUpdateUser() {        
        $full_name = post('fullname');
        $address = post('address');
        $phone = post('phone_number');            
        $gender = post('gender');
        $date_of_birth = post('date_of_birth');
        $province = post('provin');
        $district = post('district');
        $description = post('info_body');        
        $user = HelperClass::checkUser();
        if ($user) {   
            $user_id = $user->id;         
            $this->updateAvatar();            
            $result = UserModel::updateInformation($user_id,$full_name, $address, $phone, $gender, $date_of_birth, $province, $district,$description);
            if($result)            
            {
                \Flash::success('verify code has been send');
            }
            else{
                \Flash::error('verify code has been send');
            }
        }        
    }

    private function updateAvatar() {
        $img = post('data-avatar');
        $user = HelperClass::checkUser();
        if ($img) {
            if ($user->avatar) {
                $path_image = $user->avatar->getLocalPath();
                if (file_exists($path_image)) {
                    $user->avatar->delete();
                }
            };
            $file = new File;
            $string_base64 = explode(",", $img);
            $fname = time() . ".jpg";
            $path = public_path() . "/storage/temp/file_upload/" . $fname;
            $this->base64_to_png("" . $string_base64[1], $path);
            $file->data = $path;
            $file->save();
            $user->avatar()->add($file);
            @unlink($path);
            return Response::json(array(
                        'status' => 1,
                        'message' => 'Success',
            ));
        }
        return Response::json(array(
                    'status' => 0,
                    'message' => 'Error'
        ));
    }

    private function base64_to_png($base64_string, $output_file) {
        $ifp = fopen($output_file, "wb");
        fwrite($ifp, base64_decode($base64_string));
        fclose($ifp);
        return( $output_file );
    }

    public function onJoinCourse()
    {
        try {
            $reseult = UserCourse::joinCourse();
            if ($reseult) {
                return Response::json(array(
                            'status' => 1,
                            'message' => 'Success'
                ));
            } else {
                return Response::json(array(
                            'status' => 0,
                            'message' => 'Error'
                ));
            }
        } catch (\Exception $e) {
            return Response::json(array(
                            'status' => 0,
                            'message' => $e->getMessage()
                ));
        }
    }

}
