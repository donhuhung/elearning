<?php

namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Course As CourseModel;
use Illuminate\Support\Facades\Redirect;
use Elearning\System\Models\Level;

class Courses extends ComponentBase {

    public $courses;
    public function componentDetails() {
        return [
            'name' => 'Courses Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties() {
        return [
            'pageNumber' => [
                'title' => 'Page number',
                'description' => 'Page number',
                'type' => 'int',
                'default' => '{{ :page }}',
            ],
            'per-item' => [
                'title' => 'Per Items',
                'description' => 'For Topic load per page',
                'default' => 5,
            ],
            'slug' => [
                'title' => 'Slug',
                'description' => 'Slug',
                'default' => ""
            ]
        ];
    }

    public function onRun() {
        $slug = $this->property('slug');
        if ($slug) {
            $detail = CourseModel::getDetail($slug);
            $this->detail = $this->page['detail'] = CourseModel::getDetail($slug);
            $subject_id = $detail->subject_id;
            $teacher_id = $detail->user_id;
            $this->page['otherPosts'] = CourseModel::getOtherCourse($subject_id);
            $this->page['coursesTeacher'] = CourseModel::getCourseByTeacher($teacher_id);
        } else {
            $per_item = $this->property('per-item');            
            $page = $this->property('pageNumber');  
            $courses = CourseModel::getCoursePagination($per_item, $page);
            $this->page['coursesNew'] = CourseModel::getListHomepage();            
            $this->courses = $this->page['courses'] = $courses;
            $this->pageParam = $this->page['pageParam'] = $this->paramName('pageNumber');                  
            if ($pageNumberParam = $this->paramName('pageNumber')) {
                $currentPage = $this->property('pageNumber');
                if ($currentPage > ($lastPage = $this->page['courses']->lastPage()) && $currentPage > 1)
                    return Redirect::to($this->currentPageUrl([$pageNumberParam => $lastPage]));
            }
        }
    }

}
