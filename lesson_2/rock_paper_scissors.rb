VALID_CHOICES = %w(Rock Paper Scissors Lizard Spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Rules:
# Rock beats Lizard - DONE
# Rock beats Scissors - DONE
# Paper beats Rock # DONE
# Paper beats Spock - DONE
# Scissors beats Paper - DONE
# Scissors beats Lizard - DONE
# Lizard beats Spock - DONE
# Lizard beats Paper - DONE
# Spock beats Scissors - DONE
# Spock beats Rock - DONE
# extract win circumstances to array? 

def win?(first_player, second_player)
  (first_player == 'Rock' && (second_player == 'Scissors' ||
    second_player == 'Lizard')) ||
    (first_player == 'Paper' && (second_player == 'Rock' || second_player == 'Spock')) ||
    (first_player == 'Scissors' && (second_player == 'Paper' || second_player == 'Lizard')) ||
    (first_player == 'Lizard' && (second_player == 'Spock' || second_player == 'Paper')) ||
    (first_player == 'Spock' && (second_player == 'Scissors' || second_player == 'Rock')) 
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.capitalize

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer}")

  display_results(choice, computer)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
