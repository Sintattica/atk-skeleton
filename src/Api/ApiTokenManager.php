<?php

namespace App\Api;

use Sintattica\Atk\Core\Config;
use Sintattica\Atk\Db\Db;

class ApiTokenManager
{
    public function createTokenForUser($username)
    {
        $db = Db::getInstance();
        $params = Config::get('app', 'api');
        $dbTable = $params['dbtable'];
        $selector = base64_encode(openssl_random_pseudo_bytes(9));
        $authenticator = openssl_random_pseudo_bytes(33);
        $userfield = Config::getGlobal('auth_userfield');

        $sql = "INSERT INTO `".$dbTable."` (selector, token, `$userfield`, created) VALUES (?, ?, ?, NOW())";
        $stmt = $db->prepare($sql);
        $stmt->execute([$selector, hash('sha256', $authenticator), $username]);
        $db->commit();

        $tokenValue = $selector.':'.base64_encode($authenticator);

        return $tokenValue;
    }

    public function getUsernameFromToken($token)
    {
        $db = Db::getInstance();
        $params = Config::get('app', 'api');
        $dbTable = $params['dbtable'];

        list($selector, $authenticator) = explode(':', $token);
        $sql = "SELECT * FROM `$dbTable` WHERE selector = '".$db->escapeSQL($selector)."'";
        $row = $db->getRow($sql);

        //token found?
        if (!$row) {
            return null;
        }

        $ret = $row[Config::getGlobal('auth_userfield')];

        try {
            //token verified?
            if (!hash_equals($row['token'], hash('sha256', base64_decode($authenticator)))) {
                throw new \Exception('token not match');
            }
        } catch (\Exception $e) {
            $ret = null;
        }

        return $ret;
    }
}
