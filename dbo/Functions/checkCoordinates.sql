
create function checkCoordinates (
    @rowIdx int,
    @colIdx int
) returns tinyint as
begin

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Verifica che le coordinate fornite siano corrette
    */

    declare @minRowIdx int
        , @maxRowIdx int
        , @minColIdx int
        , @maxColIdx int

    select @minRowIdx = min(rowIdx)
        , @maxRowIdx = max(rowIdx)
        , @minColIdx = min(colIdx)
        , @maxColIdx = max(colIdx)
    from TicTacToe

    declare @check TINYint = 1

    if (@rowIdx < @minRowIdx or
        @rowIdx > @maxRowIdx or
        @colIdx < @minColIdx or
        @colIdx > @maxColIdx)
    set @check = 0

    return @check

end

GO

