
CREATE PROCEDURE makeMove (
    @rowIdx INT, 
    @colIdx INT,
    @state CHAR(1)
) AS
BEGIN

    /*
        @Author: Davide De Pretto
        @Date: 20/11/2019
        @Description: Effettua una mossa sulla board di gioco
    */
    
    DECLARE @isValid TINYINT
    EXEC @isValid = checkCoordinates @rowIdx, @colIdx
    IF @isValid = 0
    BEGIN
        RAISERROR('Coordinate non valide!', 16, 1)
        RETURN
    END
    
    DECLARE @isFree TINYINT
    EXEC @isFree = isCellFree @rowIdx, @colIdx
    IF @isFree = 0
    BEGIN
        RAISERROR('La cella non è libera!', 16, 1)
        RETURN
    END

    UPDATE TicTacToe
    SET cellState = @state
    WHERE rowIdx = @rowIdx
        AND colIdx = @colIdx
    
    SELECT * FROM Board

    DECLARE @winner CHAR
    EXEC @winner = checkWin
    IF @winner IS NOT NULL
        SELECT ('Ha vinto ' + @winner) AS [State]
    ELSE
    SELECT ('Mossa effettuata!') AS [State]
    
END

GO

