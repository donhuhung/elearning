<?php

namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Auth;
use Redirect;
use Elearning\System\Models\Course;

class Teacher extends ComponentBase {

    public function componentDetails() {
        return [
            'name' => 'Teacher Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties() {
        return [];
    }

    public function onRun() {
        if (!Auth::check()) {
            return Redirect::intended('/');
        } else {
            $user = Auth::getUser();
            $userGroup = $user->groups[0]->id;            
            if ($userGroup != 3) {
                return Redirect::intended('/');
            }
            $this->page['courses'] = Course::getCourseByTeacher($user->id);            
        }
    }

}
