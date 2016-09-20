class StatusCheck::CheckAll
  def self.call
    StatusCheck.find_each do |status_check|
      # @var status_check StatusCheck
      StatusCheck::Check.(status_check)
    end
  end
end