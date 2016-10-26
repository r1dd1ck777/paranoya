class UrlTest < ApplicationRecord
  belongs_to :project
  has_many :url_test_results, dependent: :destroy
  # through
  has_many :users, through: :project

  validates_presence_of :project, :url, :expected_response_code
end
