<?php

namespace App\Modules\Auth;

use Sintattica\Atk\Core\Node;
use Sintattica\Atk\Attributes\Attribute;
use Sintattica\Atk\Attributes\Attribute as A;
use Sintattica\Atk\Attributes\TextAttribute;
use Sintattica\Atk\Relations\ShuttleRelation;
use Sintattica\Atk\Attributes\ProfileAttribute;

class Groups extends Node
{
    function __construct($nodeUri)
    {
        parent::__construct($nodeUri, Node::NF_ADD_LINK | Node::NF_EDITAFTERADD);

        $this->add(new Attribute('id', A::AF_AUTOKEY));
        $this->add(new Attribute('name', A::AF_OBLIGATORY | A::AF_UNIQUE | A::AF_SEARCHABLE));
        $this->add(new TextAttribute('description'));

        $attr = new ShuttleRelation('users', A::AF_HIDE_LIST | A::AF_HIDE_ADD, 'auth.users_groups', 'auth.users');
        $this->add($attr);
        $attr->setLocalKey('group_id');
        $attr->setRemoteKey('user_id');

        $this->add(new ProfileAttribute('accessrights', A::AF_BLANKLABEL | A::AF_HIDE_ADD));

        $this->setTable('Groups');
        $this->setOrder('name');
        $this->setDescriptorTemplate('[name]');
    }
}
