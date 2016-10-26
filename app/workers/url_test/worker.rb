class UrlTest::Worker
  include Sidekiq::Worker

  def perform
    UrlTest::TestAll.()
  end
end