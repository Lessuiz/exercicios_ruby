def substrings(string, dictionary)
  substrings = {}
  for word in dictionary do
    if string.include?(word)
      substrings[word] = string.scan(/(?=#{word})/).count
    end
  end
  substrings
end

puts substrings("Howdy partner, sit down! How's it going?",["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])

