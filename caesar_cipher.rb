require 'pry'

def caesar_cipher(string, shift)
  alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
  array_of_letters = string.split("")
  new_letters = []
  for letter in array_of_letters do
    unless ('a'..'z').include?(letter) || ('A'..'Z').include?(letter)
      new_letters.push(letter)
      next
    end
    downcase_letter = letter.downcase
    index = alphabet.find_index(downcase_letter)
    new_index = index - shift
    until new_index > 0 do
      new_index += 26
    end
    until new_index < 26 do
      new_index -= 26
    end
    if ('a'..'z').include?(letter)
      new_letters.push(alphabet[new_index])
      next
    elsif ('A'..'Z').include?(letter)
      new_letters.push(alphabet[new_index].upcase)
      next
    end
  end
  new_phrase = new_letters.join("")
  new_phrase
end

puts "Insert the phrase to encrypt:"
phrase = gets.chomp
puts "Insert the shift value:"
shift_val = gets.chomp.to_i
puts caesar_cipher(phrase, shift_val)
