class String
  def trim char
    gsub(/^#{char}|#{char}$/, "")
  end

  def trim! char
    gsub!(/^#{char}|#{char}$/, "")
  end
end