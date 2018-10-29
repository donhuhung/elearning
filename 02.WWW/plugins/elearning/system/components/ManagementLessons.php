<?php namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Lesson;
use Elearning\System\Classes\Helper As HelperClass;
use Response;
use Request;
use Redirect;

class ManagementLessons extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'ManagementLessons Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
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
        ];
    }

    public function onRun()
    {
		$user = HelperClass::checkUser();		
		if($user){
			$url_current = Request::fullUrl();
			$url_root = Request::root();
			$per_item = $this->property('per-item');
			$page = $this->property('pageNumber');
			$this->page['listLessons'] = Lesson::getListAllPaging($per_item, $page);
			if ($url_current != $url_root) {
				$this->pageParam = $this->page['pageParam'] = $this->paramName('pageNumber');
				if ($pageNumberParam = $this->paramName('pageNumber')) {
					$currentPage = $this->property('pageNumber');
					if ($currentPage > ($lastPage = $this->page['listLessons']->lastPage()) && $currentPage > 1)
						return Redirect::to($this->currentPageUrl([$pageNumberParam => $lastPage]));
				}
			}
		}       
		else{
			return Redirect::to(url('/'));
		}	
    }

    public function onCreateLesson() {
        try {
            $storeId = Lesson::store();
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
            $result = Lesson::onDelete();
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
