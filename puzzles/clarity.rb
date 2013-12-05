initial  = CargoBot::Parser.parse_board "grg/gggrg/rgrg/rgg/ "
final    = CargoBot::Parser.parse_board "gr/gggr/rgr/r/ggggg"
programs = CargoBot::Parser.parse_programs %w(D1rR2g1 DL)

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run