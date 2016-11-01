require 'cucumber'

class BrowserTest::TestCucumber
  class << self
    def call
      setup
      Cucumber::Runtime.new(configuration).run!
      teardown
    end

    def configuration
      result = Cucumber::Cli::Configuration.new(STDOUT, STDERR).tap do |configuration|
        Cucumber.logger = configuration.log
      end

      result = Cucumber::Configuration.new(result)
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

