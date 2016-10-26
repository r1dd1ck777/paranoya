class Project < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :user_projects

  validates_presence_of :name, :url, :users
end
