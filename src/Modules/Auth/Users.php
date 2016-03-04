<?php

namespace App\Modules\Auth;

use Sintattica\Atk\Core\Node;

use Sintattica\Atk\Attributes\Attribute;
use Sintattica\Atk\Attributes\Attribute as A;
use Sintattica\Atk\Attributes\BoolAttribute;
use Sintattica\Atk\Attributes\EmailAttribute;
use Sintattica\Atk\Relations\ShuttleRelation;
use Sintattica\Atk\Attributes\PasswordAttribute;

class Users extends Node
{
    function __construct($nodeUri)
    {
        parent::__construct($nodeUri, Node::NF_ADD_LINK);

        $this->setTable('Users');

        $this->add(new Attribute('id', A::AF_AUTOKEY));

        $this->add(new Attribute('firstname', A::AF_FORCE_LOAD | A::AF_OBLIGATORY | A::AF_SEARCHABLE));
        $this->add(new Attribute('lastname', A::AF_FORCE_LOAD | A::AF_OBLIGATORY | A::AF_SEARCHABLE));
        $this->add(new Attribute('username', A::AF_FORCE_LOAD | A::AF_OBLIGATORY | A::AF_SEARCHABLE | A::AF_UNIQUE));

        $pwdFlags = A::AF_OBLIGATORY | A::AF_HIDE_LIST | PasswordAttribute::AF_PASSWORD_NO_ENCODE | PasswordAttribute::AF_PASSWORD_NO_VALIDATE;
        $this->add(new PasswordAttribute('passwd', true, $pwdFlags , 0, ['minalphabeticchars' => 6, 'minnumbers' => 2]));
        $this->add(new EmailAttribute('email'));
        $this->add(new BoolAttribute('disabled', A::AF_SEARCHABLE | A::AF_FORCE_LOAD));

        $attr = new ShuttleRelation('groups', 'auth.users_groups', 'auth.groups', A::AF_SEARCHABLE);
        $this->add($attr);
        $attr->setLocalKey('user_id');
        $attr->setRemoteKey('group_id');

        $this->setOrder('[table].lastname, [table].firstname');

        $this->setDescriptorTemplate('[username]');
    }

    function rowColor($record)
    {
        if ($record['disabled']) {
            return '#CCCCCC';
        }
    }
}
