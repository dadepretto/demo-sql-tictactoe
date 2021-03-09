create procedure [dbo].[newGame]
as
begin
    truncate table [dbo].[TicTacToe];

    insert into [dbo].[TicTacToe] ([rowIdx], [colIdx])
    values 
        (0, 0), (0, 1), (0, 2),
        (1, 0), (1, 1), (1, 2),
        (2, 0), (2, 1), (2, 2)

    raiserror(N'Che la sfida abbia inizio!', 0, 1) with nowait;

end

go

