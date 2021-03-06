# == Schema Information
#
# Table name: user_projects
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
end
