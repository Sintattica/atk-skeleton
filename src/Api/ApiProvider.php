<?php

namespace App\Api;

use Pimple\Container;
use Pimple\ServiceProviderInterface;
use Silex\Api\ControllerProviderInterface;
use Silex\Application;
use Sintattica\Atk\Core\Atk;
use Sintattica\Atk\Security\SecurityManager;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ApiProvider implements ControllerProviderInterface, ServiceProviderInterface
{
    public function register(Container $app)
    {
        $app['api.token'] = function () {
            return new ApiTokenManager();
        };

        $app['api.auth'] = $app->protect(function(Request $request) use ($app) {
            $token = $request->headers->get('x-token');
            if(empty($token)){
                $app->abort(401, "Authorization required");
            }

            $username = $app['api.token']->getUsernameFromToken($token);

            if(!$username){
                $app->abort(401, "Authorization required");
            }

            $securityManager = SecurityManager::getInstance();
            $m_user = $securityManager->m_authorization->getUser($username);
            $securityManager->postLogin($m_user);
        });
    }

    public function connect(Application $app)
    {
        $controllers = $app['controllers_factory'];


        $controllers->get('/', function () {
            return new Response('Api endpoint');
        });

        $controllers->post('/token', function (Application $app, Request $request) {
            $username = $request->get('username');
            $password = $request->get('password');

            if ($username == null || $password == null) {
                $app->abort(500, 'Username and password are required');
            }

            $securityManager = SecurityManager::getInstance();
            $m_user = $securityManager->login($username, $password);

            if ($securityManager->m_fatalError) {
                $app->abort(500, $securityManager->m_fatalError);
            }

            if (!$m_user) {
                $error = $securityManager->getAuthResponseTranslation($securityManager->auth_response);
                $app->abort(500, $error);
            }

            $securityManager->postLogin($m_user);
            $securityManager->notifyListeners('postLogin', $m_user['name']);

            $token = $app['api.token']->createTokenForUser($m_user['name']);

            return new JsonResponse(['token' => $token]);
        });

        $controllers->get('/protected', function(Application $app){

            /** @var Atk $atk */
            $atk = $app['atk'];

            $user = SecurityManager::atkGetUser();
            $testNode = $atk->atkGetNode('app.testNode');
            $rows = $testNode->select()->getAllRows();

            $allowed = $testNode->allowed('admin');

            return new JsonResponse(['user' => $user, 'rows' => $rows, 'allowed' => $allowed]);

        })->before($app['api.auth']);

        $controllers->get('/free', function(Application $app){
            return new JsonResponse(['test' => 'ciao!']);
        });

        return $controllers;
    }
}
