require './lib/logic'
require './lib/board'

describe Logic do
    let(:board) {Board.new}
    let(:logic) {Logic.new}
    context "#same_entries_in_a_row?" do

        it "checks if returns false if first row of board is all ''s" do
            expect(logic.same_entries_in_a_row?(board.get_row("A"))).to eq(false)
        end
        it "checks if returns true if first row of board is all 'X's" do
            board.set_row("A",["X","X","X"])
            expect(logic.same_entries_in_a_row?(board.get_row("A"))).to eq(true)
        end
        it "checks if returns false if second row of board is has two 'X's and one 'O's" do
            board.set_row("B",["X","","X"])
            expect(logic.same_entries_in_a_row?(board.get_row("B"))).to eq(false)
        end
    
        it "checks if returns false if third row of board is has one 'X's and one 'O's and one ''s " do
            board.set_row("C",["O","","X"])
            expect(logic.same_entries_in_a_row?(board.get_row("C"))).to eq(false)
        end
    end
    context "#check_win_horizontal?" do
        it "returns false if board has no entries" do
            expect(logic.check_win_horizontal?(board)).to eql(false)
        end
        it "returns true if board has all 'X's in first row" do
            board.set_row("A",["X","X","X"])
            expect(logic.check_win_horizontal?(board)).to eql(true)
        end
        it "returns true if board has all 'X's in last row" do
            board.set_row("C",["X","X","X"])
            expect(logic.check_win_horizontal?(board)).to eql(true)
        end
        it "returns false if board has not all 'X's in last row" do
            board.set_row("C",["X","","X"])
            expect(logic.check_win_horizontal?(board)).to eql(false)
        end
    end
    context "#same_entries_in_a_column?" do
        
    end
end