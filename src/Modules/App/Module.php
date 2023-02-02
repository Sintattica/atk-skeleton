<?php

namespace App\Modules\App;

use Exception;
use Sintattica\Atk\Ui\SmartyProvider;

class Module extends \Sintattica\Atk\Core\Module
{
    static $module = 'app';

    /**
     * @throws Exception
     */
    public function register()
    {
        $smarty = SmartyProvider::getInstance();
        $smarty->addTemplateDir(__DIR__ . '/templates');

        $this->registerNode('demo_node', DemoNode::class, ['admin', 'add', 'edit', 'delete', 'export', 'tab_profilo']);
        $this->registerNode('demo_relation', DemoRelation::class, ['admin', 'add', 'edit', 'delete', 'export']);
    }

}
