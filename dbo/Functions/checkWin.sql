create function [dbo].[checkWin]() returns char
as
begin
    declare @winner char,
        @nRows int,
        @nCols int;

    select @nRows = count(distinct [T].[rowIdx]),
        @nCols = count(distinct [T].[colIdx])
    from [dbo].[TicTacToe] as [T];

    -- Controllo le righe
    select @winner = [T].[cellState]
    from [dbo].[TicTacToe] as [T]
    where [T].[cellState] is not null
    group by [T].[rowIdx], [T].[cellState]
    having count([T].[cellState]) = @nRows;

    -- Controllo le colonne
    select @winner = [T].[cellState]
    from [dbo].[TicTacToe] as [T]
    where [T].[cellState] is not null
    group by [T].[colIdx], [T].[cellState]
    having count([T].[cellState]) = @nCols;
    
    if @nRows = @nCols
    begin
        -- Controllo la diagonale primaria
        select @winner = [T].[cellState]
        from [dbo].[TicTacToe] as [T]
        where [T].[cellState] is not null
            and [T].[rowIdx] = [T].[colIdx]
        group by [T].[cellState]
        having count([T].[cellState]) = @nRows;

        -- Controllo la diagonale secondaria
        select @winner = [T].[cellState]
        from [dbo].[TicTacToe] as [T]
        where [T].[cellState] is not null
            and [T].[colIdx] = (@nRows - 1 - [T].[rowIdx])
        group by [T].[cellState]
        having count([T].[cellState]) = @nRows;
    end;

    return @winner;
end
