class Board
    attr_accessor :board_array, :ROW

    ROW = {
        'A'=>0,
        'B'=>1,
        'C'=>2 }.freeze

    def initialize
        @board_array = Array.new(3) { Array.new(3,"") }
        @ROW = ROW
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
            @board_array[ROW[row]][column.to_i - 1] = symbol
        else
            raise ArgumentError.new("Input must 'X', 'O' or ''")
        end
    end

    def get_row(row_letter)
        @board_array[ROW[row_letter]]
    end

    def get_column(number)
        index = number.to_i - 1
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
