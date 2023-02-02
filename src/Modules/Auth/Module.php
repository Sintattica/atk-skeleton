<?php

namespace App\Modules\Auth;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'auth';

    public function register()
    {
        $this->registerNode('users', Users::class, ['admin', 'add', 'edit', 'delete']);
        $this->registerNode('groups', Groups::class, ['admin', 'add', 'edit', 'delete']);
        $this->registerNode('access_rights', AccessRights::class);
        $this->registerNode('users_groups', Users_Groups::class);
    }
}
