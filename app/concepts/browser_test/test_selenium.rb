require 'capybara/poltergeist'

class BrowserTest::TestSelenium
  class << self
    def call
      setup
      @driver.get 'http://elementalselenium.com/tips/46-headless-ghostdriver'
      p @driver.title
      @driver.save_screenshot("./screenshot.png")
      teardown
    end

    def setup
      @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:8001',
                                        desired_capabilities: {
                                            browserName: "phantomjs",
                                            platform: "LINUX"
                                        }

    end

    def teardown
      @driver.quit
    end
  end
end