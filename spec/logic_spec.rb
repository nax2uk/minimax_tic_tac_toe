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
        it "checks if returns false if second row of board is has two 'X's and one 'O's" do
            board.set_row("B",["X","","X"])
            expect(logic.same_entry_in_a_row?(board.get_row("B"))).to eq(false)
        end
    
        it "checks if returns false if third row of board is has one 'X's and one 'O's and one ''s " do
            board.set_row("C",["O","","X"])
            expect(logic.same_entry_in_a_row?(board.get_row("C"))).to eq(false)
        end

    end
end