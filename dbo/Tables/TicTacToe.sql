CREATE TABLE [dbo].[TicTacToe] (
    [rowIdx]    INT      NOT NULL,
    [colIdx]    INT      NOT NULL,
    [cellState] CHAR (1) DEFAULT (NULL) NULL,
    CHECK ([cellState]='O' OR [cellState]='X')
);


GO

