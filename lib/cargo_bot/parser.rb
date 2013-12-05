module CargoBot

  module Parser

    BOXES = {
      'b' => 'blue',
      'g' => 'green',
      'r' => 'red',
      'y' => 'yellow',
      '*' => :all,
      '-' => :none,
      ' ' => nil,
    }

    INSTRUCTIONS = {
      "L" => "left",
      "R" => "right",
      "D" => "down",
      "1" => "prog1",
      "2" => "prog2",
      "3" => "prog3",
      "4" => "prog4",
    }

    def self.parse_board(string)
      string.split('/').map do |column|
        column.split('').map { |c| BOXES[c] }.compact
      end
    end

    def self.parse_programs(strings)
      strings.map { |string| parse_program(string) }
    end

    def self.parse_program(string)
      string.scan(/[1-9A-Z][a-z*-]?/).map do |instr|
        if instr.length == 1
          INSTRUCTIONS[instr]
        else
          [ INSTRUCTIONS[instr[0]], BOXES[instr[1]] ]
        end
      end
    end

  end

end
