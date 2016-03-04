# ATK Skeleton Project

This is the skeleton to get ready with the version 9 of [Atk Framework](https://github.com/Sintattica/atk)

Create a project with Composer, for example we want to create a project "awesome-atk9":

	$ composer create-project -s dev sintattica/atk-skeleton awesome-atk9
	$ cd awesome-atk9
	
Edit the .env.example file with your environment values, than copy .env.example to .env

Create a MySql database and execute the query of src/atk-project.sql, than delete this file.

Create an Apache/Nginx virtualhost that uses the folder "web" as the public documentroot.

That's all!


	



