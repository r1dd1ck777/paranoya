require 'cucumber'

class BrowserTest::TestCucumber
  class << self
    def call
      setup
      Cucumber::Runtime.new(configuration).run!
      teardown
    end

    def configuration
      result = Cucumber::Configuration.new({paths: ["#{Rails.root}/features"], formats: [['pretty', STDOUT]]})
      result
    end

    def setup
      Cucumber::Configuration.class_eval do
        def paths
          ["#{Rails.root}/features"]
        end
      end
    end

    def teardown
    end
  end
end

