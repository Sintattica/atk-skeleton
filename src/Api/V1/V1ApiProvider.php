<?php

namespace App\Api\V1;

use Silex\Api\ControllerProviderInterface;
use Silex\Application;
use Sintattica\Atk\Core\Atk;
use Sintattica\Atk\Security\SecurityManager;
use Symfony\Component\HttpFoundation\JsonResponse;

class V1ApiProvider implements ControllerProviderInterface
{
    public function connect(Application $app)
    {
        $controllers = $app['controllers_factory'];

        $controllers->get('/free', function (Application $app) {
            return new JsonResponse(['test' => 'ciao!']);
        });

        $controllers->get('/protected', function (Application $app) {

            /** @var Atk $atk */
            $atk = $app['atk'];

            $user = SecurityManager::atkGetUser();
            $testNode = $atk->atkGetNode('app.testNode');
            $rows = $testNode->select()->getAllRows();

            $allowed = $testNode->allowed('admin');

            return new JsonResponse(['user' => $user, 'rows' => $rows, 'allowed' => $allowed]);

        })->before($app['api.protect']);


        return $controllers;
    }


}
