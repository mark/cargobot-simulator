initial  = CargoBot::Parser.parse_board "ybbbb// "
final    = CargoBot::Parser.parse_board "/bbbb/y"
programs = CargoBot::Parser.parse_programs %w(DRDbL-1)

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run