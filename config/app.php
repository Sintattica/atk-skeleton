<?php

/**
 * An atk sample custom config file. To retrieve the parameters from this file,
 * you can use something like Config::get('app', 'some-variable')
 */

$env = getenv('APP_ENV');
if (!$env || !in_array($env, ['dev', 'staging', 'prod'])) {
    die('atk.php: APP_ENV must be set!');
}

$_baseDir = __DIR__.'/../';
$_parameters = require __DIR__.'/parameters.'.$env.'.php';


return [
    'some-variable' => 'This is a test config variable, you can safely remove me',

    'oauth_access_tokens_table' => 'oauth_access_tokens',
    'oauth_private_key' => __DIR__.'/../oauth/private.key',
    'oauth_public_key' => __DIR__.'/../oauth/public.key',
    'oauth_jwt_iss' => $_parameters['oauth_jwt_iss'],
    'oauth_jwt_aud' => $_parameters['oauth_jwt_aud'],
    'oauth_jwt_nbf' => 0,
    'oauth_jwt_exp' => 36000,
];
