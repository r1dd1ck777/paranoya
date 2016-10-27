class Project < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :user_projects

  validates_presence_of :name, :url, :users
  validate :url_is_valid

  protected

  def url_is_valid
    errors.add :url, I18n.t('errors.messages.invalid') unless Url::IsValid.(url)
  end
end
