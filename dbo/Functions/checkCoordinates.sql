create function [dbo].[checkCoordinates] (
    @rowIdx tinyint,
    @colIdx tinyint
) returns bit
as
begin
    declare @check bit = (
        select 0
        from (
            select
                min([T].[RowIdx])   as [minRowIdx],
                max([T].[RowIdx])   as [maxRowIdx],
                min([T].[ColIdx])   as [minColIdx],
                max([T].[ColIdx])   as [maxColIdx]
            from [dbo].[TicTacToe] as [T]
        ) as [TA]
        where @rowIdx < [TA].[minRowIdx]
            or @rowIdx > [TA].[maxRowIdx]
            or @colIdx < [TA].[minColIdx]
            or @colIdx > [TA].[maxColIdx]
    );

    return isnull(@check, 1);
end;