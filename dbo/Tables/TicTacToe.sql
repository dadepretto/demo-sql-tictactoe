create table [dbo].[TicTacToe] (
    [ticTacToeId]   uniqueidentifier not null default (newid()),
    [rowIdx]        tinyint     not null,
    [colIdx]        tinyint     not null,
    [cellState]     char (1)    null,
    check ([cellState] = 'O' or [cellState] = 'X')
);
