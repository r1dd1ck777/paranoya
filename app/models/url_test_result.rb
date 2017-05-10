# == Schema Information
#
# Table name: url_test_results
#
#  id                     :integer          not null, primary key
#  response_code          :integer
#  response_headers       :text
#  is_fail                :boolean
#  url_test_id            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  expected_response_code :integer
#  url                    :string
#

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
