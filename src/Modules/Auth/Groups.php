<?php

namespace App\Modules\Auth;

use Sintattica\Atk\Attributes\Attribute;
use Sintattica\Atk\Attributes\ProfileAttribute;
use Sintattica\Atk\Attributes\TextAttribute;
use Sintattica\Atk\Core\Node;
use Sintattica\Atk\Relations\ShuttleRelation;

class Groups extends Node
{
    function __construct($nodeUri)
    {
        parent::__construct($nodeUri, Node::NF_NO_EXTENDED_SEARCH | Node::NF_ADD_LINK | Node::NF_EDITAFTERADD);
        $this->setTable('auth_gruppo');
        $this->setOrder('name');
        $this->setDescriptorTemplate('[name]');

        $this->add(new Attribute('id', Attribute::AF_PRIMARY | Attribute::AF_READONLY_EDIT));
        $this->add(new Attribute('name', Attribute::AF_OBLIGATORY | Attribute::AF_UNIQUE | Attribute::AF_SEARCHABLE));
        $this->add(new TextAttribute('description'));
        $this->add(new ShuttleRelation('users', Attribute::AF_HIDE_LIST | Attribute::AF_HIDE_ADD, 'auth.users_groups', 'auth.users', 'group_id', 'user_id'));
        $this->add(new ProfileAttribute('accessrights', Attribute::AF_BLANKLABEL | Attribute::AF_HIDE_ADD));
    }

    function getAssoc(): array
    {
        $ret = [];
        $rows = $this->select()->includes($this->descriptorFields())->getAllRows();
        foreach($rows as $row) {
            $ret[$row['id']] = $this->descriptor($row);
        }
        return $ret;
    }
}
