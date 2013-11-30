# -*- encoding: utf-8 -*-

require File.expand_path('../lib/rg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rg"
  gem.version       = Rg::VERSION
  gem.summary       = 'Regular: Rails + Angular (rg)'
  gem.license       = "MIT"
  gem.authors       = ["Jan Lelis"]
  gem.email         = "mail@janlelis.de"
  gem.homepage      = "https://github.com/janlelis/rg"

  gem.files         = Dir['{**/}{.*,*}'].select { |path| File.file?(path) }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'

  gem.add_dependency 'rails'
  gem.add_dependency 'coffee-rails'
  gem.add_dependency 'sprockets-bower'
  gem.add_dependency 'rake'
end
