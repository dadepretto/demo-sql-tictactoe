create function [dbo].[pivotedBoard] (
    @gameId uniqueidentifier
) returns table
as
return
    with
        [SingeGameBoard] as (
            select *
            from [GameBoard] as [GB]
            where [GB].[GameId] = @gameId
        )
    select 
        [P].[RowIdx]    as [RowIdx],
        [P].[0]         as [0],
        [P].[1]         as [1],
        [P].[2]         as [2]
    from [SingeGameBoard] as [SGB]
        pivot (
            max([SGB].[CellState])
            for [SGB].[ColIdx] IN ([0], [1], [2])
        ) as [P]
    
