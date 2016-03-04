<?php

namespace App\Modules\App;

use Sintattica\Atk\Core\Atk;
use Sintattica\Atk\Core\Menu;
use Sintattica\Atk\Core\Tools;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'app';

    function __construct()
    {
        $m = static::$module;

        $atk = Atk::getInstance();
        $atk->registerNode($m . '.test_node', TestNode::class, ['admin', 'add', 'edit', 'delete']);

        $menu = Menu::getInstance();
        $menu->addMenuItem("test_node", Tools::dispatch_url($m . '.test_node', 'admin'), 'main', [$m . '.test_node', 'admin'], 0, $m);
    }
}
