class UrlTestResult < ApplicationRecord
  serialize :response_headers, JSON
  belongs_to :url_test
  # through
  has_many :users, through: :url_test

  after_create :send_notification

  protected

  def send_notification
    UrlTestResult::SendNotification.(self)
    return true
  end
end
