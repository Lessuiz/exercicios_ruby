require 'pry'

class Computer
  attr_accessor :array, :numbers

  def initialize
    @array = []
    @round = 0
    @numbers = [1, 2, 3, 4, 5, 6]
    while @array.length < 4 do
      a = @numbers.sample
      @array.push(a)
      @numbers.delete(a)
    end
  end

  def play_round
    selected_numbers = []
    puts "Round #{@round+1}"
    while selected_numbers.length < 4 do
      puts "Select a number from 1 to 6"
      puts selected_numbers.length.to_s + " numbers selected"
      number = gets.chomp.to_i
      selected_numbers.push(number)
      if number > 6 || number < 1
        puts "The number must be between 1 and 6"
        return play_round
      end
    end
    @round += 1
    check_numbers(selected_numbers)
  end

  def check_numbers(array)
    result = []
    array.each_with_index do |number, index|
      if array[index] == @array[index]
        result.push("o")
      elsif @array.include?(number)
        result.push("x")
      end
    end
    puts result.shuffle
  end

  def play_game
    while @round < 12 do
      play_round
    end
    guess_numbers = []
    puts "Now, try to guess the sequence"
    while guess_numbers.length < 4 do
      puts guess_numbers.length.to_s + " numbers selected"
      number = gets.chomp.to_i
      guess_numbers.push(number)
      if number > 6 || number < 1
        puts "The number must be between 1 and 6"
        return play_game
      end
    end
    if guess_numbers == @array
        puts "You won"
    else
        puts "You lose"
        puts @array
    end
  end
end

game = Computer.new
game.play_game
