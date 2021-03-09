
create view Board as
    select 
        rowIdx as rowIdx, [0], [1], [2]
    from TicTacToe
        PIVOT (
            max(cellState)
            FOR colIdx IN ([0], [1], [2])
        ) as P

go

