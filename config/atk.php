<?php

/**
 * ATK config file
 *
 * Put here ATK related config variables only, common to all environments.
 * ATK default config is vendor/sintattica/atk/src/Resources/config/atk.php
 *
 * If you need custom config variables, use app.php and use Config::get('app', 'some-variable')
 */

$env = getenv('APP_ENV');
if (!$env || !in_array($env, ['dev', 'staging', 'prod'])) {
    die('atk.php: APP_ENV must be set!');
}

$_baseDir = __DIR__.'/../';
$_parameters = require __DIR__.'/parameters.'.$env.'.php';

return [
    /**
     * change identifier to unique string
     */
    'identifier' => $_parameters['atk']['identifier'],

    'language' => 'it',

    'modules' => [
        App\Modules\Auth\Module::class,
        App\Modules\App\Module::class,
    ],

    'language_basedir' => $_baseDir.'languages/',
    'debug' => $_parameters['atk']['debug'],
    'meta_caching' => $_parameters['atk']['meta_caching'],
    'db' => $_parameters['atk']['db'],
    'login_logo' => '/images/login_logo.png',
    'brand_logo' => '/images/brand_logo.png',
    'session_autorefresh' => true,

    /** Security configuration **/
    'authentication' => 'db',
    'restrictive' => true,
    'securityscheme' => 'group',
    'administratorpassword' => $_parameters['atk']['administratorpassword'],

    'auth_ignorepasswordmatch' => $_parameters['atk']['auth_ignorepasswordmatch'],
    'auth_usecryptedpassword' => true,
    'auth_userpk' => 'id',
    'auth_userfk' => 'user_id',
    'auth_usernode' => 'auth.users',
    'auth_usertable' => 'auth_users',
    'auth_userfield' => 'username',
    'auth_passwordfield' => 'passwd',
    'auth_emailfield' => 'email',
    'auth_accountdisablefield' => 'isDisabled',
    'auth_administratorfield' => 'isAdmin',
    'auth_leveltable' => 'auth_users_groups',
    'auth_levelfield' => 'group_id',
    'auth_accesstable' => 'auth_accessrights',

    'auth_enable_rememberme' => true,
    'auth_rememberme_dbtable' => 'auth_rememberme',

    'auth_enable_u2f' => true,
    'auth_u2f_dbtable' => 'auth_u2f',
    'auth_u2f_enabledfield' => 'isU2FEnabled',
];