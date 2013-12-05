initial  = CargoBot::Parser.parse_board "bbb//rrr"
final    = CargoBot::Parser.parse_board "/brbrbr/ "
programs = CargoBot::Parser.parse_programs %w(DR1bDL1-)

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run