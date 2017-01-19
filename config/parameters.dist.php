<?php

/**
 * This is the parameters file to use as a template for the local development config file.
 * Just copy to "parameters.dev.php" and change the parameters to fit your environment.
 * Do not add parameters.dev.php to the git repository.
 */

return [
    'atk' => [

        'identifier' => 'atk-skeleton-dev', // CHANGE ME!

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