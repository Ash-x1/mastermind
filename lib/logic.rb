class Logic
  attr_reader :colors

  def initialize
    @colors = %w[red blue yellow green orange purple pink brown black white gray navy]
  end

  def show_colors
    puts "\nAvailable colors are:"
    p @colors
  end

  def random_combinations
    @colors.sample(4)
  end

  def manual_combinations
    puts "Set the secret combination (4 non-repeated colors):"
    set_combination
  end

  def set_combination
    collection = []
    until collection.length == 4
      print "Enter color ##{collection.length + 1}: "
      input = gets.chomp.downcase
      
      if !@colors.include?(input)
        puts "Error: Please choose a color from the available list."
      elsif collection.include?(input)
        puts "Error: You cannot repeat the same color."
      else
        collection << input
      end
    end
    collection
  end

  def player_guess
    puts "\nYour turn to guess!"
    set_combination
  end

  def check_answer(secret, guess)
    correct_place = 0
    wrong_place = 0
    
    guess.each_with_index do |color, index|
      if color == secret[index]
        correct_place += 1
      elsif secret.include?(color)
        wrong_place += 1
      end
    end

    if correct_place == 4
      puts "CONGRATULATIONS!!! You have won the 'Mastermind' game!"
      return true
    else
      puts "Feedback:"
      puts "- Correct color & correct spot: #{correct_place}"
      puts "- Correct color but wrong spot: #{wrong_place}"
      return false
    end
  end
end
