#!/usr/bin/env ruby
require_relative 'lib/logic'

game = Logic.new
game.show_colors

puts "\nDo you want (1) Automatically generated colors or (2) Manual setup?"
choice = gets.chomp

secret_code = if choice == '2'
                game.manual_combinations
              else
                game.random_combinations
              end

win = false
1.upto(12) do |round|
  puts "\n--- Round #{round} of 12 ---"
  guess = game.player_guess
  
  if game.check_answer(secret_code, guess)
    win = true
    break
  end
end

unless win
  puts "\nGAME OVER! You've run out of rounds."
  puts "The correct combination was: #{secret_code}"
end
