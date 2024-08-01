# PHP DOCKER SETUP

Simple PHP development environment for quick start projects. Using Nginx, PHP-fpm8.3 and MariaDB

## To use

Clone this repo to where you want the project to be and setup it up

```bash
git clone https://github.com/GregoryBrownConsultancy/DockerPhp_WinterCMS.git my_project_name
cd my_project_name
./setup
```

This will setup a basic PHP & MariaDB system running under your 127.0.0.1

All your source-code should be placed in the folder `app/code`

> You'll need to create the `app/code` folder. That is the root directory of your application in NGINX.

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
> At the time of this release, since Winter still does not have a functioning marketplace, I am installing the plugins by cloning their repos rather than installing them via `plugin:install`

```bash
./wintercms-full
```

### What is included with this winter script

When you run the wintecms command, it will install a fully functional WinterCMS application for you. It comes by default with an assortment of my usual plugins.

- **Latest WinterCMS**
- **wn-builder-plugin** - The famous builder plugin
- **wn-user-plugin** - Client side Users
- **wn-translate-plugin** - Enable Multi-language sites
- **wn-pages-plugin** - Static Pages Plugin
- **wn-debugBar-plugin** - The ever so useful Debug Bar

## What is in the pipeline?
While this does attend most of my current project needs, I might add to it some configuration options, allowing you to choos what kind of install you want to run with and so forth. For the time being, I am keep it simple and clutter free.
