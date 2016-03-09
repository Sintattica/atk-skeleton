# ATK Skeleton Project

This is the skeleton to get ready with the version 9 of [Atk Framework](https://github.com/Sintattica/atk)

Create a project with Composer: for example we want to create the project "newproject":

	$ composer create-project sintattica/atk-skeleton newproject
	$ cd newproject
	
	
Edit the .env.example file with your environment values, than copy ".env.example" to ".env". We use phpdotenv to load the parameters for thedevelopment environment.

Change the "identifier" parameter in "config/atk.php" to something unique ("newproject" in this case).

Create a MySql database and execute the file src/atk-skeleton.sql, than you can delete this file.

Create an Apache/Nginx virtualhost with the public folder "web".

If you need to configure other config parameters, take a look at the default options in vendor/sintattica/atk/src/Resources/config/atk.php


	



