# PHP DOCKER SETUP

Simple PHP development environment for quick start projects. Using Nginx, PHP-fpm8.3 and MariaDB

## To use

Clone this repo to where you want the project to be and setup it up

### Suggested

Since you will probably not be updating this after you´ve installed it (at least not downloading it over and over again for the same project), I would recommend installing it by using `degit`

```bash
npx degit https://github.com/GregoryBrownConsultancy/DockerPhp_WinterCMS.git my_project_name
cd my_project_name
./setup
```
This ensures your have a clean folder without any link to this repo and you can start fresh.

### Using git

```bash
git clone https://github.com/GregoryBrownConsultancy/DockerPhp_WinterCMS.git my_project_name
cd my_project_name
rm -Rf .git
./setup
```
This will setup a basic PHP & MariaDB system running under your 127.0.0.1

### Checking it works

In the folder you ran `setup` run `docker compose ps`. 

You should have three docker images running:
- nginx:latest
- mariadb:latest
- **project_name**-php (where project_name is the name of your folder usually)

If you have these three running, then you are home free.

### Troubleshooting

#### Installing/Compiling

This project is meant to be run in a *nix environment. So if you are on Windows, you should be running this on WSL.
(If you are on Windows and trying to run PHP, you should probably be running on WSL anyways).

- Make sure you have the latest docker up and running
- Make sure your system is up to date

#### Running the project

- A specific service won't start usually means there is port a conflict(in most of the cases) - make sure you don't have local versions of mysql, apache/nginx running on your machine.

## USING THE DOCKER IMAGE

All your source-code should be placed in the folder `app/code`

> You'll need to create the `app/code` folder if you did not run the **winter**/**winter-full** scripts.
> That is the root directory of your application in NGINX.

The folder `app/code` is a live folder so any changes you make to it will reflect instantly on the server.

## SCRIPTS I HAVE INCLUDED TO MAKE LIFE EASY

- **setup** - Clears git folder, builds docker images
- **shell** - Simple shortcut for `docker compose exec....`
- **wintercms** - Clears app directory, installs and setups wintercms
- **wintercms-full** - Clears app directory, installs and setups wintercms, then installs my suite of usual plugins

## WORDPRESS

I've now included a simple flag that can be passed to docker composer that will alternatively install `wp-cli` in your PHP container. This is particularly useful if you are running a wordpress.

To use this, all you need is to run docker compose with a variable:

```bash
WORDPRESS=true docker compose build
```

## WINTER CMS

Since I am an avid WinterCMS user, I created a simple script that can be run after you have setup the application.
```bash
./wintercms
```

This will run through all the basic install commands for you.

> Do keep an eye open becuase it will ask you things every now and then

### What is included with this winter script

When you run the wintecms command, it will install a fully functional WinterCMS application for you.

## WinterCMS-full
Since I usually use a number of standard plugins, I decided to make my life easier by already pre-installing them.

```bash
./wintercms-full
```

### What is included with this winter script

When you run the wintecms command, it will install a fully functional WinterCMS application for you. It comes by default with an assortment of my usual plugins.

- **Latest WinterCMS**
- **wn-builder-plugin** - The famous builder plugin
- **wn-user-plugin** - Client side Users

## What is in the pipeline?
While this does attend most of my current project needs, I might add to it some configuration options, allowing you to choos what kind of install you want to run with and so forth. For the time being, I am keep it simple and clutter free.
