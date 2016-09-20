class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_label
    [:name, :email, :id].each do |col|
      if self.respond_to? col
        return self.send col
      end
    end
  end
end
