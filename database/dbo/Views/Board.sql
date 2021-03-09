create view [dbo].[Board]
as
    select 
        [P].[rowIdx]    as [rowIdx],
        [P].[0]         as [0],
        [P].[1]         as [1],
        [P].[2]         as [2]
    from [dbo].[TicTacToe] as [T]
        pivot (max([T].[cellState]) for [T].[colIdx] IN ([0], [1], [2])) as [P];
