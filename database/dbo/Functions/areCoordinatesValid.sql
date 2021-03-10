create function [dbo].[areCoordinatesValid] (
    @gameId uniqueidentifier,
    @rowIdx tinyint,
    @colIdx tinyint
) returns bit
as
begin    
    declare @isValid bit;

    select @isValid = 0
    from [dbo].[GameBoard] as [GB]
    where [GB].[GameId] = @gameId
    group by [GB].[GameId]
    having @rowIdx < min([GB].[RowIdx])
        or @rowIdx > max([GB].[RowIdx])
        or @colIdx < min([GB].[ColIdx])
        or @colIdx > max([GB].[ColIdx]);

    return isnull(@isValid, 1);
end;