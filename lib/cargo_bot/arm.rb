module CargoBot

  class Arm

    ################
    #              #
    # Declarations #
    #              #
    ################

    attr_reader :position, :board, :hand

    ###############
    #             #
    # Constructor #
    #             #
    ###############

    def initialize(board, position)
      @board    = board
      @position = position
    end

    ####################
    #                  #
    # Instance Methods #
    #                  #
    ####################

    def down
      @hand = hand ? board.release(position, hand) : board.grab(position)
    end

    def holding?(type)
      case type
      when :none then hand.nil?
      when :any  then !! hand
                 else hand == type
      end
    end

    def left
      @position = board.left!(position)
    end

    def right
      @position = board.right!(position)
    end

  end

end
