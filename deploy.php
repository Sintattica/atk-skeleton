<?php

/*
 * Install deployer 4 with:
 * curl -LO https://deployer.org/deployer.phar && chmod +x deployer.phar
 *
 * Execute deployer with:
 * ./deployer.phar
 *
 * Replace all uppercase strings (like 'GIT_REPOSITORY') with the appropriate values.
 * Check the webserver:reload task to fit your needs
 */

namespace Deployer;

require 'recipe/common.php';

// Set configurations
set('repository', 'GIT_REPOSITORY');
set('shared_files', []);
set('shared_dirs', []);

// Configure the staging server
server('staging', 'STAGING_SERVER_ADDRESS', 22)
    ->user('STAGING_USER')
    ->forwardAgent()
    ->set('deploy_path', 'STAGING_DEPLOY_PATH')
    ->set('branch', 'develop')
    ->stage('staging');

// Configure the production server
server('prod', 'PROD_SERVER_ADDRESS', 22)
    ->user('PROD_USER')
    ->forwardAgent()
    ->set('deploy_path', 'PROD_DEPLOY_PATH')
    ->set('branch', 'master')
    ->stage('prod');


task('webserver:reload', function () {
    // php fpm 7 with nginx
    run('sudo systemctl reload php7.0-fpm.service');
    run('sudo systemctl reload nginx');

    // apache
    //run('sudo apachectl graceful');
})->desc('Reload the webserver');

task('deploy', [
    'deploy:prepare',
    'deploy:release',
    'deploy:update_code',
    'deploy:vendors',
    'deploy:shared',
    'deploy:symlink',
    'cleanup',
])->desc('Deploy App');

after('deploy', 'webserver:reload');
after('rollback', 'webserver:reload');
