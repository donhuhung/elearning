<?php namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\StoreQuizz As StoreQuizzModel;
use Elearning\System\Models\StoreQuizz As StoreQuizzModel;
use Request;
use Redirect;
use Response;

class StoreQuizz extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'StoreQuizz Component',
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
            'storeId' => [
                'title' => 'Store Id',
                'description' => 'Store Id',
                'type' => 'int',
                'default' => '',
            ]
        ];
    }
    
    public function onRun(){        
        $store_id = $this->property('storeId');
        $url_current = Request::fullUrl();
        $url_root = Request::root();
        $per_item = $this->property('per-item');
        $page = $this->property('pageNumber');     
        $this->page['listQuizzs'] = StoreQuizzModel::getListAllPaging($per_item, $page);
        if ($url_current != $url_root) {
            $this->pageParam = $this->page['pageParam'] = $this->paramName('pageNumber');
            if ($pageNumberParam = $this->paramName('pageNumber')) {
                $currentPage = $this->property('pageNumber');
                if ($currentPage > ($lastPage = $this->page['listQuizzs']->lastPage()) && $currentPage > 1)
                    return Redirect::to($this->currentPageUrl([$pageNumberParam => $lastPage]));
            }
        }
        if ($store_id > 0) {
            $this->page['quizz'] = StoreQuizzModel::find($store_id);
        }                
        $this->page['store_id'] = $store_id;
        $this->page['subjects'] = 
    }
}
