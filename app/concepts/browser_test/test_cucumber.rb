require 'cucumber'

class BrowserTest::TestCucumber
  class << self
    def call browser_test = nil
      setup
      file_name = "#{SecureRandom.uuid}.feature"
      dir = tmp_dir __default_company_id
      file = [dir, file_name].join '/'
      write_file file, __default_content
      Cucumber::Runtime.new(configuration(dir)).run!
      File.delete file

      teardown
    end

    protected

    def __default_company_id
      1
    end

    def __default_content
      <<TEXT
@javascript
Feature: hello world

  Scenario: Show hello world
    Then I say hello my world!

TEXT
    end

    def write_file file, content
      dir = file.split('/')[0..-2].join('/')
      p file
      p "mkdir -p #{dir}"
      system "mkdir -p #{dir}"

      File.write file, content
    end

    def configuration dir
      result = Cucumber::Configuration.new({paths: [dir], formats: [['pretty', STDOUT]]})
      result
    end

    def setup
    end

    def tmp_dir company_id
      time = Time.now
      "#{Rails.root}/tmp/features/#{time.year}/#{time.month}/#{time.day}/#{company_id}"
    end

    def teardown
    end
  end
end

