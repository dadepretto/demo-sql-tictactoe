create table [dbo].[GameBoard] (
    [GameId]        uniqueidentifier    not null,
    [RowIdx]        tinyint             not null,
    [ColIdx]        tinyint             not null,
    [CellState]     char(1)             null,

    constraint [PK_GameBoard]
        primary key clustered (GameId, RowIdx, ColIdx),
    constraint [FK_GameBoard_GameId]
        foreign key ([GameId])
            references [dbo].[Game]([GameId])
            on delete cascade,
    constraint [CK_Game_RowIdx]
        check ([RowIdx] >= 0 and [RowIdx] <= 2),
    constraint [CK_Game_ColIdx]
        check ([ColIdx] >= 0 and [ColIdx] <= 2),
    constraint [CK_GameBoard_CellState]
        check ([CellState] in ('X', 'O'))
);
