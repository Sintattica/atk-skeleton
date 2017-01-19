<?php

require 'recipe/common.php';

// Set base configurations
set('repository', '******');
set('shared_files', []);
set('shared_dirs', []);

// Configure staging server
server('staging', '******', 22)
    ->user('******')
    ->forwardAgent()
    ->stage('staging')
    ->env('deploy_path', '******')
    ->env('branch', 'develop');

// Configure production server
server('prod', '******', 22)
    ->user('******')
    ->forwardAgent()
    ->stage('prod')
    ->env('deploy_path', '******')
    ->env('branch', 'master');

/**
 * Main task
 */
task('deploy', [
    'deploy:prepare',
    'deploy:release',
    'deploy:update_code',
    'deploy:vendors',
    'deploy:shared',
    'deploy:symlink',
    'cleanup',
])->desc('Deploy App');

task('reload:webserver', function () {
    run('sudo /usr/sbin/service php7.0-fpm reload');
});

after('deploy', 'reload:webserver');
after('rollback', 'reload:webserver');
