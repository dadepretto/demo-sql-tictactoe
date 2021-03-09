
create function checkWin() returns char as
begin

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Effettua una mossa sulla board di gioco
    */

    declare @winner char
        , @nRows int
        , @nCols int

    select @nRows = count(distinct rowIdx)
        , @nCols = count(distinct colIdx)
    from TicTacToe

    -- Controllo le righe
    select @winner = cellState
    from TicTacToe
    where cellState is not null
    group by rowIdx, cellState
    having count(cellState) = @nRows

    -- Controllo le colonne
    select @winner = cellState
    from TicTacToe
    where cellState is not null
    group by colIdx, cellState
    having count(cellState) = @nCols
    
    if @nRows = @nCols
    begin

        -- Controllo la diagonale primaria
        select @winner = cellState
        from TicTacToe
        where cellState is not null
            and rowIdx = colIdx
        group by cellState
        having count(cellState) = @nRows 

        -- Controllo la diagonale secondaria
        select @winner = cellState
        from TicTacToe
        where cellState is not null
            and colIdx = (@nRows - 1 - rowIdx)
        group by cellState
        having count(cellState) = @nRows
    
    end

    return @winner

end

go

