# rg (Rails + Angular, pronounced "regular")

Opinionated way to use [AngularJS](http://angularjs.org) in a [Rails](http://rubyonrails.org)/[Rails-API](https://github.com/rails-api/rails-api) app using

- [CoffeeScript] for code, because it looks good.
- [Bower] for managing frontend libraries, because it's simple.
- [angularjs-rails-resource], because why not use it?

By using this gem, you will
- Be able to use Angular + Rails
- Adopt a convention about your Angular directory structure and
- Get some basic, but handy generators!
- Delegate Angular/frontend library management to Bower
- Still live in Ruby land (i.e. you can do E2E testing using Capybara)

You are invited to read [this blog post](http://rbjl.net/69) for background information on this mindset, which could be called the *CARB* stack.

## Setup

Make sure [you have bower installed](https://bower.io). Then add this to your Gemfile:

    gem 'rg'

Run `bundle` on the command-line. Then setup your angular project:

    rails g rg:bower  # Set up a new .bowerrc file and bower.json file

    bower install angular angularjs-rails-resource --save  # Use bower to install latest angulars

    rails g rg:install --manifests=application.js  # Set up the angular app directory and add to sprocket manifest

Alternatively, you can run all the previous commands via rake:

    rake rg:setup

## Views

This gem does not mandate how you should organize your views. Be sure to only include your manifest [???]

turbolinks [???]

## Generators

Then start developing and keep in mind that you have the following generators to create new Angular files for you:

- rg:service <name>
- rg:resource <name>
- rg:controller <name>
- rg:filter <name>
- rg:directive <name>
- rg:app <name>

The generators only generate very basic file content. While this is intended, there might be --options for power users in the future.

## TODO (by you?)
- Turbolink support
- Add scaffold generator
- Add serializer generator + directory
- Add capabilities to rg:app to optionally create routing

## Credits

(c) 2013 Jan Lelis <janlelis.de>, MIT LICENSE
