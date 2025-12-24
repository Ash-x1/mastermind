#!/usr/bin/env ruby

# the game primary tools that will be used for the the game
class Logic
  def colors_list
    colors = %w[red blue yellow green
                orange purple pink brown
                black white gray navy]
    p colors
  end

  def random_combinations
    col = colors_list.sample(4)
    p col
  end

  def player_guess
    guess = [gets]
    i = 0
    while i 
    user_input = gets.chomp
    p guess
  end
end

log = Logic.new
# log.colors_list
log.random_combinations
log.player_guess
