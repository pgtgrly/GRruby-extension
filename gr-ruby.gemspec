lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grruby/version'

Gem::Specification.new do |s|
  s.name = 'gr-ruby'
  s.version     = Rubyplot::VERSION
  s.date        = '2018-05-13'
  s.email       = 'pranavgarg@gmail.com'
  s.summary     = 'A Plotting gem for Ruby.'
  s.description = 'An extension for the GR library using the same interface as Rubyplot library which produces publication quality figures in a variety of hardcopy formats and interactive environments across platforms.'
  s.authors     = ['Pranav Garg']
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.license     = 'MIT license'
  s.homepage    = 'https://github.com/pgtgrly/GRruby-extension'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_dependency 'rmagick',  '>= 2.13.4'
  s.add_development_dependency 'gtk3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-autotest'
  s.add_development_dependency 'ZenTest'
  s.extensions = ['ext/grruby/extconf.rb']
end
