<?php

namespace App\Api;

use Lcobucci\JWT\Token;
use Pimple\Container;
use Pimple\ServiceProviderInterface;
use Silex\Api\ControllerProviderInterface;
use Silex\Application;
use Sintattica\Atk\Security\SecurityManager;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


class OauthProvider implements ControllerProviderInterface, ServiceProviderInterface
{
    public function register(Container $app)
    {
        $app['api.token_manager'] = function () {
            return new OauthTokenManager();
        };

        $app['api.protect'] = $app->protect(function (Request $request) use ($app) {
            $auth = $request->headers->get('authorization');
            if (strpos($auth, 'Bearer') !== 0) {
                $app->abort(401, "Authorization required");
            }

            $access_token = explode(' ', $auth)[1];
            if (empty($access_token)) {
                $app->abort(401, "Authorization required");
            }

            /** @var Token $token */
            $token = $app['api.token_manager']->createTokenFromString($access_token);

            if (!$app['api.token_manager']->verifyToken($token)) {
                $app->abort(401, "Invalid Token");
            }
            if (!$app['api.token_manager']->validateToken($token)) {
                $app->abort(401, "Expired Token");
            }

            $username = $token->getClaim('username');

            if (!$username) {
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
            return new Response('Oauth endpoint');
        });

        $controllers->post('/token', function (Application $app, Request $request) {

            $type = $request->get('grant_type');
            if ($type != 'password') {
                $app->abort(500, 'Only "password" grant_type is supported');
            }

            $username = $request->get('username');
            $password = $request->get('password');
            $auth = $request->headers->get('authorization');
            if ($auth) {
                if (strpos($auth, 'Basic') !== 0) {
                    $app->abort(500, 'You must perform a Basic Authentication');
                }
                list($username, $password) = explode(':', base64_decode(explode(' ', $auth)[1]));
            }

            if ($username == null || $password == null) {
                $app->abort(401, 'Username and password are required');
            }

            $securityManager = SecurityManager::getInstance();
            $m_user = $securityManager->login($username, $password);

            if ($securityManager->m_fatalError) {
                $app->abort(401, $securityManager->m_fatalError);
            }

            if (!$m_user) {
                $error = $securityManager->getAuthResponseTranslation($securityManager->auth_response);
                $app->abort(401, $error);
            }

            $securityManager->postLogin($m_user);
            $securityManager->notifyListeners('postLogin', $m_user['name']);

            /** @var Token $token */
            $token = $app['api.token_manager']->createTokenForUser($m_user);

            $response = [
                'token_type' => 'Bearer',
                'expires_in' => $token->getClaim('exp') - time(),
                'access_token' => (string)$token,
                'refresh_token' => 'TODO',
            ];

            return new JsonResponse($response);
        });

        return $controllers;
    }
}
