<?php

namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\StoreQuizz;
use Elearning\System\Models\UserCourse;
use Elearning\System\Models\Question;
use Elearning\System\Models\Answer;
use Elearning\System\Models\ResultQuizz;
use Elearning\System\Classes\Helper As HelperClass;
use Response;

class Quizz extends ComponentBase {

    public function componentDetails() {
        return [
            'name' => 'Quizz Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties() {
        return [
            'courseId' => [
                'title' => 'Course Id',
                'description' => 'Course Id',
                'type' => 'int',
                'default' => '',
            ]
        ];
    }

    public function onRun() {
        $user = HelperClass::checkUser();
        if ($user) {
            $user_id = $user->id;
            $course_id = $this->property('courseId');
            $data_quizz = UserCourse::checkStudentCourse($user_id, $course_id);
            if ($data_quizz) {
                $quizz = StoreQuizz::getQuizz($course_id);
                if ($quizz) {
                    $quizz_content = $quizz->quizz_content;
                    if ($quizz_content) {
                        $arrQuestion = array();
                        foreach ($quizz_content as $content) {
                            array_push($arrQuestion, $content->question_id);
                        }
                        $this->page['questions'] = Question::getListQuestion($arrQuestion);
                        $this->page['time_quizz'] = $quizz->time_quizz;
                        $this->page['quizz_id'] = $quizz->id;
                    }
                }
            }
        }
    }

    public function onSubmitQuizz() {
        try {
            $total_correct = Answer::checkCorrectAnswer();
            $log = ResultQuizz::insertResult($total_correct);
            if ($log) {
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
