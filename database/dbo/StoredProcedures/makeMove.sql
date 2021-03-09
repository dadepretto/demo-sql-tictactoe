create procedure [dbo].[makeMove] (
    @rowIdx int, 
    @colIdx int,
    @state char(1)
) as
begin

    set nocount, xact_abort on;

    begin try
        declare @isValid bit;

        execute @isValid = [dbo].[checkCoordinates] @rowIdx, @colIdx;

        if @isValid = 0
        begin
            raiserror(N'Coordinate non valide!', 16, 1);
        end;
        
        declare @isFree bit;

        execute @isFree = [dbo].[isCellFree] @rowIdx, @colIdx;
        
        if @isFree = 0
        begin
            raiserror(N'La cella non è libera!', 16, 1);
        end;

        update [dbo].[TicTacToe]
        set [cellState] = @state
        where [rowIdx] = @rowIdx
            and [colIdx] = @colIdx;
        
        select *
        from [dbo].[Board];

        declare @winner char;

        execute @winner = [dbo].[checkWin];

        if @winner is not null
        begin
            raiserror(N'Ha vinto %s', 0, 1, @winner) with nowait;
        end;
        else
        begin
            raiserror(N'Mossa effettuata!', 0, 1) with nowait;
        end;
    end try
    begin catch
        throw;
    end catch    
end
