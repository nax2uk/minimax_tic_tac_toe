require './lib/logic'
require './lib/board'

describe Logic do
    context "#same_entry_in_a_row?" do
        logic = Logic.new
        board = Board.new
        it "checks if returns false if first row of board is all ''s" do
            expect(logic.same_entry_in_a_row?(board.get_row("A"))).to eq(false)
        end
        it "checks if returns true if first row of board is all 'X's" do
            board.set_row("A",["X","X","X"])
            expect(logic.same_entry_in_a_row?(board.get_row("A"))).to eq(true)
        end

    end
end