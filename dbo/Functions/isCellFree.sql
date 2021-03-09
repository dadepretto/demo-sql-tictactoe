
create function isCellFree (
    @rowIdx int,
    @colIdx int
) returns tinyint as
begin

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Controlla se una cella è libera (=null)
    */

    declare @cellState char(1)
    select @cellState = cellState
    from TicTacToe
    where rowIdx = @rowIdx
        and colIdx = @colIdx

    declare @isFree tinyint = 1

    if (@cellState is not null)
    set @isFree = 0

    return @isFree

end

go

