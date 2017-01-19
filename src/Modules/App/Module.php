<?php

namespace App\Modules\App;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'app';

    public function register()
    {
        $this->registerNode('test_node', TestNode::class, ['admin', 'add', 'edit', 'delete']);
    }

    public function boot()
    {
        $this->addNodeToMenu('test_node', 'test_node', 'admin');
    }
}
