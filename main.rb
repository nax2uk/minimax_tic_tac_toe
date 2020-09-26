require './lib/board'
require './lib/logic'
board = Board.new
board.draw_board
p board.get_column(3)
logic = Logic.new
p logic.check_win_horizontal(board)