<?php

return [
    'atk' => [

        'identifier' => 'atk-skeleton-dev',

        'db' => [
            'default' => [
                'host' => 'localhost',
                'db' => 'atk-skeleton',
                'user' => 'root',
                'password' => '',
                'charset' => 'utf8',
                'driver' => 'MySqli',
            ],
        ],

        'debug' => 1,
        'meta_caching' => false,
        'auth_ignorepasswordmatch' => false,
        'administratorpassword' => '$2y$10$erDvMUhORJraJyxw9KXKKOn7D1FZNsaiT.g2Rdl/4V6qbkulOjUqi', // administrator
    ],
];