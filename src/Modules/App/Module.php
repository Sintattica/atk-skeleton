<?php

namespace App\Modules\App;

use Sintattica\Atk\Core\Atk;
use Sintattica\Atk\Core\Menu;
use Sintattica\Atk\Core\Tools;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'app';

    public function boot()
    {
        $this->registerNode('test_node', TestNode::class, ['admin', 'add', 'edit', 'delete']);
        $this->addNodeToMenu('test_node', 'test_node', 'admin');
    }
}
