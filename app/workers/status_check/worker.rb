class StatusCheck::Worker
  include Sidekiq::Worker

  def perform
    StatusCheck::CheckAll.()
  end
end