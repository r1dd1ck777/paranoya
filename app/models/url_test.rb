# == Schema Information
#
# Table name: url_tests
#
#  id                     :integer          not null, primary key
#  project_id             :integer
#  url                    :string
#  expected_response_code :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class UrlTest < ApplicationRecord
  belongs_to :project
  has_many :url_test_results, dependent: :destroy
  # through
  has_many :users, through: :project

  after_initialize :init_defaults
  validates_presence_of :project, :url, :expected_response_code
  validate :url_is_valid

  protected

  def url_is_valid
    errors.add :url, I18n.t('errors.messages.invalid') unless Url::IsValid.(url)
  end

  def init_defaults
    self.expected_response_code ||= 200
  end
end
