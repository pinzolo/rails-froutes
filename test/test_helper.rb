require 'coveralls'
require 'simplecov'
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/test/'
  add_filter '/bundle/'
end

require 'rails'
if Rails::VERSION::MAJOR == 4
  require 'active_support/testing/autorun'
else
  require 'minitest'
end
require 'mocha/setup'
require 'rails/froutes'

def enable_fill_name
  ENV['FILL_NAME'] = 'yes'
end
