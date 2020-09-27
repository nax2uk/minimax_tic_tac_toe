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
    context "#check_win_for_any_horizontal?" do
        it "returns false if board has no entries" do
            expect(logic.check_win_for_any_horizontal?(board)).to eql(false)
        end
        it "returns true if board has all 'X's in first row" do
            board.set_row("A",["X","X","X"])
            expect(logic.check_win_for_any_horizontal?(board)).to eql(true)
        end
        it "returns true if board has all 'X's in last row" do
            board.set_row("C",["X","X","X"])
            expect(logic.check_win_for_any_horizontal?(board)).to eql(true)
        end
        it "returns false if board has not all 'X's in last row" do
            board.set_row("C",["X","","X"])
            expect(logic.check_win_for_any_horizontal?(board)).to eql(false)
        end
    end

    context "#same_entries_in_a_column?" do
        it "return false if board has just been created with no entries in the third column" do
            expect(logic.same_entries_in_a_column?(board.get_column("3"))).to eql(false)
        end
        it "return true if board has all 'X's in the first column" do
            board.set_column("1",["X","X","X"])
            expect(logic.same_entries_in_a_column?(board.get_column("1"))).to eq(true)
        end
        it "return fale if board has one 'X' and one 'O' in the second column" do
            board.set_column("2",["X","","O"])
            expect(logic.same_entries_in_a_column?(board.get_column("1"))).to eq(false)
        end
    end

    context "#check_win_for_any_vertical?" do
        it "returns false if board has no entries" do
            expect(logic.check_win_for_any_vertical?(board)).to eql(false)
        end
        it "returns true if board has all 'X's in first column" do
            board.set_column("1",["X","X","X"])
            expect(logic.check_win_for_any_vertical?(board)).to eql(true)
        end
        it "returns true if board has all 'X's in last column" do
            board.set_column("3",["X","X","X"])
            expect(logic.check_win_for_any_vertical?(board)).to eql(true)
        end
        it "returns false if board has not all 'X's in last column" do
            board.set_column("3",["X","","X"])
            expect(logic.check_win_for_any_vertical?(board)).to eql(false)
        end
    end

    context "#same_entries_in_a_diagonal?" do
        it "returns false if board does not have all entries in the left diagonal the same" do
            board.set_elem("X","A","1")
            board.set_elem("","B","2")
            board.set_elem("X","C","3")
            expect(logic.same_entries_in_a_diagonal?(board.get_diagonal("left"))).to eq(false)
        end
        it "returns true if board does not have all entries in the right diagonal the same" do
            board.set_elem("O","A","3")
            board.set_elem("O","B","2")
            board.set_elem("O","C","1")
            expect(logic.same_entries_in_a_diagonal?(board.get_diagonal("right"))).to eq(true)
        end
    end

    context "#check_win_at_position? - assume that position of latest entry is given" do
        context "-checks for a horizontal win" do
            it "returns false if no horizontal win when latest entry is at (A,1)" do
                board.set_elem("O","A","3")
                board.set_elem("X","B","2")
                board.set_elem("O","C","1")
                expect(logic.check_win_at_position?(board, "A", "1" )).to eq(false)
            end
            it "returns true if there is a horizontal win when latest entry is at (B,2)" do
                board.set_elem("O","B","1")
                board.set_elem("O","B","2")
                board.set_elem("O","B","3")
                expect(logic.check_win_at_position?(board, "B", "2" )).to eq(true)
            end
        end
        context "-checks for a vertical win" do
            it "returns false if no vertical win when latest entry is at (A,1)" do
                board.set_elem("O","A","3")
                board.set_elem("X","B","2")
                board.set_elem("O","C","1")
                expect(logic.check_win_at_position?(board, "A", "1" )).to eq(false)
            end
            it "returns true if there is a vertical win when latest entry is at (B,2)" do
                board.set_elem("O","A","2")
                board.set_elem("O","B","2")
                board.set_elem("O","C","2")
                expect(logic.check_win_at_position?(board, "B", "2" )).to eq(true)
            end
        end
        context "-checks for a diagonal win" do
            it "returns false if no diagonal win when latest entry is at (A,1)" do
                board.set_elem("O","A","1")
                board.set_elem("O","B","2")
                board.set_elem("O","C","1")
                expect(logic.check_win_at_position?(board, "A", "1" )).to eq(false)
            end
            it "returns true if there is a diagonal win when latest entry is at (B,2)" do
                board.set_elem("O","A","3")
                board.set_elem("O","B","2")
                board.set_elem("O","C","1")
                expect(logic.check_win_at_position?(board, "B", "2" )).to eq(true)
            end
        end
    end
end