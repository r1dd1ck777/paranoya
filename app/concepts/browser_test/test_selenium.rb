require 'capybara/poltergeist'

class BrowserTest::TestSelenium
  class << self
    def call
      setup
      # @driver.get 'http://elementalselenium.com/tips/46-headless-ghostdriver'
      @driver.get 'http://localhost:3000/js?js=document.write(%27111%27)'
      @driver.get 'http://www.personalnovel.co.uk/'
      p @driver.title
      p @driver.execute_script "return 1 + 2;"
      @driver.save_screenshot("./tmp/browser_test_selenium.png")
      teardown
    end

    def setup
      @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:8001',
                                        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.phantomjs

    end

    def teardown
      @driver.quit
    end
  end
end