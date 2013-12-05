module CargoBot

  require 'cargo_bot/board'
  require 'cargo_bot/arm'
  require 'cargo_bot/printer'
  require 'cargo_bot/program'
  require 'cargo_bot/machine'
  require 'cargo_bot/parser'

  class ColumnOverflowError < StandardError; end
  class ExitedBoardError    < StandardError; end

end
