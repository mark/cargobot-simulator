initial  = CargoBot::Parser.parse_board "y/// "
final    = CargoBot::Parser.parse_board "///y"
programs = CargoBot::Parser.parse_programs %w(DRD1)

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run