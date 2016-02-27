$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'multilang_field/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'multilang_field'
  s.version     = MultilangField::VERSION
  s.authors     = ['Anton Holovko']
  s.email       = ['anton.holovko.b@gmail.com']
  s.homepage    = 'https://github.com/kelevro/multilang_field'
  s.summary     = 'MultilangField'
  s.description = 'Multilang form field wrapper'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*'] + Dir['vendor/**/*'] + Dir['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.require_path = ['lib']

  s.add_dependency 'rails', '~> 4.2.5.1'
  s.add_dependency 'globalize', '~> 5.0.0'
  s.add_dependency 'globalize-accessors'
  s.add_dependency 'slim'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'simple_form'


  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'

end
