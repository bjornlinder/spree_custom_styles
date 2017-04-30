lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_custom_styles/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_custom_styles'
  s.version     = SpreeCustomStyles.version
  s.summary     = 'Adds CustomStyle model to Spree'
  s.description = s.summary
  s.required_ruby_version = '>= 2.1.0'

  s.author   = 'Bjorn Linder'
  s.email    = 'bjornishungry@gmail.com'
  s.homepage = 'https://github.com/bjornlinder/spree_custom_styles'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'spree_core', '>= 3.1.0', '< 4.0'

  s.add_development_dependency 'pry-rails'
  # s.add_development_dependency 'spree_sample',     '~> 1.2.0'
  s.add_development_dependency 'dummier',          '~> 0.3'
  s.add_development_dependency 'shoulda',          '~> 3.0'
  s.add_development_dependency 'factory_girl',     '~> 2.3'
  s.add_development_dependency 'cucumber-rails',   '~> 1.2'
  s.add_development_dependency 'database_cleaner', '~> 0.6'
  s.add_development_dependency 'sqlite3',          '~> 1.3'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'launchy'
end
