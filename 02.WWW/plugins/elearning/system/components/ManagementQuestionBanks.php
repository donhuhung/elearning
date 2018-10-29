<?php namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Question;
use Elearning\System\Classes\Helper As HelperClass;
use Request;
use Redirect;
use Response;

class ManagementQuestionBanks extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'ManagementQuestionBanks Component',
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
            'questionId' => [
                'title' => 'Question Id',
                'description' => 'Question Id',
                'type' => 'int',
                'default' => '',
            ]
        ];
    }

    public function onRun(){
        $this->page['block_answer'] = 1;
        $question_id = $this->property('questionId');
        $url_current = Request::fullUrl();
        $url_root = Request::root();
        $per_item = $this->property('per-item');
        $page = $this->property('pageNumber');
        $user = HelperClass::checkUser();       
        $this->page['listQuestions'] = Question::getListAllPaging($per_item, $page);
        if ($url_current != $url_root) {
            $this->pageParam = $this->page['pageParam'] = $this->paramName('pageNumber');
            if ($pageNumberParam = $this->paramName('pageNumber')) {
                $currentPage = $this->property('pageNumber');
                if ($currentPage > ($lastPage = $this->page['listQuestions']->lastPage()) && $currentPage > 1)
                    return Redirect::to($this->currentPageUrl([$pageNumberParam => $lastPage]));
            }
        }
        if ($question_id > 0) {
            $this->page['question'] = Question::find($question_id);
        }
        $this->page['question_id'] = $question_id;
    }

    public function onAddBlockAnswer()
    {
        $block_answer = post('block_answer');
        $this->page['block_answer'] = $block_answer;        
    }

    public function onCreateQuestion()
    {
        try {
            $questionId = Question::store();
            if ($questionId) {
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

    public function onUpdateQuestion()
    {

    }
}
