<?php

include_once __DIR__.'/../vendor/autoload.php';

$env = getenv('APP_ENV');
if (!$env || !in_array($env, ['dev', 'staging', 'prod'])) {
    die('APP_ENV must be set!');
}

$atk = new Sintattica\Atk\Core\Atk($env, __DIR__.'/../');

//API
if (isset($_SERVER['PATH_INFO']) && ($_SERVER['PATH_INFO'] === '/api' || strpos($_SERVER['PATH_INFO'], '/api/') === 0)) {
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

    $apiProvider = new \App\Api\ApiProvider();
    $app->register($apiProvider);
    $app->mount('/api', $apiProvider);
    $app->run();
} else {
    $atk->run();
}
