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
      # visit 'http://elementalselenium.com/tips/46-headless-ghostdriver'
      # visit 'http://localhost:3000/js?js=document.write(%27111%27)'
      visit 'http://www.personalnovel.co.uk/customize?book=676'
      fill_in 'vars-Heroine_CN', with: 'Ruslan'
      p title
      save_screenshot("./tmp/browser_test.png")
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
      Capybara.run_server = false
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, {
                                                 debug:     true,  # turn on poltergeist debug mode
                                                 js_errors: true,  # turn on javascript errors on page
                                                 timeout:   10000,
                                                 phantomjs_options: ['--load-images=yes', '--ignore-ssl-errors=yes', '--ssl-protocol=any']
                                             })

      end
      Capybara.drivers[:rack_test] = nil
      Capybara.drivers[:selenium] = nil
      Capybara.default_driver = :poltergeist
      Capybara.javascript_driver = :poltergeist
      Capybara.current_driver = Capybara.javascript_driver
    end

    def teardown
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end