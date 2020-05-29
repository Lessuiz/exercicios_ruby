puts "Insira um número:"
a = gets.chomp.to_i

puts "O número é 3." if a == 3
puts "O número é 4." if a == 4
puts "O número não é nem 3, nem 4" unless a == 3 || a == 4
