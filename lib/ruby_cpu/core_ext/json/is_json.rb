module JSON
  def self.is_json?(text)
    begin
      return false unless text.is_a?(String)
      !!JSON.parse(text)
    rescue JSON::ParserError
      false
    end 
  end
end