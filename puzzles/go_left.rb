initial  = CargoBot::Parser.parse_board "/rrr/ggg/bbb"
final    = CargoBot::Parser.parse_board "rrr/ggg/bbb/ "
programs = CargoBot::Parser.parse_programs %w(222R1 RDLD)

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run