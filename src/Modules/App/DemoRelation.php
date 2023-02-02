<?php


namespace App\Modules\App;


use Doctrine\ORM\Mapping\ManyToOne;
use Sintattica\Atk\AdminLte\UIStateColors;
use Sintattica\Atk\Attributes\Attribute;
use Sintattica\Atk\Attributes\NumberAttribute;
use Sintattica\Atk\Core\Node;
use Sintattica\Atk\Attributes\Attribute as A;
use Sintattica\Atk\Relations\ManyToOneRelation;

class DemoRelation extends Node
{


    function __construct($nodeUri)
    {


        parent::__construct($nodeUri, self::NF_ADD_LINK | self::NF_EXPORT);
        $this->setTable('demo_relation');
        $this->setDescriptorTemplate('[descrizione]');

        $this->add(new NumberAttribute('id', A::AF_AUTOKEY | A::AF_HIDE));
        $this->add(new Attribute('descrizione', A::AF_SEARCHABLE | A::AF_OBLIGATORY));

        $this->add(new Attribute('aaaa', A::AF_SEARCHABLE));
        $this->add(new Attribute('bbbb', A::AF_SEARCHABLE));
        $this->add(new Attribute('cccc', A::AF_SEARCHABLE));
        $this->add(new Attribute('dddd', A::AF_SEARCHABLE));
        $this->add(new Attribute('eeee', A::AF_SEARCHABLE));
        $this->add(new Attribute('ffff', A::AF_SEARCHABLE));
        $this->add(new Attribute('gggg', A::AF_SEARCHABLE));

        $this->add(new ManyToOneRelation('parent_id', A::AF_SEARCHABLE | ManyToOneRelation::AF_LARGE, 'app.demo_node'));

        $this->setRowColorMode(self::ROW_COLOR_MODE_CELL);
    }

    function descriptor($record): string
    {
        return $this->generateRandomString();
    }

    public function setRowColors()
    {

        $uiStates = UIStateColors::getInstance()->getAllUIStates();

        for ($i = 0; $i < count($uiStates); $i++) {
            $this->addColorCondition($uiStates[$i], function ($record) use ($i) {
                return $record['id'] === $i + 1;
            });
        }
    }


    private function generateRandomString(): string
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < rand(2,50); $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

}
