<?php

include_once __DIR__ . '/../vendor/autoload.php';

$atk = new Sintattica\Atk\Core\Atk(getenv('APP_ENV'), __DIR__ . '/../');
$atk->run();
