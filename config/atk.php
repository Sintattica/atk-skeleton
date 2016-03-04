<?php

$_baseDir = __DIR__ . '/../';

return [
    /**
     * change identifier to unique string
     */
    'identifier' => 'atk-project',

    'language_basedir' => $_baseDir . 'src/languages/',

    'modules' => [
        App\Modules\Auth\Module::class,
        App\Modules\App\Module::class,
    ],

    'language' => 'it',

    'authentication' => 'db',
    'authentication_md5' => false,
    'auth_usecryptedpassword' => false,
    'restrictive' => true,
    'authentication_cookie' => false,

    /** Security database configuration **/
    'securityscheme' => 'group',
    'auth_userpk' => 'id',
    'auth_userfk' => 'user_id',
    'auth_usertable' => 'Users',
    'auth_userfield' => 'username',
    'auth_passwordfield' => 'passwd',
    'auth_emailfield' => 'email',
    'auth_accountdisablefield' => 'disabled',
    'auth_leveltable' => 'Users_Groups',
    'auth_levelfield' => 'group_id',
    'auth_accesstable' => 'AccessRights',
];
