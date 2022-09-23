class Game
  
  def initialize()
    @board = create_board()
  end

  def create_board
    (1..6).map  {|x| Array.new(7)}
  end

end

