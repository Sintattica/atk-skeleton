<?php

namespace App\Modules\Auth;

use Sintattica\Atk\Core\Node;
use Sintattica\Atk\Relations\ManyToOneRelation;
use Sintattica\Atk\Attributes\Attribute;

class UsersGroups extends Node
{
    function __construct($nodeUri)
    {
        parent::__construct($nodeUri);

        $this->add(new ManyToOneRelation('user_id', 'auth.users', Attribute::AF_PRIMARY));
        $this->add(new ManyToOneRelation('group_id', 'auth.groups', Attribute::AF_PRIMARY));

        $this->setTable('Users_Groups');
    }
}
