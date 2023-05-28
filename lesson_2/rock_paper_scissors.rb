require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)
ABBREVIATIONS = %w[r p sc l sp]
LOSES_TO_ROCK = %w(scissors lizard)
LOSES_TO_PAPER = %w(rock spock)
LOSES_TO_SCISSORS = %w(paper lizard)
LOSES_TO_LIZARD = %w(spock paper)
LOSES_TO_SPOCK = %w(scissors rock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Rules:
# rock beats lizard - DONE
# rock beats scissors - DONE
# paper beats rock # DONE
# paper beats spock - DONE
# scissors beats paper - DONE
# scissors beats lizard - DONE
# lizard beats spock - DONE
# lizard beats paper - DONE
# spock beats scissors - DONE
# spock beats rock - DONE

def win?(first_player, second_player)
  (first_player == 'rock' && LOSES_TO_ROCK.include?(second_player)) ||
    (first_player == 'paper' && LOSES_TO_PAPER.include?(second_player)) ||
    (first_player == 'scissors' && LOSES_TO_SCISSORS.include?(second_player)) ||
    (first_player == 'lizard' && LOSES_TO_LIZARD.include?(second_player)) ||
    (first_player == 'spock' && LOSES_TO_SPOCK.include?(second_player))
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

# Allow use to just type first letter: (or first two letters for spock or scissors?)
# check if the first letter or two letters of any string in VALID_CHOICES matches the entered character?

loop do
  choice = ''
  loop do
    # make this a longer string, with map? to display, "Rock" (from array) (or enter 'r')
    prompt("Choose one: #{VALID_CHOICES.map(&:capitalize).join(', ')}")
    choice = gets.chomp.downcase
    
    if VALID_CHOICES.include?(choice)
      break
    elsif ABBREVIATIONS.include?(choice)
      choice = VALID_CHOICES.select { |str| str.start_with?(choice) }.join
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALID_CHOICES.sample

  prompt("You chose: #{choice.capitalize}; Computer chose: #{computer.capitalize}")

  display_results(choice, computer)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
