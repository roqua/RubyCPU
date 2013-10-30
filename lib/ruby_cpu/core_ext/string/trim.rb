class String
  def trim char
    self.gsub(/^#{char}|#{char}$/, "")
  end
  
  def trim! char
    self.gsub!(/^#{char}|#{char}$/, "")
  end
end