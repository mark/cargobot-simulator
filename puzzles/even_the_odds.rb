initial  = CargoBot::Parser.parse_board ""
final    = CargoBot::Parser.parse_board ""
programs = CargoBot::Parser.parse_programs %w()

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run