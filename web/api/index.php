<?php

include_once __DIR__.'/../../vendor/autoload.php';

$env = getenv('APP_ENV');
if (!$env || !in_array($env, ['dev', 'staging', 'prod'])) {
    die('APP_ENV must be set!');
}

$atk = new Sintattica\Atk\Core\Atk($env, __DIR__.'/../');
$app = new \Silex\Application();
$app['env'] = $env;
$app['atk'] = $atk;

$app->error(function (\Exception $e, \Symfony\Component\HttpFoundation\Request $request, $code) use ($app) {
    $res = [
        'error' => true,
        'code' => $code,
        'message' => $e->getMessage(),
    ];

    return $app->json($res, $code);
});

$oauthProvider = new \App\Api\OauthProvider();
$app->register($oauthProvider)->mount('/oauth', $oauthProvider);

$V1ApiProvider = new \App\Api\V1\V1ApiProvider();
$app->mount('/v1', $V1ApiProvider);

$app->run();
