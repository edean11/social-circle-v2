require 'capybara/rspec'
Capybara.match = :prefer_exact

require 'capybara/poltergeist'
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
