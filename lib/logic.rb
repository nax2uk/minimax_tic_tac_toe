class Logic
    def check_win(board)

    end
    def check_win_horizontal?(board)
        board.board_array.inject(false) {| win, row | win || self.same_entries_in_a_row?(row)}
    end
    def same_entries_in_a_row?(board_row)
        board_row.uniq.size < 2  && board_row[0] != ""
    end
    # def same_entries_in_a_column?(board_column)
    #     temp_array = []
    #     temp_array << 
    # end
end