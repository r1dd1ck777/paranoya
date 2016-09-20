class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]

  def is_admin?
    admin?
    # self.email && ENV['ADMIN_EMAILS'].to_s.include?(self.email)
  end
end
