<?php namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Level;
use Elearning\System\Models\Subject;
use Elearning\System\Models\Lesson;
use Elearning\System\Models\Course;
use DB;


class LessonsList extends ComponentBase
{



    public function componentDetails()
    {
        return [
            'name'        => 'lessonsList Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }





   private $lessonQ;
   private $courseQ;
   private $levels; 



   private function applyFilters()
    {
            $subjectEntityTerm = \Request::get('subject');
            $levelEntityTerm   = \Request::get('level');   
            $levelEntity   = level::where('name', 'like', $levelEntityTerm )->first();
            $subjectEntity = subject::where('name', 'like', $subjectEntityTerm)->first();
            
            $q = $this->courseQ;
            // get the course depends on subject & level
            if ($levelEntity and $subjectEntity)
            {
                $q->where("level_id", $levelEntity->id)
                               ->where("subject_id", $subjectEntity->id);
            }
            
            return $q;
      

    }
 
  public function init()
  {
     $this->courseQ = Course::with(array());  // this wont retun a query object :) , this will return a collection of all courses tamam :)???  
  }
 
  public function course()
  {
       
      $result;

      if (\Request::has('level') && \Request::has('subject')) 
      {
         $q = $this->applyFilters();
         $result = $q->first();
         
      }
      else{
         $result = $this->courseQ->find(1);
      }

      return $result;
  }
  
  public function levels()
  {    

     $levels = Level::orderBy("name")->get();
     return $levels;
  }

  
  
}
