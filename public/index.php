<?php

use Sintattica\Atk\Core\Config;


require __DIR__.'/../vendor/autoload.php';

if (!class_exists(Dotenv::class)) {
    throw new \RuntimeException('APP_ENV environment variable is not defined. You need to define environment variables for configuration or add "symfony/dotenv" as a Composer dependency to load variables from a .env file.');
}
(new Dotenv(true))->load(__DIR__ . '/../.env');

$env = $_SERVER['APP_ENV'] ?? 'dev';


$atk = new Sintattica\Atk\Core\Atk( $env,__DIR__ . '/../');

$atk->run();
