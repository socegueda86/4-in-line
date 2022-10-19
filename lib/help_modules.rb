module CheckForWins

  def diagonal_bottom_left_to_top_right_win?(users_mark)
    count = 0
    row = @last_move[0]
    column = @last_move[1]

    # next line checks for a line of matches starting from last move to the left and bottom
    while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        row -= 1
        column -= 1
      else
        break
      end
    end

    row = @last_move[0] + 1
    column = @last_move[1] + 1

    # next line checks for a line of matches starting from last move to the right and up
    while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        row += 1
        column += 1
      else
        #row = @last_move[0]
        #column = @last_move[1]
        break
      end
    end

    return true if count >= 4
    false
  end

  def diagonal_top_left_to_bottom_right_win?(users_mark)
    count = 0
    row = @last_move[0]
    column = @last_move[1]

    # next line checks for a line of matches starting from last move to the left and top
    while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        row -= 1
        column += 1
      else
        break
      end
    end

    row = @last_move[0] + 1
    column = @last_move[1] - 1

    # next line checks for a line of matches starting from last move to the right and up
    while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        row += 1
        column -= 1
      else
        #row = @last_move[0]
        #column = @last_move[1]
        break
      end
    end

    return true if count >= 4
    false
  end

  def vertical_win?(users_mark)
    count = 0
    row = @last_move[0]
    column = @last_move[1]

    while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        column += 1
      else
        break
      end
    end

    column = @last_move[1] - 1

    while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        column -= 1
      else
        break
      end
    end

    return true if count >= 4
    false
  end

  def horizontal_win?(users_mark)
    count = 0
    row = @last_move[0]
    column = @last_move[1]

   while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        row -= 1
      else
        break
      end
    end

    row = @last_move[0] + 1

    while inside_the_board?(row, column)
      if @board[row][column] == users_mark
        count += 1
        row += 1
      else
        break
      end
    end

    return true if count >= 4
    false
  end
end