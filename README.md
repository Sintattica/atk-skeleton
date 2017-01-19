# ATK Skeleton Project

This is the skeleton to get ready with the version 9 of [Atk Framework](https://github.com/Sintattica/atk)

Create a project with Composer: for example we want to create the project "newproject":

	$ composer create-project sintattica/atk-skeleton newproject
	$ cd newproject
	
	
Duplicate config/parameters.dist.php to config/parameters.dev.php and change the variables values to fit your development environment.

Change the administratorpassword on config/parameters.prod.php and config/staging.php to something you only known. The default password is "administrator"

Change the identifier to something unique.

Change the web/images/brand_logo.png and web/images/login_logo.jpg.

use the atk-skeleton.sql to create the database tables.

Create an Apache/Nginx virtualhost with the public folder "web".

If you need to configure other config parameters, take a look at the default options in vendor/sintattica/atk/src/Resources/config/atk.php

The deploy.php is a basic template for the deployment with deployer.org