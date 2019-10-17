lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_custom_styles/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_custom_styles'
  s.version     = SpreeCustomStyles.version
  s.summary     = 'Adds CustomStyle model to Spree'
  s.description = s.summary
  s.required_ruby_version = '>= 2.2.0'

  s.author   = 'Bjorn Linder'
  s.email    = 'bjornishungry@gmail.com'
  s.homepage = 'https://github.com/bjornlinder/spree_custom_styles'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  # s.add_development_dependency 'sassc-rails'
  s.add_development_dependency 'sass-rails'
  s.add_runtime_dependency 'spree_core', '>= 3.2.0', '< 4.0'
  s.add_dependency 'spree_backend', '>= 3.2.0', '< 4.0'
  s.add_dependency 'spree_frontend', '>= 3.2.0', '< 4.0'

  s.add_development_dependency 'database_cleaner', '~> 1.6.1'

  s.add_development_dependency 'shoulda',          '~> 3.0'

  s.add_development_dependency 'launchy'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'capybara-user_agent'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-screenshot'
  # s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_bot_rails'
  # s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'phantomjs'
  # s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-remote'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'pry-doc'

  # s.add_development_dependency 'rubocop'
  s.add_development_dependency 'puma' # https://github.com/rspec/rspec-rails/issues/1882
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'guard-rspec'
  # s.add_development_dependency 'sprockets-rails'
end
