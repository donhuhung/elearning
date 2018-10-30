<?php namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Course;

class UserCourse extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'UserCourse Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }

    public function onRun() {       
       $this->page['listCourses'] = Course::getCourseByStudent();
    }
}
