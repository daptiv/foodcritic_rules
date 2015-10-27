# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Shawn Neal"]
  gem.email         = ["sneal@daptiv.com"]
  gem.license       = 'APACHE2'
  gem.description   = %q{Daptiv Foodcritic 2.2 and greater rules for Chef 11 and greater}
  gem.summary       = %q{Daptiv Foodcritic rules for Chef}
  gem.homepage      = "https://github.com/daptiv/foodcritic_rules"
  gem.files         = ["lib/foodcritic/rules/rules.rb"]
  gem.name          = "daptiv-foodcritic-rules"
  gem.require_paths = ["lib"]
  gem.version       = '1.0.0'

  gem.add_runtime_dependency "foodcritic", ">= 2.2.0"

  gem.add_development_dependency "rake"
end
