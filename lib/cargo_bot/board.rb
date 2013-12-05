module CargoBot

  class Board

    ################
    #              #
    # Declarations #
    #              #
    ################

    MAX_HEIGHT = 6

    ###############
    #             #
    # Constructor #
    #             #
    ###############

    def initialize(columns)
      @board = columns.dup
    end

    ####################
    #                  #
    # Instance Methods #
    #                  #
    ####################

    def left!(position)
      if @board[position].length > MAX_HEIGHT
        raise ColumnOverflowError, "Column #{position} has #{@board[position].length} boxes"
      elsif position == 0
        raise ExitedBoardError, "Tried to move left from position #{ position } which is impossible"
      else
        position - 1
      end
    end

    def right!(position)
      if @board[position].length > MAX_HEIGHT
        raise ColumnOverflowError, "Column #{position} has #{@board[position].length} boxes"
      elsif position == (@board.length - 1)
        raise ExitedBoardError, "Tried to move right from position #{ position } which is impossible"
      else
        position + 1
      end
    end

    def width
      @board.length
    end

    def grab(column)
      @board[column].pop
    end

    def release(column, box)
      @board[column] << box
      nil
    end

    def slice(height)
      @board.map { |col| col[height] }
    end

    def match?(other)
      @board == other
    end

  end

end
