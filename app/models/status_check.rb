class StatusCheck < ApplicationRecord
  belongs_to :project
  has_many :status_check_logs, dependent: :destroy
end
