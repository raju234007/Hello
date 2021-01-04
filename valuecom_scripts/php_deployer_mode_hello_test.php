<?php
namespace Deployer;

require 'recipe/laravel.php';

// Project name
set('application', 'marvel');

// Project repository
set('repository', 'https://github.com/drnic/php-helloworld.git');
/*
// [Optional] Allocate tty for git clone. Default value is false.
set('git_tty', true);

// Shared files/dirs between deploys
add('shared_files', []);
add('shared_dirs', []);

// Writable dirs by web server
add('writable_dirs', []);

*/

// Hosts

host('localhost')
    ->stage('dev')
    ->set('deploy_path', '/var/www/php');

// Tasks
// Deploy tasks for en.education.vm
task('deploy:en-git', function () {
    run('cd /var/www/php && git pull');
})
// Tasks group
task('deploy', [
    //'deploy:git',
    //'deploy:migration',
    //'deploy:composer',
    //'deploy:npm',
    //'deploy:ng build',
    'deploy:en-git'
    //'deploy:en-migration',
    //'deploy:en-composer',
    //'deploy:en-npm',
    //'deploy:en-ng build',
    //'deploy:asia-git',
    //'deploy:asia-migration',
    //'deploy:asia-composer',
    //'deploy:asia-npm',
    //'deploy:asia-ng build',
    ]);

?>