# Vagrant based development environment

a Vagrant configuration designed for development of WordPress plugins, themes, or websites.

## Requirements

Install all of the followings:

- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager#installation)
- [Node.js](http://nodejs.org/)

## Configuration

In your root directory run the following commands:

1. Run `vagrant up` to start a Vagrant environment.
2. Run `composer install`

Install all NPM packages, change your theme directory:

- cd `wp-content/themes/your-theme`
- Run `npm install` then `npm run build` to compile all your `SCSS`, and `JS` files

## Run

- vagrant up
- cd wp-content/themes/like-v.6.0
- npm run start

## General notes

- Anytime you want to run vagrant run `vagrant up`. To stop it run `vagrant halt`.

- Keep in mind, when you add add/change styling in your `SCSS` files you need to compile your `SCSS` files by:
  - `cd wp-content/themes/your-theme`
  - either you run `npm run build` or `npm run start` to keep watching changes.
