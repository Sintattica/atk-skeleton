<?php

namespace App\Modules\Auth;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'auth';

    public function register()
    {
        $this->registerNode('users', Users::class, ['admin', 'add', 'edit', 'delete']);
        $this->registerNode('groups', Groups::class, ['admin', 'add', 'edit', 'delete']);
        $this->registerNode('users_groups', UsersGroups::class);
    }

    public function boot()
    {
        $this->addMenuItem('auth');
        $this->addNodeToMenu('users', 'users', 'admin', 'auth');
        $this->addNodeToMenu('groups', 'groups', 'admin', 'auth');
    }
}
