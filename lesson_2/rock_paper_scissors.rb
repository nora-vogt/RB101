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

def divider
  puts MESSAGES['divider']
end

def spacer
  puts MESSAGES['spacer']
end

def prompt(key)
  puts("=> #{message(key)}")
end

def get_choice
  loop do
    prompt('make_choice')
    choice = gets.chomp.downcase
    
    if VALID_CHOICES.include?(choice)
      return choice
    elsif ABBREVIATIONS.include?(choice)
      return VALID_CHOICES.select { |str| str.start_with?(choice) }.join
    else
      prompt('invalid_choice')
    end
  end
end

def win_round?(first_player, second_player)
  (first_player == 'rock' && LOSES_TO_ROCK.include?(second_player)) ||
    (first_player == 'paper' && LOSES_TO_PAPER.include?(second_player)) ||
    (first_player == 'scissors' && LOSES_TO_SCISSORS.include?(second_player)) ||
    (first_player == 'lizard' && LOSES_TO_LIZARD.include?(second_player)) ||
    (first_player == 'spock' && LOSES_TO_SPOCK.include?(second_player))
end

def display_results(player, computer)
  if win_round?(player, computer)
    prompt('player_won')
  elsif win_round?(computer, player)
    prompt('computer_won')
  else
    prompt('tie')
  end
end

def set_score(first_player, second_player, score)
  if win_round?(first_player, second_player)
    score += 1
  else
    score
  end
end

def game_won?(player_score, computer_score)
  player_score == 3 || computer_score == 3
end

def display_grand_winner(player_score, computer_score)
  if player_score == 3
    prompt('player_grand_winner')
  elsif computer_score == 3
    prompt('computer_grand_winner')
  end
end

def play_again?
  prompt('again?')
  answer = gets.chomp.downcase

  answer == 'y'
end

divider
prompt('welcome')
divider
spacer
prompt('intro')
spacer

number_of_rounds = 1
player_score = 0
computer_score = 0
loop do
  puts format(message('match_number'), number: number_of_rounds)

  choice = get_choice
  computer = VALID_CHOICES.sample

  puts format(message('display_choices'), player_choice: choice.capitalize, computer_choice: computer.capitalize)

  player_score = set_score(choice, computer, player_score)
  computer_score = set_score(computer, choice, computer_score)

  display_results(choice, computer)
  puts format(message('score'), player_points: player_score, computer_points: computer_score)

  number_of_rounds += 1

  if game_won?(player_score, computer_score)
    prompt('game_over')
    display_grand_winner(player_score, computer_score)
    break unless play_again?
  else
    next
  end
end

prompt('goodbye')
