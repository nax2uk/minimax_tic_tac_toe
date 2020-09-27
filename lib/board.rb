class Board
    attr_accessor :board_array

    ROW = {
        'A'=>0,
        'B'=>1,
        'C'=>2 }.freeze

    COL = {
        '1' => 0,
        '2' => 1,
        '3' => 2
}.freeze

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

    def set_entry(symbol, row, column)
        if symbol == 'X' || 'O' || ''
            @board_array[ROW[row]][COL[column]] = symbol
        else
            raise ArgumentError.new("Input must 'X', 'O' or ''")
        end
    end

    def is_entry_on_a_left_diagonal?(row, column)
        ROW[row] == 0 && COL[column] == 0 || ROW[row] == 1 && COL[column] == 1 || ROW[row] == 2 && COL[column] == 2
    end

    def get_row(row)
        @board_array[ROW[row]]
    end

    def get_column(column)
        index = COL[column]
        column = []
        column << @board_array[0][index] << @board_array[1][index] << @board_array[2][index]
    end

    def get_diagonal(direction)
        diagonal = []
        case direction
        when "left"
            diagonal << @board_array[0][0] << @board_array[1][1] << @board_array[2][2]
        when "right"
            diagonal << @board_array[0][2] << @board_array[1][1] << @board_array[2][0]
        else    
            raise ArgumentError.new("Input must 'left' or 'right'")
        end
    end

    def set_row(row, row_array)
        @board_array[ROW[row]] = row_array
    end

    def set_column(column, column_array)
        #column_index = column_number.to_i - 1
        for row_index in 0..2
            @board_array[row_index][COL[column]] = column_array[row_index]
        end
    end
    

end
