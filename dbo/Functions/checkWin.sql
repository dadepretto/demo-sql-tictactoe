
CREATE FUNCTION checkWin() RETURNS CHAR AS
BEGIN

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Effettua una mossa sulla board di gioco
    */

    DECLARE @winner CHAR
        , @nRows INT
        , @nCols INT

    SELECT @nRows = COUNT(DISTINCT rowIdx)
        , @nCols = COUNT(DISTINCT colIdx)
    FROM TicTacToe

    -- Controllo le righe
    SELECT @winner = cellState
    FROM TicTacToe
    WHERE cellState IS NOT NULL
    GROUP BY rowIdx, cellState
    HAVING COUNT(cellState) = @nRows

    -- Controllo le colonne
    SELECT @winner = cellState
    FROM TicTacToe
    WHERE cellState IS NOT NULL
    GROUP BY colIdx, cellState
    HAVING COUNT(cellState) = @nCols
    
    IF @nRows = @nCols
    BEGIN

        -- Controllo la diagonale primaria
        SELECT @winner = cellState
        FROM TicTacToe
        WHERE cellState IS NOT NULL
            AND rowIdx = colIdx
        GROUP BY cellState
        HAVING COUNT(cellState) = @nRows 

        -- Controllo la diagonale secondaria
        SELECT @winner = cellState
        FROM TicTacToe
        WHERE cellState IS NOT NULL
            AND colIdx = (@nRows - 1 - rowIdx)
        GROUP BY cellState
        HAVING COUNT(cellState) = @nRows
    
    END

    RETURN @winner

END

GO

