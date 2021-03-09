create table [dbo].[TicTacToe] (
    [rowIdx]    int      not null,
    [colIdx]    int      not null,
    [cellState] char (1) default (null) null,
    CHECK ([cellState]='O' or [cellState]='X')
);


go

