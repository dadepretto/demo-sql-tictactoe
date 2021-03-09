
CREATE FUNCTION isCellFree (
    @rowIdx INT,
    @colIdx INT
) RETURNS TINYINT AS
BEGIN

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Controlla se una cella è libera (=NULL)
    */

    DECLARE @cellState CHAR(1)
    SELECT @cellState = cellState
    FROM TicTacToe
    WHERE rowIdx = @rowIdx
        AND colIdx = @colIdx

    DECLARE @isFree TINYINT = 1

    IF (@cellState IS NOT NULL)
    SET @isFree = 0

    RETURN @isFree

END

GO

