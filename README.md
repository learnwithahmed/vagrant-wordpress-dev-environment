# Vagrant Based Wordpress Development Environment

a Vagrant configuration designed for development of WordPress plugins, themes, or websites.

- [System Requirements](#system-requirements)
- [Installation](#installation)

## System Requirements

Install all of the followings:

- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager#installation)
- [Node.js](http://nodejs.org/)

## Installation

```sh
# Clone repository
$ git clone git@github.com:code2gether/vagrant-wordpress-dev-environment.git
# or if you want to rename the theme directory name
$ git@github.com:code2gether/aylin.git <theme-name>
```

Change into your directory `cd vagrant-wordpress-dev-environment` directory run the following commands:

```sh
1. vagrant up # start a Vagrant environment.
2. composer install # install packages for wordpress
```

## Theme Installation

If you notice after running `vagrant up`, a new folder `wp-content` created in your root project, this is because it symlinked `wp-content` to `wp/wp-content` please don't mess with `wp` directory. So now you can add your own theme to `themes` inside `wp-content` directory.

## Aylin Starter Theme

To get our starter wordpress theme

1. change your directory into `cd wp-content/themes/` in your root files.
2. Clone our starter theme `git clone https://github.com/code2gether/aylin`

you can find more informtion on our theme readme file.

## Development

- vagrant up
- cd wp-content/themes/aylin
- yarn start | npm run start

If you want to stop vagrant you need to run `vagrant halt` in command line.
