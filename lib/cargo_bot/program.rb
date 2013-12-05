module CargoBot

  class Program

    def initialize(progs)
      @progs = progs
    end

    def instruction(prog, index)
      @progs[prog-1][index]
    end

  end

end
