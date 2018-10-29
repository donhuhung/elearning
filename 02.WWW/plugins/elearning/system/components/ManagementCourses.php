<?php

namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Subject;
use Elearning\System\Models\Level;
use Elearning\System\Models\Course;
use Response;
use Request;
use Redirect;

class ManagementCourses extends ComponentBase {

    public function componentDetails() {
        return [
            'name' => 'ManagementCourses Component',
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
                'default' => 8,
            ],            
            'courseId' => [
                'title' => 'Course Id',
                'description' => 'Course Id',
                'type' => 'int',
                'default' => '',
            ]
        ];
    }

    public function onRun()
    {
        $course_id = $this->property('courseId');
        $this->page['levels'] = Level::all();
        $this->page['courses'] = Subject::getList();
        $url_current = Request::fullUrl();
        $url_root = Request::root();
        $per_item = $this->property('per-item');
        $page = $this->property('pageNumber');
        $this->page['listCourses'] = Course::getListAllPaging($per_item, $page);
        if ($url_current != $url_root) {
            $this->pageParam = $this->page['pageParam'] = $this->paramName('pageNumber');
            if ($pageNumberParam = $this->paramName('pageNumber')) {
                $currentPage = $this->property('pageNumber');
                if ($currentPage > ($lastPage = $this->page['listCourses']->lastPage()) && $currentPage > 1)
                    return Redirect::to($this->currentPageUrl([$pageNumberParam => $lastPage]));
            }
        }
        if($course_id > 0)
        {
            $this->page['detail'] = Course::find($course_id);
        }
        $this->page['course_id'] = $course_id;

    }

    public function onCreateCourse() {
        try {
            $storeId = Course::store();
            if ($storeId) {
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
    
    public function onUpdateCourse() {
        try {
            $course_id = $this->property('courseId');
            $storeId = Course::edit($course_id);
            if ($storeId) {
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
    
    public function onDelete() {
        try {            
            $result = Course::onDelete();
            if ($result) {
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
