class Url::IsValid
  def self.call url
    if !url.include?('http://') && !url.include?('https://')
      return false
    end

    result = true
    begin
      open(url)
    rescue
      result = false
    end

    result
  end
end