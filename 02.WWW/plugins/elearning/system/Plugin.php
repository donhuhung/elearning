<?php

namespace Elearning\System;

use Backend;
use System\Classes\PluginBase;
use Event;
use RainLab\User\Models\User as UserModel;
use RainLab\User\Models\UserGroup as UserGroup;
use RainLab\User\Controllers\Users as UserController;
use Elearning\System\Models\Province;
use Elearning\System\Models\District;
use Redirect;

/**
 * elearning Plugin Information File
 */
class Plugin extends PluginBase {

    /**
     * Returns information about this plugin.
     *
     * @return array
     */
    public function pluginDetails() {
        return [
            'name' => 'elearning',
            'description' => 'No description provided yet...',
            'author' => 'hung.do',
            'icon' => 'icon-leaf'
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     *
     * @return void
     */
    public function register() {
        
    }

    /**
     * Boot method, called right before the request route.
     *
     * @return array
     */
    public function boot() {
        UserModel::extend(function ($model) {
            $model->addDynamicMethod('getGenderOptions', function () {
                return ['0' => 'Female', '1' => 'Male'];
            });
            $model->addDynamicMethod('getProvinceIdOptions', function () {
                $provinces = Province::lists('name', 'id');
                return $provinces;
            });
            $model->addDynamicMethod('getDistrictIdOptions', function () {
                $districts = District::lists('name', 'id');
                return $districts;
            });
            $model->addDynamicMethod('addUserGroup', function($group) use ($model) {
            if ($group instanceof Collection) {
                return $model->groups()->saveMany($group);
            }

            if (is_string($group)) {
                $group = UserGroup::whereCode($group)->first();

                return $model->groups()->save($group);
            }

            if ($group instanceof UserGroup) {
                return $model->groups()->save($group);
            }
        });
        });
        Event::listen('backend.list.extendColumns', function($widget) {
            // Only for the User controller
            if (!$widget->getController() instanceof \RainLab\User\Controllers\Users) {
                return;
            }

            // Only for the User model
            if (!$widget->model instanceof \RainLab\User\Models\User) {
                return;
            }

            // Add an extra birthday column
            $widget->addColumns([
                'birthday' => [
                    'label' => 'Birthday',
                    'sortable' => false,
                    'type' => 'text'
                ]
            ]);
            $widget->addColumns([
                'gender' => [
                    'label' => 'Gender',
                    'sortable' => false,
                    'type' => 'text'
                ]
            ]);
            $widget->addColumns([
                'phone' => [
                    'label' => 'Phone',
                    'sortable' => false,
                    'type' => 'text'
                ]
            ]);
            $widget->addColumns([
                'address' => [
                    'label' => 'Address',
                    'sortable' => false,
                    'type' => 'text'
                ]
            ]);
            $widget->addColumns([
                'description' => [
                    'label' => 'Description',
                    'sortable' => false,
                    'type' => 'text'
                ]
            ]);
        });
        
        // Remove a Surname column
        // $widget->removeColumn('surname');
         
        // assign desired group to newly activated user
        Event::listen('rainlab.user.activate', function($user) {
            $user->addUserGroup(UserGroup::whereCode('student')->first());
        });
                
        //Extend Form Fields
        UserController::extendFormFields(function($form, $model, $context) {
            if (!$model instanceof UserModel)
                return;

            //Remove Another Fields
            $form->removeField('password');
            $form->removeField('password_confirmation');

            if (!$model->exists)
                return;
            //Add tab fields
            $form->addTabFields([
                'birthday' => [
                    'label' => 'Birth Day',
                    'type' => 'datepicker',
                    'tab' => 'Personal',
                    'span' => 'auto',
                    'mode' => 'date'
                ],
                'phone' => [
                    'label' => 'Phone',
                    'type' => 'text',
                    'tab' => 'Personal',
                    'span' => 'auto'
                ],
                'gender' => [
                    'label' => 'Gender',
                    'type' => 'dropdown',
                    'tab' => 'Personal',
                    'span' => 'auto'
                ],
                'address' => [
                    'label' => 'Address',
                    'type' => 'text',
                    'tab' => 'Personal',
                    'span' => 'auto'
                ],
                'province_id' => [
                    'label' => 'Province',
                    'type' => 'dropdown',
                    'tab' => 'Personal',
                    'span' => 'auto'
                ],
                'district_id' => [
                    'label' => 'District',
                    'type' => 'dropdown',
                    'tab' => 'Personal',
                    'span' => 'auto'
                ],
                'description' => [
                    'label' => 'Description',
                    'type' => 'textarea',
                    'tab' => 'Personal',
                    'size' => 'small',
                    'span' => 'full'
                ]
            ]);
        });
        
        Event::listen('rainlab.user.login', function($user) {            
            if ($user){        
                if(isset($user->groups[0])){
                    $userGroup = $user->groups[0]->id;
                    if($userGroup == 3)
                    {                                    
                        return Redirect::intended('dashboard-teacher');                        
                    }                        
                }                                
            }
        });
    }

    /**
     * Registers any front-end components implemented in this plugin.
     *
     * @return array
     */
    public function registerComponents() {

        return [
            'Elearning\System\Components\Homepage' => 'homepage',
            'Elearning\System\Components\LessonsList' => 'lessonsList',
            'Elearning\System\Components\Account' => 'account_elearning',
            'Elearning\System\Components\Courses' => 'courses',
            'Elearning\System\Components\Teacher' => 'teacher',
            'Elearning\System\Components\ManagementSubjects' => 'management_subject',
            'Elearning\System\Components\ManagementCourses' => 'management_course',
            'Elearning\System\Components\ManagementLessons' => 'management_lesson',
            'Elearning\System\Components\ManagementQuestionBanks' => 'management_question_bank',
            'Elearning\System\Components\SideBarTeacher' => 'sidebar_teacher',
            'Elearning\System\Components\User' => 'user',
            'Demo\Youtube\Components\Homepage' => 'youtube',
            'Demo\Youtube\Components\Live' => 'livestream',
            'Elearning\System\Components\Forum' =>'forum',
            'Elearning\System\Components\StoreQuizz' =>'management_store_quizz',            
            'Elearning\System\Components\Quizz' =>'quizz',
            'Elearning\System\Components\UserCourse' =>'user_course',
            'Elearning\System\Components\SidebarUser' =>'sidebar_user'           

        ];
    }

    /**
     * Registers any back-end permissions used by this plugin.
     *
     * @return array
     */
    public function registerPermissions() {

        return [
            'elearning.system.some_permission' => [
                'tab' => 'elearning',
                'label' => 'Some permission'
            ],
        ];
    }

    /**
     * Registers back-end navigation items for this plugin.
     *
     * @return array
     */
    public function registerNavigation() {

        return [
            'elearning' => [
                'label' => 'Goodworks Online Academy',
                'url' => Backend::url('elearning/system/courses'),
                'icon' => 'icon-university',
                'permissions' => ['elearning.system.*'],
                'order' => 500,
                'sideMenu' => [
                    'courses' => [
                        'label' => 'Courses',
                        'icon' => 'icon-cubes',
                        'url' => Backend::url('elearning/system/courses'),
                        'permissions' => ['elearning.system.*']
                    ],
                    'levels' => [
                        'label' => 'Levels',
                        'icon' => 'icon-database',
                        'url' => Backend::url('elearning/system/levels'),
                        'permissions' => ['elearning.system.*']
                    ],
                    'subjects' => [
                        'label' => 'Subjects',
                        'icon' => 'icon-sitemap',
                        'url' => Backend::url('elearning/system/subjects'),
                        'permissions' => ['elearning.system.*']
                    ],
                    'lessons' => [
                        'label' => 'Lessons',
                        'icon' => 'icon-copy',
                        'url' => Backend::url('elearning/system/lessons'),
                        'permissions' => ['elearning.system.*']
                    ],
                ]
            ],
        ];
    }

    /**
     * Registers function markup tag implemented in this plugin.
     *
     * @return array
     */
    public function registerMarkupTags() {
        return [
            'filters' => [
                'formatMoney' => ['Elearning\System\Classes\Helper', 'formatMoney'],
                'formatHtml' => ['Elearning\System\Classes\Helper', 'formatHtml'],
                'generateRating' => ['Elearning\System\Classes\Helper', 'generateRating'],
                'formatDate' => ['Elearning\System\Classes\Helper', 'formatDate'],
                'formatProvince' => ['Elearning\System\Classes\Helper', 'formatProvince'],
                'formatDistrict' => ['Elearning\System\Classes\Helper', 'formatDistrict'],
                'formatDateForm' => ['Elearning\System\Classes\Helper', 'formatDateForm'],
                'checkStudentCourse' => ['Elearning\System\Classes\Helper', 'checkStudentCourse']                
            ]
        ];
    }

}
