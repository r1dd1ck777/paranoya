class StatusCheckLog < ApplicationRecord
  belongs_to :status_check
  serialize :response, JSON

  after_create :send_notification

  protected

  def send_notification
    StatusCheckLog::SendNotification.(self)
    return true
  end
end
