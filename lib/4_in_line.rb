class Game
  attr_reader :board

  def initialize()
    @board = create_board()
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
    column = column_letter_to_number(column)
  end

  def column_letter_to_number(column)
    hash_letter_to_numbers = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7,}
    hash_letter_to_numbers.fetch(column)
  end

  def user_input_verifier(user_input)  # this would check if the colums are among A - G, if the columns aren't full, if the values are appropiate 'A'-'G'
    return false if user_input.length > 1 

    user_input = user_input.upcase
    return false if user_input.match(/[A-G]/).nil?
    puts "Invalid input: please try again"
    true
  end

  def is_space_in_column(user_input)
    (0...6).any? {|i| @board[5-i][column_letter_to_number(user_input)].nil?}
  end
end

