create function [dbo].[isCellFree] (
    @gameId uniqueidentifier,
    @rowIdx tinyint,
    @colIdx tinyint
) returns bit
as
begin
    declare @isFree bit;

    select @isFree = 0
    from [dbo].[GameBoard] as [GB]
    where [GB].[GameId] = @gameId
        and [GB].[RowIdx] = @rowIdx
        and [GB].[ColIdx] = @colIdx
        and [GB].[CellState] is not null;

    return isnull(@isFree, 1);
end;
