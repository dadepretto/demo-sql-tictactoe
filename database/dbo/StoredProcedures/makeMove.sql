create procedure [dbo].[makeMove] (
    @gameId uniqueidentifier,
    @rowIdx int, 
    @colIdx int,
    @currentPlayer char(1) output,
    @newPlayer char(1) output,
    @winner char(1) output
) as
declare
    @message nvarchar(max),
    @isValid bit,
    @isFree bit;
begin
    set nocount, xact_abort on;
    set transaction isolation level serializable;

    begin transaction;
    begin try
        execute @isValid = [dbo].[areCoordinatesValid]
            @gameId = @gameId,
            @rowIdx = @rowIdx,
            @colIdx = @colIdx;

        if @isValid = 0
        begin
            set @message = N'Invalid coordinates (%d, %d)';
            raiserror(@message, 16, 1, @rowIdx, @colIdx);
        end;
        
        execute @isFree = [dbo].[isCellFree]
            @gameId = @gameId,
            @rowIdx = @rowIdx,
            @colIdx = @colIdx;
        
        if @isFree = 0
        begin
            set @message = N'The cell (%d, %d) is not empty!'
            raiserror(@message, 16, 1, @rowIdx, @colIdx);
        end;

        select @currentPlayer = [G].[CurrentPlayer]
        from [dbo].[Game] as [G]
        where [G].[GameId] = @gameId;

        update [GameBoard]
        set [CellState] = @currentPlayer
        where [GameId] = @gameId
            and [RowIdx] = @rowIdx
            and [ColIdx] = @colIdx;

        select [RowIdx], [0], [1], [2]
        from [dbo].[pivotedBoard](@gameId);

        execute [dbo].[checkWin]
            @gameId = @gameId,
            @winner = @winner output;

        if @winner is null
        begin
            set @newPlayer = case @currentPlayer when 'X' then 'O' else 'X' end;

            update [Game]
            set [CurrentPlayer] = @newPlayer
            where [GameId] = @gameId;
        end;

        commit transaction;
    end try
    begin catch
        if @@trancount > 1
        begin
            rollback;
        end;
        
        throw;
    end catch    
end
