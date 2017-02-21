<?php

namespace App\Api;

use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Parser;
use Lcobucci\JWT\Signer\Key;
use Lcobucci\JWT\Signer\Rsa\Sha256;
use Lcobucci\JWT\Token;
use Lcobucci\JWT\ValidationData;
use Sintattica\Atk\Core\Config;
use Sintattica\Atk\Db\Db;

class OauthTokenManager
{
    /**
     * @param array $user atkUser
     * @return Token $token
     */
    public function createTokenForUser($user)
    {
        $db = Db::getInstance();
        $dbTable = Config::get('app', 'oauth_access_tokens_table');
        $userField = Config::getGlobal('auth_userfield');
        $privateKey = new Key('file://'.Config::get('app', 'oauth_private_key'));

        $jti = hash('sha256', openssl_random_pseudo_bytes(16));
        $time = time();

        $builder = new Builder();
        $builder
            ->setIssuer(Config::get('app', 'oauth_jwt_iss'))
            ->setAudience(Config::get('app', 'oauth_jwt_aud'))
            ->setId($jti, true)
            ->setIssuedAt($time)
            ->setNotBefore($time + Config::get('app', 'oauth_jwt_nbf'))
            ->setExpiration($time + Config::get('app', 'oauth_jwt_exp'));

        $builder->set('username', $user['name']);

        $builder->sign(new Sha256(), $privateKey);
        $token = $builder->getToken();


        $sql = "INSERT INTO `$dbTable` (jti, token, `$userField`, created, expire) VALUES (?, ?, ?, FROM_UNIXTIME(?), FROM_UNIXTIME(?))";
        $stmt = $db->prepare($sql);

        $params = [$jti, $token, $user['name'], $token->getClaim('iat'), $token->getClaim('exp')];

        $stmt->execute($params);
        $db->commit();

        return $token;
    }

    /**
     * @param string $tokenString
     * @return Token
     */
    public function createTokenFromString($tokenString)
    {
        $parser = new Parser();
        $token = $parser->parse($tokenString);

        return $token;
    }

    /**
     * @param Token $token
     * @return bool
     */
    public function verifyToken($token)
    {
        $publicKey = new Key('file://'.Config::get('app', 'oauth_public_key'));

        return $token->verify(new Sha256(), $publicKey);
    }

    /**
     * @param Token $token
     * @return bool
     */
    public function validateToken($token)
    {
        $data = new ValidationData();
        $data->setIssuer(Config::get('app', 'oauth_jwt_iss'));
        $data->setAudience(Config::get('app', 'oauth_jwt_aud'));

        return $token->validate($data);
    }
}
