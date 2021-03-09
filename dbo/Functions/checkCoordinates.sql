
CREATE FUNCTION checkCoordinates (
    @rowIdx INT,
    @colIdx INT
) RETURNS TINYINT AS
BEGIN

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Verifica che le coordinate fornite siano corrette
    */

    DECLARE @minRowIdx INT
        , @maxRowIdx INT
        , @minColIdx INT
        , @maxColIdx INT

    SELECT @minRowIdx = MIN(rowIdx)
        , @maxRowIdx = MAX(rowIdx)
        , @minColIdx = MIN(colIdx)
        , @maxColIdx = MAX(colIdx)
    FROM TicTacToe

    DECLARE @check TINYINT = 1

    IF (@rowIdx < @minRowIdx OR
        @rowIdx > @maxRowIdx OR
        @colIdx < @minColIdx OR
        @colIdx > @maxColIdx)
    SET @check = 0

    RETURN @check

END

GO

