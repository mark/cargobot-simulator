initial  = CargoBot::Parser.parse_board "g/bb/g//bbb/g/bb/bb"
final    = CargoBot::Parser.parse_board "gbb//gbbb///gbbbb//"
programs = CargoBot::Parser.parse_programs %w(2D1 RD2-Lb)

b = CargoBot::Board.new(initial)
a = CargoBot::Arm.new(b, 0)
p = CargoBot::Program.new(programs)
m = CargoBot::Machine.new(b, a, p, final)

m.run