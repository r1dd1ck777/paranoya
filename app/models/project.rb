# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :user_projects
  has_many :log_logs, :class_name => 'Log::Log'

  validates_presence_of :name, :url, :users
  validate :url_is_valid

  protected

  def url_is_valid
    errors.add :url, I18n.t('errors.messages.invalid') unless Url::IsValid.(url)
  end
end
