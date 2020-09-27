class Logic
    def check_win_at_position?(board, latest_row_entry, latest_column_entry)
        board_row = board.get_row(latest_row_entry)
        board_column = board.get_column(latest_column_entry)
        board_left_diagonal = board.get_diagonal("left")
        board_right_diagonal = board.get_diagonal("right")
 
        self.same_entries_in_a_row?(board_row) || 
        self.same_entries_in_a_column?(board_column) || 
        self.same_entries_in_a_diagonal?(board_left_diagonal) || 
        self.same_entries_in_a_diagonal?(board_right_diagonal)
    end

    def check_win_for_any_horizontal?(board)
        board.board_array.inject(false) {| win, row | win || self.same_entries_in_a_row?(row)}
    end

    def check_win_for_any_vertical?(board)
        rotate_board = []
        for i in 1..3
            rotate_board << board.get_column(i.to_s)
        end
        rotate_board.inject(false) {| win, column | win || self.same_entries_in_a_column?(column)}
    end

    def same_entries_in_a_row?(board_row)
        board_row.uniq.size < 2  && board_row[0] != ""
    end

    def same_entries_in_a_column?(board_column)
        self.same_entries_in_a_row?(board_column)
    end

    def same_entries_in_a_diagonal?(board_diagonal)
        self.same_entries_in_a_row?(board_diagonal)
    end
end