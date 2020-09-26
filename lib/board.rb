class Board
    attr_accessor :board_array

    ROW = {
        'A'=>0,
        'B'=>1,
        'C'=>2 }.freeze

    def initialize
        @board_array = Array.new(3,["","",""])
    end
    def draw_board
        p board_array[0]
        p board_array[1]
        p board_array[2]
    end
    # def row_number(letter)
    #     row={
    #         "A"=>0,
    #         "B"=>1,
    #         "C"=>2
    #     }
    #     row[letter]
    # end
    def get_row(row_letter)
        board_array[ROW[row_letter]]
    end

    def get_column(number)
        index = number - 1
        column = []
        column << board_array[0][index] << board_array[1][index] << board_array[2][index]
    end
    def set_row(row_letter, row_entries_array)
        board_array[ROW[row_letter]] = row_entries_array
    end
    

end
