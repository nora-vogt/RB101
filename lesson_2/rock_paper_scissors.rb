require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('rps_messages.yml')
VALID_CHOICES = %w(rock paper scissors lizard spock)
ABBREVIATIONS = %w[r p sc l sp]
LOSES_TO_ROCK = %w(scissors lizard)
LOSES_TO_PAPER = %w(rock spock)
LOSES_TO_SCISSORS = %w(paper lizard)
LOSES_TO_LIZARD = %w(spock paper)
LOSES_TO_SPOCK = %w(scissors rock)

def message(key)
  MESSAGES[key]
end

def prompt(key)
  puts("=> #{message(key)}")
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
    prompt('player_won')
  elsif win?(computer, player)
    prompt('computer_won')
  else
    prompt('tie')
  end
end

prompt('welcome')
number_of_matches = 1
loop do
  choice = ''
  loop do
    puts format(message('match_number'), number: number_of_matches)
    prompt('make_choice')
    choice = gets.chomp.downcase
    
    if VALID_CHOICES.include?(choice)
      break
    elsif ABBREVIATIONS.include?(choice)
      choice = VALID_CHOICES.select { |str| str.start_with?(choice) }.join
      break
    else
      prompt('invalid_choice')
    end
  end

  computer = VALID_CHOICES.sample

  puts format(message('display_choices'), player_choice: choice.capitalize, computer_choice: computer.capitalize)

  display_results(choice, computer)

  number_of_matches += 1

  prompt('again?')
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt('goodbye')
