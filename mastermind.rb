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

  def valid_answer
    loop do
      p ' Please insert your guess: '
      user_input = gets.chomp.downcase
      return user_input if colors_list.include?(user_input)

      p 'Please enter a valid answer from the list of colors above'
    end
  end

  def player_guess
    guesses = []

    until guesses.length == 4
      guess = valid_answer

      if guesses.include?(guess)
        puts 'You have duplicated answers, no need to do that to avoid wasting your precious guesses'
      else
        guesses << guess
      end
    end

    p guesses
    guesses
  end

  def check_answer(secret, guess)
    if secret == guess
      p "CONGRATULATIONS!!! You have won the 'Mastermind' game"
    else
      p 'Sadly, you have lost but you can try again if you want'
    end
  end
end

log = Logic.new

secret = log.random_combinations
guess  = log.player_guess
log.check_answer(secret, guess)
