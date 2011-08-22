
ENV["APP_ENV"] ||= "test"

require "./application"

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end


