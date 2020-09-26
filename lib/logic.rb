class Logic
    def check_win(board)

    end
    def check_win_horizontal(board)
        board.board_array.inject(false) {| win, row | win || self.same_entry_in_a_row?(row)}
    end
    def same_entry_in_a_row?(board_row)
        p board_row.size
        p board_row.uniq.size < 1 # && board_row[0] != ""
    end
end