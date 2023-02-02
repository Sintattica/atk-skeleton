<?php

/**
 * ATK config file
 *
 * Put here ATK related config variables only, common to all environments.
 * ATK default config is vendor/sintattica/atk/src/Resources/config/atk.php
 *
 * If you need custom config variables, you can create a new config file and use it, ex: create app.php and use Config::get('app', 'some-variable')
 * to get the config values.
 */

$_baseDir = __DIR__ . '/../';

$languages = ['it'];

$isDevEnv = getenv('APP_ENV') === 'dev';


return [
    'identifier' => 'atk-demo',

    'base_dir' => $_baseDir,
    'application_config_dir' => $_baseDir . 'config/',

    'language' => 'it',
    'supported_languages' => ['it', 'en'],
    'pagelinks_first_last' => true,

    'modules' => [
        App\Modules\App\Module::class,
        App\Modules\Auth\Module::class
    ],

    'menu' => App\Menu::class,

    'assets_url' => '/assets/',
    'style_url' => '/assets/styles/style.css',

    'language_basedir' => $_baseDir . 'languages/',
    'debug' => $isDevEnv ? 1 : 0,
    'meta_caching' => $isDevEnv === false,
    'db' => [
        'default' => [
            'host' => 'mysql',
            'port' => '3306',
            'db' => 'atk',
            'user' => 'root',
            'password' => 'root',
            'charset' => 'utf8',
            'driver' => 'MySqli', // atk
        ]
    ],
    'login_logo' => '/assets/images/login_logo.jpg',
    'brand_logo' => '/assets/images/login_logo.jpg',
    'session_autorefresh' => true,
    'menu_show_user' => true,

    /** Security configuration **/
    'authentication' => 'db',
    'restrictive' => true,
    'securityscheme' => 'group',
    'administratorpassword' => getenv('BACKEND_ADMIN_PASSWORD'),
    'auth_administratorfield' => 'amministratore',

    'auth_ignorepasswordmatch' => $isDevEnv,
    'auth_userpk' => 'id',
    'auth_userfk' => 'user_id',
    'auth_usernode' => 'auth.users',
    'auth_usertable' => 'auth_utente',
    'auth_userfield' => 'username',
    'auth_passwordfield' => 'passwd',
    'auth_emailfield' => 'email',
    'auth_accountdisablefield' => 'disabled',
    'auth_leveltable' => 'auth_utente_gruppo',
    'auth_levelfield' => 'group_id',
    'auth_accesstable' => 'auth_access_rights',
    'auth_languagefield' => 'lingua',

    'auth_enable_rememberme' => true,
    'auth_rememberme_dbtable' => 'auth_rememberme',

];
