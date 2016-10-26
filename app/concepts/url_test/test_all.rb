class UrlTest::TestAll
  def self.call
    UrlTest.find_each do |ut|
      # @var ut UrlTest
      UrlTest::Test.(ut)
    end
  end
end