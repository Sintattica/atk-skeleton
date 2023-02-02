<?php


namespace App\Modules\App;


use Sintattica\Atk\AdminLte\UIStateColors;
use Sintattica\Atk\Attributes\ActionButtonAttribute;
use Sintattica\Atk\Attributes\Attribute;
use Sintattica\Atk\Attributes\Attribute as A;
use Sintattica\Atk\Attributes\BoolAttribute;
use Sintattica\Atk\Attributes\ButtonAttribute;
use Sintattica\Atk\Attributes\CkAttribute;
use Sintattica\Atk\Attributes\DateAttribute;
use Sintattica\Atk\Attributes\DateTimeAttribute;
use Sintattica\Atk\Attributes\FieldSet;
use Sintattica\Atk\Attributes\FileAttribute;
use Sintattica\Atk\Attributes\ListAttribute;
use Sintattica\Atk\Attributes\MultiSelectListAttribute;
use Sintattica\Atk\Attributes\NumberAttribute;
use Sintattica\Atk\Attributes\PasswordAttribute;
use Sintattica\Atk\Attributes\StateColorAttribute;
use Sintattica\Atk\Attributes\SwitchAttribute;
use Sintattica\Atk\Attributes\TextAttribute;
use Sintattica\Atk\Attributes\TimeAttribute;
use Sintattica\Atk\Attributes\SubmitButtonAttribute;
use Sintattica\Atk\Core\Node;
use Sintattica\Atk\Core\Tools;
use Sintattica\Atk\Handlers\ActionHandler;
use Sintattica\Atk\Relations\OneToManyRelation;

class DemoNode extends Node
{

    private const SECTION_STATE_COLOR_ATTRIB = 'stateColorAttributes';

    function __construct($nodeUri)
    {
        parent::__construct($nodeUri, self::NF_ADD_LINK | self::NF_EXPORT | self::NF_MRA);

        $this->setTable('demo');
        $this->setDescriptorTemplate('[attribute]');

        $this->add(new NumberAttribute('id', A::AF_AUTOKEY | A::AF_HIDE));
        $this->add(new Attribute('attribute', A::AF_SEARCHABLE | A::AF_OBLIGATORY));

        $this->add((new StateColorAttribute('fieldset_state_color', A::AF_HIDE_LIST | A::AF_NO_LABEL))
            ->setColor(UIStateColors::STATE_SUCCESS));
        $this->add(new Attribute('fieldset_attribute', A::AF_SEARCHABLE | A::AF_HIDE_LIST | A::AF_FORCE_LOAD | A::AF_NO_LABEL));
        $this->add(new ListAttribute('fieldset_list', A::AF_HIDE_LIST | A::AF_FORCE_LOAD | A::AF_NO_LABEL, ['ciao', 'mondo', 'bellissimo']));
        $this->add(new FieldSet('fieldset', 0, '[fieldset_state_color]&nbsp;[fieldset_list]&nbsp;[fieldset_attribute]'));

        $this->add(new DateAttribute('date_a', A::AF_SEARCHABLE));
        $this->add(new DateTimeAttribute('datetime_a', A::AF_SEARCHABLE | A::AF_OBLIGATORY | DateAttribute::AF_DATE_DEFAULT_EMPTY));
        $this->add(new TimeAttribute('time_a', A::AF_SEARCHABLE));

        $attr = new TextAttribute('text_a', A::AF_SEARCHABLE);
        $attr->setDisplayMode(TextAttribute::MODE_DEFAULT);
        $this->add($attr);

        $submitButton = new SubmitButtonAttribute("buttonSubmit", ButtonAttribute::AF_DUMMY_SHOW_LABEL);
        $submitButton->setText("Set Current Date");
        $submitButton->onClick(function ($record) {
            $sql = 'UPDATE demo SET date_a=NOW() where id='.$record['id'];
            return $this->getDb()->query($sql);
        });
        $this->add($submitButton);


        $actionButton = new ActionButtonAttribute("buttonAction", ButtonAttribute::AF_DUMMY_SHOW_LABEL);
        $actionButton->setNode($this->atkNodeUri());
        $actionButton->setAction('admin');
        $actionButton->setTarget('_blank');
        $this->add($actionButton);


        $this->add((new StateColorAttribute('state_color_2'))
            ->setColorCondition(function () {
                return UIStateColors::STATE_ORANGE_LIGHT;
            })->setTextContent('ciaoo')
            ->setBordered(true)
            ->setColoredText(true)
            ->setShape(StateColorAttribute::SHAPE_SQUARE), self::SECTION_STATE_COLOR_ATTRIB
        );

        $this->add((new StateColorAttribute('state_color_3'))
            ->setColor(UIStateColors::STATE_SUCCESS)
            ->setTextContent('ciao3')
            ->setBordered(true), self::SECTION_STATE_COLOR_ATTRIB
        );

        $this->add((new StateColorAttribute('state_color_lg'))
            ->setColor(UIStateColors::STATE_PRIMARY)
            ->setTextContent('attribute lg')
            ->setBordered(true)
            ->setColoredText(true)
            ->setSize(StateColorAttribute::SIZE_LG), self::SECTION_STATE_COLOR_ATTRIB
        );

        $this->add((new StateColorAttribute('state_color_sm'))
            ->setColor(UIStateColors::COLOR_RED_LIGHT)
            ->setTextContent('attribute sm')
            ->setBordered(true)
            ->setColoredText(true)
            ->setSize(StateColorAttribute::SIZE_SM), self::SECTION_STATE_COLOR_ATTRIB
        );


        $this->add(new ListAttribute('list_a', A::AF_SEARCHABLE | A::AF_OBLIGATORY | ListAttribute::AF_LIST_OBLIGATORY_NULL_ITEM, ['dai', 'bene', 'forse']))->setMultipleSearch();
        $this->add(new MultiSelectListAttribute('multiselectlist_a', A::AF_SEARCHABLE, ['dai', 'bene', 'forse']));
        $this->add(new BoolAttribute('bool_a', A::AF_SEARCHABLE));
        $this->add(new SwitchAttribute('switch_a', A::AF_SEARCHABLE));
        $this->add(new FileAttribute('file_a', A::AF_SEARCHABLE | A::AF_HIDE_LIST, ['./uploads', '/uploads']));
        $this->add(new PasswordAttribute('password_a', A::AF_SEARCHABLE), 'profilo');

        $ckAttr = new CkAttribute('ck_a', A::AF_SEARCHABLE);
        $ckAttr->setDisplayMode(Attribute::MODE_DEFAULT);
        $this->add($ckAttr, 'profilo');
        //$this->add(new RadioAttribute('radio_a', A::AF_SEARCHABLE, ['opt1', 'opt2', 'opt3'], ['option-1', 'option-2', 'option-3']));

        $this->add(new OneToManyRelation('demo_relation_r', 0, 'app.demo_relation', 'parent_id'), 'profilo');
    }

    function recordActions($record, &$actions, &$mraactions)
    {
        $actions['demo'] = Tools::dispatch_url($this->atkNodeUri(), "demo", ["atkselector" => $record['atkprimkey']]);

        parent::recordActions($record, $actions, $mraactions);
    }

    function action_demo(ActionHandler $handler)
    {
        if (!$this->m_postvars['confirm'] and !$this->m_postvars['cancel'] and !$this->m_postvars['atkcancel']) {

            // show confirm page Yes/No
            $this->getPage()->addContent($this->renderActionPage($handler->m_action, [$this->confirmAction($this->m_postvars['atkselector'], $handler->m_action)]));

            return;

        } elseif ($this->m_postvars['cancel']) {
            $this->redirect();
            return;
        }

        $this->redirect();
    }

    /*
    public function rowColor($record){

        if($record['id'] === 1){
            return UIStateColors::COLOR_SUCCESS;
        }

        return parent::rowColor($record);
    }*/

    public function setRowColors()
    {

        $uiStates = UIStateColors::getInstance()->getAllUIStates();

        for ($i = 0; $i < count($uiStates); $i++) {
            $this->addColorCondition($uiStates[$i], function ($record) use ($i) {
                return $record['id'] === $i + 1;
            });
        }
    }


    /*
    public function rowColorByState($record, $index = 0, $statesMap = []): string
    {

        return parent::rowColorByState($record, $index, [
            UIStateColors::STATE_DANGER => ($record['id'] === 1)
        ]);
    }*/


}
