require './lib/board'

describe Board do
    let(:board) {Board.new}
    context "#initialize" do
        it "sets @board_array to a 3 x 3 dim array containing all empty strings" do
            expect(board.board_array).to eq(Array.new(3,["","",""]))
        end
    end

    context "#draw_board" do
        it "prints to console the correct entries in the @board_array after board is first created" do
            expect do 
                board.draw_board
            end.to output("[\"\", \"\", \"\"]\n[\"\", \"\", \"\"]\n[\"\", \"\", \"\"]\n").to_stdout
        end
    end

    context "#reset_board" do
        it "prints to console an empty board" do
            board.set_elem("X", "A", "1" )
            expect do
                board.reset_board
                board.draw_board
            end.to output("[\"\", \"\", \"\"]\n[\"\", \"\", \"\"]\n[\"\", \"\", \"\"]\n").to_stdout
        end
    end
    context "#set_elem" do
        it "sets the an 'X' at the correct location (A, 1) on the board" do
            expect do   
                board.set_elem("X", "A", "1" )
                board.draw_board
            end.to output("[\"X\", \"\", \"\"]\n[\"\", \"\", \"\"]\n[\"\", \"\", \"\"]\n").to_stdout
        end
        it "sets the a 'O' at the correct location (B, 2) on the board" do
            expect do   
                board.set_elem("O", "B", "2" )
                board.draw_board
            end.to output("[\"\", \"\", \"\"]\n[\"\", \"O\", \"\"]\n[\"\", \"\", \"\"]\n").to_stdout
        end
        it "sets the a 'O' at the correct location (C, 2) on the board" do
            expect do   
                board.set_elem("O", "C", "2" )
                board.draw_board
            end.to output("[\"\", \"\", \"\"]\n[\"\", \"\", \"\"]\n[\"\", \"O\", \"\"]\n").to_stdout
        end
    end

    context "#get_row" do
        it "gets the board row correctly after board is first created" do
            expect(board.get_row("A")).to eql(["","",""])
            expect(board.get_row("B")).to eql(["","",""])
            expect(board.get_row("C")).to eql(["","",""])
        end
        it "gets the board row correctly after set_row is called" do
            board.set_row("C",["O","X","X"])
            expect(board.get_row("C")).to eq(["O","X","X"])
        end
        
    end
    context "#set_row" do
        it "sets the board row correctly" do
            board.set_row("A",["X","X","X"])
            expect do 
                board.draw_board
            end.to output("[\"X\", \"X\", \"X\"]\n[\"\", \"\", \"\"]\n[\"\", \"\", \"\"]\n").to_stdout

            board.set_row("B",["O","X","O"])
            expect do 
                board.draw_board
            end.to output("[\"X\", \"X\", \"X\"]\n[\"O\", \"X\", \"O\"]\n[\"\", \"\", \"\"]\n").to_stdout
        end
    end
    context "#set_column" do
        it "sets the board column correctly" do
            board.set_column("1",["X","X","X"])
            expect do 
                board.draw_board
            end.to output("[\"X\", \"\", \"\"]\n[\"X\", \"\", \"\"]\n[\"X\", \"\", \"\"]\n").to_stdout
        end
    end

  
end