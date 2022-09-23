class Game
  
  def initialize()
    @board = create_board()
  end

  def create_board
    (1..6).map  {|x| Array.new(7)}
  end

  def draw_board()
    row_separator = "+---+---+---+---+---+---+---+"
    @board.each do |row|
      puts row_separator
      puts "| #{row[0].nil? ? " " : row[0] } | #{row[1].nil? ? " " : row[1] } | #{row[2].nil? ? " " : row[2] } | #{row[3].nil? ? " " : row[3] } | #{row[4].nil? ? " " : row[4] } | #{row[5].nil? ? " " : row[5] } | #{row[6].nil? ? " " : row[6] } |"
      end
    puts row_separator
  end
          



end

