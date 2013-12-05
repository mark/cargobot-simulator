initial  = CargoBot::Parser.parse_board "brgy///// "
final    = CargoBot::Parser.parse_board "/////ygrb"
programs = CargoBot::Parser.parse_programs %w(2222R1 DRDL)

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run