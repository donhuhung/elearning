<?php

namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Subject;
use Request;
use Redirect;
use Response;

class ManagementSubjects extends ComponentBase {

    public function componentDetails() {
        return [
            'name' => 'ManagementSubjects Component',
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
            'subjectId' => [
                'title' => 'Subject Id',
                'description' => 'Subject Id',
                'type' => 'int',
                'default' => '',
            ]
        ];
    }

    public function onRun() {
        $subject_id = $this->property('subjectId');
        $url_current = Request::fullUrl();
        $url_root = Request::root();
        $per_item = $this->property('per-item');
        $page = $this->property('pageNumber');
        $this->page['listSubjects'] = Subject::getListAllPaging($per_item, $page);
        if ($url_current != $url_root) {
            $this->pageParam = $this->page['pageParam'] = $this->paramName('pageNumber');
            if ($pageNumberParam = $this->paramName('pageNumber')) {
                $currentPage = $this->property('pageNumber');
                if ($currentPage > ($lastPage = $this->page['listSubjects']->lastPage()) && $currentPage > 1)
                    return Redirect::to($this->currentPageUrl([$pageNumberParam => $lastPage]));
            }
        }
        if ($subject_id > 0) {
            $this->page['subject'] = Subject::find($subject_id);
        }
        $this->page['subject_id'] = $subject_id;
    }

    public function onCreateSubject() {
        try {
            $storeId = Subject::store();
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

    public function onUpdateSubject() {
        try {
            $subject_id = $this->property('subjectId');
            $storeId = Subject::edit($subject_id);
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
            $result = Subject::onDelete();
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
