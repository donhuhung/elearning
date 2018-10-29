<?php namespace Demo\Youtube;

use Backend;
use System\Classes\PluginBase;

/**
 * Youtube Plugin Information File
 */
class Plugin extends PluginBase
{
    /**
     * Returns information about this plugin.
     *
     * @return array
     */
    public function pluginDetails()
    {
        return [
            'name'        => 'Youtube',
            'description' => 'No description provided yet...',
            'author'      => 'Demo',
            'icon'        => 'icon-leaf'
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Boot method, called right before the request route.
     *
     * @return array
     */
    public function boot()
    {

    }

    /**
     * Registers any front-end components implemented in this plugin.
     *
     * @return array
     */
    public function registerComponents()
    {
        /*return [
            'Demo\Youtube\Components\Homepage' => 'homepage',
        ];*/
    }

    /**
     * Registers any back-end permissions used by this plugin.
     *
     * @return array
     */
    public function registerPermissions()
    {
        return []; // Remove this line to activate

        return [
            'demo.youtube.some_permission' => [
                'tab' => 'Youtube',
                'label' => 'Some permission'
            ],
        ];
    }

    /**
     * Registers back-end navigation items for this plugin.
     *
     * @return array
     */
    public function registerNavigation()
    {
        return []; // Remove this line to activate

        return [
            'youtube' => [
                'label'       => 'Youtube',
                'url'         => Backend::url('demo/youtube/mycontroller'),
                'icon'        => 'icon-leaf',
                'permissions' => ['demo.youtube.*'],
                'order'       => 500,
            ],
        ];
    }
}
