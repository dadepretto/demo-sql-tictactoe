create procedure [dbo].[checkWin](
    @gameId uniqueidentifier,
    @winner char(1) output
)
as
declare
    @winnerRow char(1),
    @winnerCol char(1),
    @winnerDia char(1),
    @winnerInv char(1),
    @nRows int,
    @nCols int,
    @errorState int;
begin
    set nocount, xact_abort on;
    set transaction isolation level serializable;

    begin transaction;
    begin try
        select
            @nRows = count(distinct [GB].[RowIdx]),
            @nCols = count(distinct [GB].[ColIdx])
        from [dbo].[GameBoard] as [GB];

        -- Check rows
        select @winnerRow = [GB].[CellState]
        from [dbo].[GameBoard] as [GB]
        where [GB].[GameId] = @gameId
            and [GB].[CellState] is not null
        group by [GB].[RowIdx], [GB].[CellState]
        having count([GB].[CellState]) = @nRows;

        -- Check columns
        select @winnerCol = [GB].[CellState]
        from [dbo].[GameBoard] as [GB]
        where [GB].[GameId] = @gameId
            and [GB].[CellState] is not null
        group by [GB].[ColIdx], [GB].[CellState]
        having count([GB].[CellState]) = @nCols;
        
        if @nRows = @nCols
        begin
            -- Check main diagonal
            select @winnerDia = [GB].[CellState]
            from [dbo].[GameBoard] as [GB]
            where [GB].[GameId] = @gameId
                and [GB].[CellState] is not null
                and [GB].[RowIdx] = [GB].[ColIdx]
            group by [GB].[CellState]
            having count([GB].[CellState]) = @nRows;

            -- Check inverse diagonal
            select @winnerInv = [GB].[CellState]
            from [dbo].[GameBoard] as [GB]
            where [GB].[GameId] = @gameId
                and [GB].[CellState] is not null
                and [GB].[ColIdx] = (@nRows - 1 - [GB].[RowIdx])
            group by [GB].[CellState]
            having count([GB].[CellState]) = @nRows;
        end;

        set @errorState =
            case when @winnerRow is not null then 1 else 0 end +
            case when @winnerCol is not null then 1 else 0 end +
            case when @winnerDia is not null then 1 else 0 end +
            case when @winnerInv is not null then 1 else 0 end

        if @errorState not in (0, 1)
        begin
            raiserror(N'Invalid board state!', 16, 1);
        end;

        set @winner = coalesce(@winnerRow, @winnerCol, @winnerDia, @winnerInv);

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
