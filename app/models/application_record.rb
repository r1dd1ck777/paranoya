class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :recent, Proc.new { |count|
                 count ||= 10
                 order('id desc').limit(count)
               }

  def to_s
    to_label
  end

  def to_label
    [:name, :email, :id].each do |col|
      return self.send col if self.respond_to? col
    end
  end
end
