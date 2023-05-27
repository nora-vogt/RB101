require 'pry'

VALID_CHOICES = %w(Rock Paper Scissors Lizard Spock)
LOSES_TO_ROCK = %w(Scissors Lizard)
LOSES_TO_PAPER = %w(Rock Spock)
LOSES_TO_SCISSORS = %w(Paper Lizard)
LOSES_TO_LIZARD = %w(Spock Paper)
LOSES_TO_SPOCK = %w(Scissors Rock)

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

def win?(first_player, second_player)
  (first_player == 'Rock' && LOSES_TO_ROCK.include?(second_player)) ||
    (first_player == 'Paper' && LOSES_TO_PAPER.include?(second_player)) ||
    (first_player == 'Scissors' && LOSES_TO_SCISSORS.include?(second_player)) ||
    (first_player == 'Lizard' && LOSES_TO_LIZARD.include?(second_player)) ||
    (first_player == 'Spock' && LOSES_TO_SPOCK.include?(second_player))
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
