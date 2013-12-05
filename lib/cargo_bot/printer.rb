#encoding: UTF-8

module CargoBot

  class Printer

    ################
    #              #
    # Declarations #
    #              #
    ################

    attr_reader :board, :arm

    ##############
    #            #
    # Characters #
    #            #
    ##############

    WALL    = "║"
    HANDLE  = "⥿"
    BOX     = " "
    NEWLINE = "\n"

    LCORNER = "╚"
    RCORNER = "╝"
    FLOOR   = "═"

    COLORS = {
      "blue"   => 44,
      "green"  => 42,
      "red"    => 41,
      "yellow" => 43,
      nil      => 49
    }

    ###############
    #             #
    # Constructor #
    #             #
    ###############

    def initialize(board, arm)
      @board = board
      @arm   = arm
      @first = true
    end

    ####################
    #                  #
    # Instance Methods #
    #                  #
    ####################

    def print_board
      print "\e[H\e[2J"
      print_arm_rows

      Board::MAX_HEIGHT.downto(0).each do |height|
        slice = board.slice(height)
        print_slice(slice)
      end

      print_floor
      sleep @first ? 1.0 : $delay
      @first = false
    end

    private

    def print_arm_rows
      print_row HANDLE.rjust(arm.position+1).ljust(board.width)
      print_row " " * arm.position + colored(arm.hand) + " " * (board.width - arm.position - 1)
    end

    def print_slice(slice)
      print_row slice.map { |c| colored(c) }.join
    end

    def print_floor
      print_row FLOOR * board.width, LCORNER, RCORNER
    end

    def colored(color, char = ' ')
      color_id = COLORS[color]
      "\e[0;#{color_id}m#{char}\e[0m"
    end

    def print_row(row, left = WALL, right = WALL)
      print left, row, right, NEWLINE
    end

  end

end
