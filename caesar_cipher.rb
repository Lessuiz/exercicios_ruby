def caesar_cipher(string, shift)
  # Alphabet letters split into an array
  alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
  # String passed into the method is split into an array
  array_of_letters = string.split("")
  # Create an empty array that will hold the new letters
  new_letters = []
  for letter in array_of_letters do
    # If the letter variable is not an actual letter it will just be pushed into the array
    unless ('a'..'z').include?(letter) || ('A'..'Z').include?(letter)
      new_letters.push(letter)
      next
    end
    downcase_letter = letter.downcase
    index = alphabet.find_index(downcase_letter)
    new_index = index - shift
    # If the new index is not bigger than 0 it will be added to 26 until it is
    until new_index > 0 do
      new_index += 26
    end
    # Same if it is bigger than 26, but in this case it will be subtracted
    until new_index < 26 do
      new_index -= 26
    end
    # Push the letter with the correct case to the letters array
    if ('a'..'z').include?(letter)
      new_letters.push(alphabet[new_index])
      next
    elsif ('A'..'Z').include?(letter)
      new_letters.push(alphabet[new_index].upcase)
      next
    end
  end
  # Join the letters into an array
  new_phrase = new_letters.join("")
  # Return the phrase
  new_phrase
end

puts "Insert the phrase to encrypt:"
phrase = gets.chomp
puts "Insert the shift value:"
shift_val = gets.chomp.to_i
puts caesar_cipher(phrase, shift_val)
