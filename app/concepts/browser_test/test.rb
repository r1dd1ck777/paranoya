require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

class BrowserTest::Test
  extend Capybara::DSL

  class << self
    def page
      Capybara.current_session
    end

    def call
      setup
      visit 'http://elementalselenium.com/tips/46-headless-ghostdriver'
      p Capybara.drivers
      p execute_script "return 1 + 2;"
      p title
      teardown
    end

    def setup
      # Capybara.register_driver :selenium do |app|
      #   Capybara::Selenium::Driver.new(
      #       app,
      #       browser: :phantomjs,
      #       desired_capabilities: Selenium::WebDriver::Remote::Capabilities.phantomjs
      #   )
      # end
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app)
      end
      Capybara.drivers[:rack_test] = nil
      Capybara.drivers[:selenium] = nil
      Capybara.javascript_driver = :poltergeist
      Capybara.current_driver = Capybara.javascript_driver
    end

    def teardown
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end