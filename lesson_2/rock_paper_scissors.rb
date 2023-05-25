VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Rules:
# Rock beats lizard - DONE
# Rock beats scissors - DONE
# Paper beats rock # DONE
# Paper beats Spock - DONE
# Scissors beats paper - DONE
# Scissors beats lizard - DONE
# Lizard beats Spock - DONE
# Lizard beats paper - DONE
# Spock beats scissors - DONE
# Spock beats rock - DONE
# extract win circumstances to array? 

def win?(first_player, second_player)
  (first_player == 'rock' && (second_player == 'scissors' ||
    second_player == 'lizard')) ||
    (first_player == 'paper' && (second_player == 'rock' || second_player == 'spock')) ||
    (first_player == 'scissors' && (second_player == 'paper' || second_player == 'lizard')) ||
    (first_player == 'lizard' && (second_player == 'spock' || second_player == 'paper')) ||
    (first_player == 'spock' && (second_player == 'scissors' || second_player == 'rock')) 
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
    choice = gets.chomp.downcase

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
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
