<?php

namespace App\Modules\Auth;

use Sintattica\Atk\AdminLte\UIStateColors;
use Sintattica\Atk\Attributes\Attribute as A;
use Sintattica\Atk\Attributes\DummyAttribute;
use Sintattica\Atk\Attributes\ListAttribute;
use Sintattica\Atk\Attributes\MultiListAttribute;
use Sintattica\Atk\Core\Atk;
use Sintattica\Atk\Core\Config;
use Sintattica\Atk\Core\Node;
use Sintattica\Atk\Core\Tools;
use Sintattica\Atk\Handlers\ExportHandler;

/**
 * App Permissions. The class shows a view of the permissions
 */
class AccessRights extends Node
{
    function __construct($nodeUri)
    {
        parent::__construct($nodeUri, self::NF_READONLY | self::NF_EXPORT);

        $this->setTable('permessi_group');

        $this->setOrder('[table].modulo, [table].nodo, [table].action');

        $modules = [];
        foreach (Config::getGlobal('modules') as $m) {
            $module = $m::$module;
            if ($module != 'sys') {
                $modules[$module] = Tools::atktext(["title_$module", $module], $module);
            }
        }

        $this->add(new ListAttribute('modulo', A::AF_SEARCHABLE, array_values($modules), array_keys($modules)));

        $nodes = self::getNodesMap();
        $this->add(new ListAttribute('nodo', A::AF_SEARCHABLE, array_values($nodes), array_keys($nodes)))->setMultipleSearch(true);

        // action
        $actions = $this->getDb()->getValues("SELECT DISTINCT action FROM auth_access_rights");
        $this->add(new ListAttribute('action', A::AF_SEARCHABLE, array_values($actions)));

        $profili = Atk::getInstance()->atkGetNode('auth.groups')->getAssoc();
        $attr = new MultiListAttribute('profili', A::AF_SEARCHABLE, array_values($profili), array_keys($profili));
        $attr->setDisplaySeparator(MultiListAttribute::TAG_SEPARATOR);
        $attr->setTagState(UIStateColors::COLOR_SUCCESS);
        $attr->setExportSeparator(', ');
        $this->add($attr);

        $this->add(new DummyAttribute('utenti', A::AF_READONLY));
    }

    function profili_display($record, $mode): ?string
    {
        $ret = $this->getAttribute('profili')->display($record, $mode);

        if ($mode != 'csv') {
            $ret = '<div class="height-fixed large">' . $ret . '</div>';
        }

        return $ret;
    }

    function utenti_display($record, $mode): string
    {
        /** @var Users $utentiNode */
        $utentiNode = Atk::getInstance()->atkGetNode('auth.users');
        $utenti = $utentiNode->getAssoc($record['profili']);

        if ($mode == 'csv') {
            $ret = implode(', ', $utenti);
        } else {
            $ret = '<div style="max-width: 400px; white-space: normal;"><span class="badge-sm badge-pill badge-secondary mr-1 text-nowrap">' . implode('</span><span class="badge-sm badge-pill badge-secondary mr-1 text-nowrap">', $utenti) . '</span></div>';
        }

        return $ret;
    }

    function action_export(ExportHandler $handler): bool
    {
        $this->addAttributesFlag(['modulo'], A::AF_HIDE_LIST);

        $this->getAttribute('profili')->addFlag(A::AF_FORCE_LOAD);

        return $handler->action_export();
    }


    /**
     * Get all atk nodes in an associative array (nodename => translation)
     * @return array
     */
    private static function getNodesMap(): array
    {
        $ret = [];
        $nodes = Atk::getInstance()->g_nodes;
        foreach ($nodes as $module => $m) {
            foreach (array_keys($m[$module]) as $node) {
                $ret[$node] = Tools::atktext($node, $module);
            }
        }

        return $ret;
    }
}
