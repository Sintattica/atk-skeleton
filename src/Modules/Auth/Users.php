<?php

namespace App\Modules\Auth;

use Sintattica\Atk\Attributes\Attribute;
use Sintattica\Atk\Attributes\Attribute as A;
use Sintattica\Atk\Attributes\EmailAttribute;
use Sintattica\Atk\Attributes\ListAttribute;
use Sintattica\Atk\Attributes\PasswordAttribute;
use Sintattica\Atk\Attributes\SwitchAttribute;
use Sintattica\Atk\Core\Config;
use Sintattica\Atk\Core\Node;
use Sintattica\Atk\Core\Tools;
use Sintattica\Atk\Db\Db;
use Sintattica\Atk\Relations\ShuttleRelation;
use Sintattica\Atk\Security\SecurityManager;

class Users extends Node
{

    function __construct($nodeUri)
    {
        parent::__construct($nodeUri, Node::NF_NO_EXTENDED_SEARCH | Node::NF_ADD_LINK | Node::NF_EXPORT | Node::NF_COPY);

        $this->setTable('auth_utente');
        $this->setOrder('[table].lastname, [table].firstname');
        $this->setDescriptorTemplate('[lastname] [firstname]');

        $this->add(new Attribute('id', A::AF_AUTOKEY));
        $this->add(new Attribute('username', A::AF_FORCE_LOAD | A::AF_OBLIGATORY | A::AF_SEARCHABLE | A::AF_UNIQUE | A::AF_READONLY_EDIT));
        $pwdFlags = Attribute::AF_OBLIGATORY | A::AF_HIDE_LIST | PasswordAttribute::AF_PASSWORD_NO_VALIDATE;
        $this->add(new PasswordAttribute('passwd', $pwdFlags, true));


        $this->add(new Attribute('firstname', A::AF_FORCE_LOAD | A::AF_OBLIGATORY | A::AF_SEARCHABLE));
        $this->add(new Attribute('lastname', A::AF_FORCE_LOAD | A::AF_OBLIGATORY | A::AF_SEARCHABLE));
        $this->add(new ListAttribute('lingua', A::AF_SEARCHABLE | A::AF_OBLIGATORY, Config::getGlobal('supported_languages')));

        $this->add(new EmailAttribute('email', A::AF_HIDE_LIST));


        $this->add(new SwitchAttribute('disabled', A::AF_SEARCHABLE | A::AF_FORCE_LOAD));

        //NB: si assume un solo amministratore!
        $this->add(new SwitchAttribute('amministratore', A::AF_HIDE));

        $this->add(new ShuttleRelation('groups', A::AF_SEARCHABLE | A::AF_CASCADE_DELETE, 'auth.users_groups', 'auth.groups', 'user_id', 'group_id'));

    }

    /**
     * Torna un array assoc. degli utenti (id => descriptor), sulla base delle condizioni passate
     *
     * @param string|array $idProfiles id profilo o array di id
     * @param bool $onlyEnabled Solo gli utenti abilitati
     * @param string|array $idUsers Utente/i da caricare comunque, a prescindere dalle condizioni precedenti
     * @return array Gli utenti corrispondenti
     */
    function getAssoc($idProfiles = null, $onlyEnabled = true, $idUsers = null)
    {
        $ret = [];

        // (non considera mai gli utenti clienti)
        $condition = "true"; // TODO: refactoring

        $filtersOR = [];
        if ($idProfiles or $onlyEnabled) {
            $filters = [];
            if ($idProfiles) {
                // profili specifici
                if (!is_array($idProfiles)) {
                    $idProfiles = [$idProfiles];
                }
                $filters[] = sprintf("up.%s IN (%s)", Config::getGlobal('auth_levelfield'), self::implodeSQL($idProfiles));
            }
            if ($onlyEnabled) {
                // solo utenti abilitati
                $filters[] = "u.disabled = 0";
            }
            $filtersOR[] = '(' . implode(' AND ', $filters) . ')';
        }
        if ($idUsers) {
            // utenti specifici
            if (!is_array($idUsers)) {
                $idUsers = array($idUsers);
            }
            $filtersOR[] = "u.id IN (" . Utils::implodeSQL($idUsers) . ")";
        }
        if ($filtersOR) {
            $condition .= ' AND (' . implode(' OR ', $filtersOR) . ')';
        }

        $sql = sprintf("
            SELECT id, %s FROM %s u
            LEFT JOIN %s up ON u.id = up.%s
            WHERE $condition
            ORDER BY lastname, firstname",
            implode(', ', $this->descriptorFields()), $this->getTable(),
            Config::getGlobal('auth_leveltable'), Config::getGlobal('auth_userfk'));

        $rows = $this->getDb()->getRows($sql);
        foreach ($rows as $row) {
            $ret[$row['id']] = $this->descriptor($row);
        }

        return $ret;
    }



    /**
     * @param array $pieces
     * @param string $sep Separatore dei valori
     * @return string
     */
    private static function implodeSQL($pieces, $sep = ',')
    {
        foreach ($pieces as &$p) {
            $p = Tools::escapeSQL($p);
        }
        return "'" . implode("'" . $sep . " '", $pieces) . "'";
    }
}
