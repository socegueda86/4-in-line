require_relative 'help_modules.rb'

class Game
  include CheckForWins
  attr_reader :board, :last_move 

  HASH_LETTER_TO_INDEX = {'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 'F' => 5, 'G' => 6,}

  def initialize()
    @board = create_board()
    @players = []
    @last_move
  end

  def create_board
    (1..6).map  {|x| Array.new(7)}
  end

  def draw_board()
    row_separator = "  +---+---+---+---+---+---+---+"
    @board.reverse.each_with_index do |row, i|
      puts row_separator
      puts "#{i} | #{row[0].nil? ? " " : row[0] } | #{row[1].nil? ? " " : row[1] } | #{row[2].nil? ? " " : row[2] } | #{row[3].nil? ? " " : row[3] } | #{row[4].nil? ? " " : row[4] } | #{row[5].nil? ? " " : row[5] } | #{row[6].nil? ? " " : row[6] } |"
      end
    puts row_separator
    puts "    A   B   C   D   E   F   G  "
  end

  def place_marker(column, marker)
    column = column_letter_to_array_index(column)

    row_position = (0..5).find {|i| @board[i][column].nil?}

    @board[row_position][column] = marker
    @last_move = [row_position, column]
  end

  def column_letter_to_array_index(column) 
    HASH_LETTER_TO_INDEX.fetch(column)
  end


  def user_input_verifier(user_input)
    return false if user_input.length > 1

    user_input = user_input.upcase
    return false if user_input.match(/[A-G]/).nil?

    true
  end

  def column_full?(user_input)
    (0...6).any? { |i| @board[5 - i][column_letter_to_array_index(user_input)].nil? }
  end

  def win?(users_mark)
    return true if diagonal_bottom_left_to_top_right_win?(users_mark)
    return true if diagonal_top_left_to_bottom_right_win?(users_mark)
    return true if vertical_win?(users_mark)
    return true if horizontal_win?(users_mark)

    false
  end

  def inside_the_board?(row, column)
    row >= 0 && column >= 0 && row <= 5 &&  column <= 6
  end
end

## FOR DEBUGGING
game = Game.new

test_inputs = %w(B B B B C D C C A E A D)

for index in 0...test_inputs.length do
  index.even? ? (game.place_marker(test_inputs[index], 'X')) : (game.place_marker(test_inputs[index], '0')) 
end
game.draw_board

game.last_move
game.win?('0')
