<?php

namespace App\Modules\Auth;

use Sintattica\Atk\Core\Atk;
use Sintattica\Atk\Core\Tools;
use Sintattica\Atk\Core\Menu;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'auth';

    public function boot()
    {
        $this->registerNode('users', Users::class, ['admin', 'add', 'edit', 'delete']);
        $this->registerNode('groups', Groups::class, ['admin', 'add', 'edit', 'delete']);
        $this->registerNode('users_groups', UsersGroups::class);

        $this->addMenuItem('auth');
        $this->addNodeToMenu('users', 'users', 'admin', 'auth');
        $this->addNodeToMenu('groups', 'groups', 'admin', 'auth');
    }
}
