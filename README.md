# PHP DOCKER SETUP

Simple PHP development environment for quick start projects.

## To use

Clone this repo to where you want the project to be and setup it up

```bash
git clone repo my_project_name
cd my_project_name
./setup
```

This will setup a basic PHP & MariaDB system running under your 127.0.0.1

All your source-code should be placed in the folder `app/code`

## WINTER CMS

Since I am an avid WinterCMS user, I created a simple script that can be run after you have setup the application.
```bash
./wintercms
```

This will run through all the basic install commands for you.

> Do keep an eye open becuase it will ask you things every now and then

### What is included with this winter script

When you run the wintecms command, it will install a fully functional WinterCMS application for you. It comes by default with an assortment of my usual plugins.

- **Latest WinterCMS**
- **RainLab/Builder** - The famous builde plugin
- **RainLab/User** - Client side Users 
- **RainLab/Translate** - Enable Multi-language sites
- **RainLab/Pages** - Static Pages Plugin
- **RainLab/DebugBar** - The ever so useful Debug Bar 
 
