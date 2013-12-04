# rg (Rails + Angular, pronounced "regular")

Opinionated way to use [AngularJS] in a [Rails]/[Rails-API] app using

- [CoffeeScript] for code, because it looks good.
- [Bower] for managing frontend libraries, because it's simple.
- [angularjs-rails-resource], because why not use it?

By using this gem, you will
- Be able to use Angular + Rails
- Adopt a convention about your Angular directory structure and
- Get some basic, but handy generators!
- Delegate Angular/frontend library management to bower
- Still live in Ruby land (you can do E2E testing using Capybara)

You are invited to read [this blog post] for background information on this mindset, which could also be called the "CARB" stack.

## Setup

Make sure [you have bower installed](https://bower.io). Then add this to your Gemfile:

    gem 'rg'

Run `bundle` on the command-line. Then setup your angular project:

    rails g rg:bower  # Set up a new .bowerrc file and bower.json file

    bower install angular angularjs-rails-resource --save  # Use bower to install latest angulars

    rails g rg:install --manifests=application.js  # Set up the angular app directory and add to sprocket manifest

Alternatively, you can run all the previous commands via rake:

    rake rg:setup

Now check your layout file if it is including the sprockets manifest correctly (application.js). You also might remove turbolinks.

Then start developing and keep in mind that you have the following generators to create new Angular files for you:

- rg:controller <name>
- rg:app <name>
- rg:model <name>
- rg:view <name>
- rg:directive <name>
- rg:service <name>
- rg:factory <name>
- rg:filter <name>

The generators only generate very basic file content. While this is intended, there might be --options for power users in the future.

## License

(c) 2013 Jan Lelis <janlelis.de>, MIT LICENSE
