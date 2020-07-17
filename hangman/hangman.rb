require 'pry'
require 'json'

class Game
  attr_accessor :word, :guessed_letters, :mistakes, :used_letters

  WORDLIST = File.open("5desk.txt", "r").select { |word| word.chomp.length > 4 }

  def initialize
    @word = WORDLIST.sample.chomp
    @mistakes = 0
    @guessed_letters = []
    @used_letters = []
  end

  def show_board
    puts File.read("#{@mistakes}-mistakes.txt")
    display_letters
  end

  def display_letters
    letters = "    "
    @word.split("").each do |letter|
      if @guessed_letters.include?(letter)
        letters << "#{letter} "
      else
        letters << "_ "
      end
    end
    puts letters
    puts @used_letters.join(", ")
  end

  def save_game
    File.open("save.json", "w") { |file|
      file.puts JSON.dump ({
          :word => @word,
          :mistakes => @mistakes,
          :guessed_letters => @guessed_letters,
          :used_letters => @used_letters
        })
    }
  end

  def self.load_game
    data = JSON.load File.read "save.json"
    $game = self.new
    $game.word = data["word"]
    $game.mistakes = data["mistakes"]
    $game.guessed_letters = data["guessed_letters"]
    $game.used_letters = data["used_letters"]
  end

  def did_i_win?
    if @guessed_letters.length == @word.length
      true
    else
      false
    end
  end

  def play_game
    self.show_board
    puts "Try to guess a letter"
    guess = gets.chomp.downcase
    if guess.length != 1
      puts "The input must be of exactly one character."
      return
    elsif (guess =~ /\w/).nil?
      puts "You must input a letter from the alphabet."
      return
    elsif @word.include? guess
      @guessed_letters.push(guess)
      @used_letters.push(guess)
    else
      @mistakes += 1
      @used_letters.push(guess)
      self.show_board
      puts @word
    end
  end

  def round
    if File.exists? "save.json"
      puts "Do you want to load?"
      choice = gets.chomp.downcase
      if choice == "yes"
        Game.load_game
      end
    end
    until @mistakes == 6 || did_i_win? do
      puts "Do you want to save?"
      choice = gets.chomp.downcase
      if choice == "yes"
        self.save_game
      end
      self.play_game
    end
    if did_i_win?
      puts "You won the game!"
    else
      puts "You lose ;("
    end

  end
end

$game = Game.new
$game.round
