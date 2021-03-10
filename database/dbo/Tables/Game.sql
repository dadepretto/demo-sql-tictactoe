create table [dbo].[Game] (
    [GameId]            uniqueidentifier    not null
        constraint [DF_Game_GameId] default(newid()),
    [CurrentPlayer]     char(1)             not null
        constraint [DF_Game_CurrentPlayer] default (0),

    constraint [PK_Game]
        primary key ([GameId]),
    constraint [CK_Game_CurrentPlayer]
        check ([CurrentPlayer] in ('X', 'O'))
);
