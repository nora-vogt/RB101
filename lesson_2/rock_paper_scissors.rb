require 'yaml'

MESSAGES = YAML.load_file('rps_messages.yml')

VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ABBREVIATIONS = %w[r p sc sp l]
WIN_COMBINATIONS = { 'rock' => ['scissors', 'lizard'],
                     'paper' => ['rock', 'spock'],
                     'scissors' => ['paper', 'lizard'],
                     'lizard' => ['spock', 'paper'],
                     'spock' => ['scissors', 'rock'] }
WINNING_SCORE = 3

def message(key)
  MESSAGES[key]
end

def divider
  puts MESSAGES['divider']
end

def spacer
  puts MESSAGES['spacer']
end

def format_message(key, data_to_interpolate = {})
  format(message(key), data_to_interpolate)
end

def print_formatted_message(key, data_to_interpolate = {})
  puts "=> #{format_message(key, data_to_interpolate)}"
end

def prompt(key)
  puts("=> #{message(key)}")
end

def start_game?
  prompt('start_game')
  loop do
    ready = gets.chomp.downcase
    break if ready == 'y'
    spacer
    prompt('invalid_game_start')
  end
end

def start_next_round?(round_number)
  print_formatted_message('start_round', number: round_number)
  loop do
    ready = gets.chomp.downcase
    break if ready == 'y'
    spacer
    prompt('invalid_round_start')
  end
end

def get_choice
  loop do
    prompt('make_choice')
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      return choice
    elsif VALID_ABBREVIATIONS.include?(choice)
      return VALID_CHOICES.select { |str| str.start_with?(choice) }.join
    else
      spacer
      prompt('invalid_choice')
    end
  end
end

def win_round?(first_player, second_player)
  WIN_COMBINATIONS[first_player].include?(second_player)
end

def print_results(player, computer)
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
    score + 1
  else
    score
  end
end

def game_won?(player_score, computer_score)
  player_score == WINNING_SCORE || computer_score == WINNING_SCORE
end

def print_grand_winner(player_score, computer_score)
  if player_score == WINNING_SCORE
    prompt('player_grand_winner')
  elsif computer_score == WINNING_SCORE
    prompt('computer_grand_winner')
  end
end

def play_again?
  prompt('again?')
  answer = gets.chomp.downcase
  answer == 'y'
end

system('clear')
divider
prompt('welcome')
divider

spacer
prompt('intro')
spacer

start_game?
system('clear')

loop do
number_of_rounds = 1
player_score = 0
computer_score = 0

  loop do
    print_formatted_message('round_number', number: number_of_rounds)
    spacer

    choice = get_choice
    computer = VALID_CHOICES.sample

    spacer
    print_formatted_message('display_choices',
                            player_choice: choice.capitalize,
                            computer_choice: computer.capitalize)

    player_score = set_score(choice, computer, player_score)
    computer_score = set_score(computer, choice, computer_score)

    print_results(choice, computer)
    spacer
    print_formatted_message('score',
                            player_points: player_score,
                            computer_points: computer_score)
    spacer

    number_of_rounds += 1

    break if game_won?(player_score, computer_score)

    start_next_round?(number_of_rounds)
    system('clear')
  end

  prompt('game_over')
  spacer
  divider

  print_grand_winner(player_score, computer_score)
  divider
  spacer

  break unless play_again?
  system('clear')
end

spacer
prompt('goodbye')
