<?php

namespace App\Modules\Auth;

use Sintattica\Atk\Core\Atk;
use Sintattica\Atk\Core\Tools;
use Sintattica\Atk\Core\Menu;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'auth';

    function __construct()
    {
        $m = static::$module;

        $atk = Atk::getInstance();
        $atk->registerNode($m . '.users', Users::class, ['admin', 'add', 'edit', 'delete']);
        $atk->registerNode($m . '.groups', Groups::class, ['admin', 'add', 'edit', 'delete']);
        $atk->registerNode($m . '.users_groups', UsersGroups::class);

        $menu = Menu::getInstance();
        $menu->addMenuItem('auth', '', 'main', 1, 0, $m);
        $menu->addMenuItem('users', Tools::dispatch_url($m . '.users', 'admin'), 'auth', [$m . '.users', 'admin'], 0, $m);
        $menu->addMenuItem('groups', Tools::dispatch_url($m . '.groups', 'admin'), 'auth', [$m . '.groups', 'admin'], 0, $m);
    }
}
