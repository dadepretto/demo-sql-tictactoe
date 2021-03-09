create function [dbo].[isCellFree] (
    @rowIdx tinyint,
    @colIdx tinyint
) returns bit
as
begin
    declare @cellState char(1);

    select @cellState = [T].[cellState]
    from [dbo].[TicTacToe] as [T]
    where [T].[rowIdx] = @rowIdx
        and [T].[colIdx] = @colIdx;

    return case when @cellState is null then 1 else 0 end;
end;
