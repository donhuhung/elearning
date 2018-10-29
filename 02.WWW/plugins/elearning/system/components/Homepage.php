<?php namespace Elearning\System\Components;

use Cms\Classes\ComponentBase;
use Elearning\System\Models\Subject;
use Elearning\System\Models\Course;
use RainLab\Blog\Models\Post;

class Homepage extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Homepage Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }
    public function onRun()
    {
        $this->page['subjects'] = Subject::getList();
        $this->page['courses'] = Course::getListHomepage();
        $this->page['posts'] = Post::getPostHomepage();
    }
    
    public function onChangeTypePos()
    {
        $type = post('type');
        $this->page['posts'] = Post::getPostHomepage($type);
    }
}
