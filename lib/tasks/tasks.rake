task :browser_test => :environment do
  BrowserTest::Test.()
end

task :browser_test_selenium => :environment do
  BrowserTest::TestSelenium.()
end

task :browser_test_cucumber => :environment do
  BrowserTest::TestCucumber.()
end