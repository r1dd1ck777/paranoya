# == Schema Information
#
# Table name: log_logs
#
#  id         :integer          not null, primary key
#  project_id :integer
#  message    :string
#  data       :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Log::Log < ApplicationRecord
  belongs_to :project
end
