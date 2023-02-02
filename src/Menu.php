<?php


namespace App;


use ReflectionException;
use Sintattica\Atk\Core\Menu\ActionItem;
use Sintattica\Atk\Core\Menu\HeaderItem;
use Sintattica\Atk\Core\Menu\Item;
use Sintattica\Atk\Core\Menu\MenuBase;
use Sintattica\Atk\Core\Menu\SeparatorItem;
use Sintattica\Atk\Core\Menu\UrlItem;

class Menu extends MenuBase
{

    /**
     * @throws ReflectionException
     */
    public function appendMenuItems()
    {

        $menuItem = new UrlItem("Home", "/");
        $menuItem
            ->setOrder(10)
            ->setIcon('fas fa-home'); // 'far fa-address-book or if solid needed fas fa-address-book'
            //->setActive(true) //If we want to force the menu item to be active
            //->setPosition(self::MENU_SIDEBAR); //Position of the item
        $this->add($menuItem);


        //No icon specified -> Get the default icon
        $menuItem = new ActionItem("demo", "app.demo_node", "admin");
        $menuItem->setOrder(1);
        $menuItem->setIcon('demoIcon', Item::ICON_CHARS);
        $this->add($menuItem);

        $sepItem = new SeparatorItem();
        $this->add($sepItem);

        $menuItem = new ActionItem("demo_relation", "app.demo_relation", "admin");
        $this->add($menuItem);

        $menuItem = new HeaderItem("sistema");
        $this->add($menuItem);



        $authMenuItem = new ActionItem("auth");
        $this->add($authMenuItem);

        $menuItem = new ActionItem("utenti", "auth.users", "admin");
        $menuItem
            ->setParent($authMenuItem->getName())
            ->setPosition(self::MENU_SIDEBAR);
        $this->add($menuItem);

        $menuItem = (new ActionItem("gruppi", "auth.groups", "admin"))->setParent($authMenuItem->getName());
        $this->add($menuItem);

        $menuItem = (new ActionItem("access_rights", "auth.access_rights", "admin"))->setParent($authMenuItem->getName());
        $this->add($menuItem);


    }
}
