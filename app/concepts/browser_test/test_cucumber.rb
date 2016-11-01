require 'cucumber'

class BrowserTest::TestCucumber
  class << self
    def call
      setup
      Cucumber::Runtime.new(paths: ['/home/leonid/d/16/paranoya/paranoya/features']).run!
      teardown
    end

    def setup
    end

    def teardown
    end
  end
end