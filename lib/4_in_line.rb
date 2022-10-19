class Game
  attr_reader :board
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
    @board.each_with_index do |row, i|
      puts row_separator
      puts "#{6 - i} | #{row[0].nil? ? " " : row[0] } | #{row[1].nil? ? " " : row[1] } | #{row[2].nil? ? " " : row[2] } | #{row[3].nil? ? " " : row[3] } | #{row[4].nil? ? " " : row[4] } | #{row[5].nil? ? " " : row[5] } | #{row[6].nil? ? " " : row[6] } |"
      end
    puts row_separator
    puts "    A   B   C   D   E   F   G  "
  end

  def place_marker(column, marker)
    column = column_letter_to_array_index(column)

    row_position = (0..5).find {|i| @board[5 - i][column].nil?}

    @board[5 - row_position][column] = marker
    @last_move = [row_position, column]
  end

  #Since the array uses indexes not letters, this method is a dictionary to change letters to index
  def column_letter_to_array_index(column) 
    HASH_LETTER_TO_INDEX.fetch(column)
  end
  
  # this would check if the colums are among A - G, if the values are appropiate 'A'-'G'
  def user_input_verifier(user_input)  
    return false if user_input.length > 1 
    user_input = user_input.upcase
    return false if user_input.match(/[A-G]/).nil?
    puts "Invalid input: please try again"
    true
  end

  def is_column_full?(user_input)
    (0...6).any? {|i| @board[5 - i][column_letter_to_array_index(user_input)].nil?}
  end

  def win?(users_mark)
    return true if diagonal_bottom_to_top_win?(users_mark)

    false
  end
  
  def check_for_last_move
    @last_move
  end

  def diagonal_bottom_to_top_win?(users_mark)
    count = 1
    row = @last_move[0]
    column = @last_move[1]
    
    #next line checks the diagonal to the left and bottom
    while row >= 0 && column >= 0 && row <= 5 &&  column[1] <= 6
      if @board[row][column] == users_mark
        count += 1
        row -= 1
        column -= 1
      else
        row = @last_move[0] + 1
        column = @last_move[1] + 1
        break
      end
    end

    #next line checks the diagonal to the left and bottom
    while row >= 0 && column >= 0 && row <= 5 &&  column[1] <= 6
      if @board[row][column] == users_mark
        count += 1
        row += 1
        column += 1
      else
        row = @last_move[0]
        column = @last_move[1]
        break
      end
    end
  
  return true if count >= 4
  false

  end
    
end

game = Game.new

#class HumanPlayer < Player
#
#  def 