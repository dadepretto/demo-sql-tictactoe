
CREATE VIEW Board AS
    SELECT 
        rowIdx AS rowIdx, [0], [1], [2]
    FROM TicTacToe
        PIVOT (
            MAX(cellState)
            FOR colIdx IN ([0], [1], [2])
        ) as P

GO

