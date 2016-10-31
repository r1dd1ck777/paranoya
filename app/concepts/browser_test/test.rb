require 'capybara'
require 'capybara/dsl'

class BrowserTest::Test
  extend Capybara::DSL

  class << self
    def page
      Capybara.current_session
    end

    def call
      setup
      visit 'http://elementalselenium.com/tips/46-headless-ghostdriver'
      p execute_script "{}"
      p title
      teardown
    end

    def setup
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(
            app,
            browser: :phantomjs,
            desired_capabilities: Selenium::WebDriver::Remote::Capabilities.phantomjs
        )
      end
      Capybara.current_driver = Capybara.javascript_driver
    end

    def teardown
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end