create procedure [dbo].[newGame] (
    @gameId uniqueidentifier out,
    @initialPlayer char(1) = 'X'
)
as
declare
    @message nvarchar(max);
begin
    set nocount, xact_abort on;
    set transaction isolation level serializable;

    begin transaction;
    begin try
        if @gameId is null
        begin
            set @gameId = newid();
        end;

        insert into [dbo].[Game] ([GameId], [CurrentPlayer])
        values (@gameId, @initialPlayer);

        insert into [dbo].[GameBoard] ([GameId], [RowIdx], [ColIdx])
        values 
            (@gameId, 0, 0), (@gameId, 0, 1), (@gameId, 0, 2),
            (@gameId, 1, 0), (@gameId, 1, 1), (@gameId, 1, 2),
            (@gameId, 2, 0), (@gameId, 2, 1), (@gameId, 2, 2)

        select [RowIdx], [0], [1], [2]
        from [dbo].[pivotedBoard](@gameId);

        commit transaction;
    end try
    begin catch
        if @@trancount > 0
        begin
            rollback transaction;
        end;
        
        throw;
    end catch
end;
