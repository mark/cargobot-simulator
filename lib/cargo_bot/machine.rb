module CargoBot

  class Machine

    attr_reader :board, :arm, :program, :final, :stack

    def initialize(board, arm, program, final)
      @board   = board
      @arm     = arm
      @program = program
      @final   = final
      @stack   = []
      @routine = 1
      @pc      = 0
      @printer = Printer.new(@board, @arm)
    end

    def execute
      action, check = program.instruction(@routine, @pc)
      @pc += 1

      if action.nil?
        pop_stack
      elsif check && ! arm.holding?(check)
        # Do nothing...
      else
        perform(action)
        @printer.print_board
      end
    end

    def run
      @running = true
      @printer.print_board

      while @running && ! @board.match?(final)
        execute
      end
    end

    def perform(action)
      case action
      when "prog1" then jump_to(1)
      when "prog2" then jump_to(2)
      when "prog3" then jump_to(3)
      when "prog4" then jump_to(4)
      when "left"  then arm.left
      when "right" then arm.right
      when "down"  then arm.down
                   else raise ArgumentError, "I don't know how to do #{ action }"
      end
    end

    def jump_to(routine, pc = 0)
      @stack << [@routine, @pc]
      @routine = routine
      @pc = pc
    end

    def pop_stack
      @routine, @pc = stack.pop
      @running = !!@routine
    end

  end

end
