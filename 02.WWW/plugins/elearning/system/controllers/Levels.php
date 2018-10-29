<?php namespace Elearning\System\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Levels Back-end Controller
 */
class Levels extends Controller
{

    public $implement = [
        'Backend.Behaviors.FormController',
        'Backend.Behaviors.ListController',
     ];

    public $formConfig = 'config_form.yaml';
    public $listConfig = 'config_list.yaml';
   

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Elearning.System', 'elearning', 'levels');
    }



    public function onDelete()
    {
        $checkedIds = post('checked');
        if ((is_array($checkedIds)) && (count($checkedIds) > 0)) {
            $deleted = Level::whereIn('id', $checkedIds)->delete();
            if (!$deleted) {
                return \Flash::error('sorry books have\'nt  been deleted ?');
            }
        }


        \Flash::success(\Lang::get('backend::lang.list.delete_selected_success', [
            'name' => 'deleted '
        ]));


        return $this->listRefresh();
    }
}
