class Board
    attr_accessor :board_array

    ROW = {
        'A'=>0,
        'B'=>1,
        'C'=>2 }.freeze

    def initialize
        @board_array = Array.new(3) { Array.new(3,"") }
    end
    def draw_board
        p @board_array[0]
        p @board_array[1]
        p @board_array[2]
    end

    def reset_board
        @board_array.each { |board_row| 
            board_row.each_with_index { |elem, index|
                board_row[index] = ""
            }
        }
    end

    def set_elem(symbol, row, column)
        # @board_array[0][0] = symbol
        @board_array[ROW[row]][column.to_i - 1] = symbol
    end

    def get_row(row_letter)
        @board_array[ROW[row_letter]]
    end

    def get_column(number)
        index = number.to_i - 1
        column = []
        column << @board_array[0][index] << @board_array[1][index] << @board_array[2][index]
    end

    def set_row(row_letter, row_entries_array)
        @board_array[ROW[row_letter]] = row_entries_array
    end

    def set_column(column_number, column_entries_array)
        column_index = column_number.to_i - 1
        for i in 0..2
            @board_array[i][column_index] = column_entries_array[i]
        end
    end
    

end
