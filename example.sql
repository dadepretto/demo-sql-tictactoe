--------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------
--------------------------------------------------------------------------------
drop table if exists [#Session];

create table [#Session] ([GameId] uniqueidentifier not null primary key);

declare @gameId uniqueidentifier;
declare @initialPlayer char(1) = 'X';

execute [dbo].[newGame]
    @gameId = @gameId output,
    @initialPlayer = @initialPlayer;

insert into [#Session] ([GameId]) values (@GameId);

raiserror(N'Done! Now it''s %s turn!', 0, 1, @initialPlayer) with nowait;
go

--------------------------------------------------------------------------------
------------------------------------- PLAY -------------------------------------
--------------------------------------------------------------------------------

-- Move 1
declare @gameId uniqueidentifier = (select [GameId] from [#Session]),
    @rowIdx tinyint = 0,
    @colIdx tinyint = 0,
    @winner char(1),
    @currentPlayer char(1),
    @newPlayer char(1);

execute [dbo].[makeMove]
    @gameId = @gameId,
    @rowIdx = @rowIdx,
    @colIdx = @colIdx,
    @currentPlayer = @currentPlayer output,
    @newPlayer = @newPlayer output,
    @winner = @winner output;

raiserror(N'Player %s signed (%d, %d)', 0, 1, @currentPlayer, @rowIdx, @colIdx)
    with nowait;

if @winner is null
begin
    raiserror(N'Now it''s %s turn', 0, 1, @newPlayer) with nowait;
end;
else
begin
    raiserror(N'Player %s won!', 0, 1, @currentPlayer) with nowait;
end;
go

-- Move 2
declare @gameId uniqueidentifier = (select [GameId] from [#Session]),
    @rowIdx tinyint = 0,
    @colIdx tinyint = 2,
    @winner char(1),
    @currentPlayer char(1),
    @newPlayer char(1);

execute [dbo].[makeMove]
    @gameId = @gameId,
    @rowIdx = @rowIdx,
    @colIdx = @colIdx,
    @currentPlayer = @currentPlayer output,
    @newPlayer = @newPlayer output,
    @winner = @winner output;

raiserror(N'Player %s signed (%d, %d)', 0, 1, @currentPlayer, @rowIdx, @colIdx)
    with nowait;

if @winner is null
begin
    raiserror(N'Now it''s %s turn', 0, 1, @newPlayer) with nowait;
end;
else
begin
    raiserror(N'Player %s won!', 0, 1, @currentPlayer) with nowait;
end;
go

-- Move 3
declare @gameId uniqueidentifier = (select [GameId] from [#Session]),
    @rowIdx tinyint = 2,
    @colIdx tinyint = 2,
    @winner char(1),
    @currentPlayer char(1),
    @newPlayer char(1);

execute [dbo].[makeMove]
    @gameId = @gameId,
    @rowIdx = @rowIdx,
    @colIdx = @colIdx,
    @currentPlayer = @currentPlayer output,
    @newPlayer = @newPlayer output,
    @winner = @winner output;

raiserror(N'Player %s signed (%d, %d)', 0, 1, @currentPlayer, @rowIdx, @colIdx)
    with nowait;

if @winner is null
begin
    raiserror(N'Now it''s %s turn', 0, 1, @newPlayer) with nowait;
end;
else
begin
    raiserror(N'Player %s won!', 0, 1, @currentPlayer) with nowait;
end;
go

-- Move 4
declare @gameId uniqueidentifier = (select [GameId] from [#Session]),
    @rowIdx tinyint = 1,
    @colIdx tinyint = 1,
    @winner char(1),
    @currentPlayer char(1),
    @newPlayer char(1);

execute [dbo].[makeMove]
    @gameId = @gameId,
    @rowIdx = @rowIdx,
    @colIdx = @colIdx,
    @currentPlayer = @currentPlayer output,
    @newPlayer = @newPlayer output,
    @winner = @winner output;

raiserror(N'Player %s signed (%d, %d)', 0, 1, @currentPlayer, @rowIdx, @colIdx)
    with nowait;

if @winner is null
begin
    raiserror(N'Now it''s %s turn', 0, 1, @newPlayer) with nowait;
end;
else
begin
    raiserror(N'Player %s won!', 0, 1, @currentPlayer) with nowait;
end;
go

-- Move 5
declare @gameId uniqueidentifier = (select [GameId] from [#Session]),
    @rowIdx tinyint = 2,
    @colIdx tinyint = 0,
    @winner char(1),
    @currentPlayer char(1),
    @newPlayer char(1);

execute [dbo].[makeMove]
    @gameId = @gameId,
    @rowIdx = @rowIdx,
    @colIdx = @colIdx,
    @currentPlayer = @currentPlayer output,
    @newPlayer = @newPlayer output,
    @winner = @winner output;

raiserror(N'Player %s signed (%d, %d)', 0, 1, @currentPlayer, @rowIdx, @colIdx)
    with nowait;

if @winner is null
begin
    raiserror(N'Now it''s %s turn', 0, 1, @newPlayer) with nowait;
end;
else
begin
    raiserror(N'Player %s won!', 0, 1, @currentPlayer) with nowait;
end;
go

-- Move 6
declare @gameId uniqueidentifier = (select [GameId] from [#Session]),
    @rowIdx tinyint = 1,
    @colIdx tinyint = 0,
    @winner char(1),
    @currentPlayer char(1),
    @newPlayer char(1);

execute [dbo].[makeMove]
    @gameId = @gameId,
    @rowIdx = @rowIdx,
    @colIdx = @colIdx,
    @currentPlayer = @currentPlayer output,
    @newPlayer = @newPlayer output,
    @winner = @winner output;

raiserror(N'Player %s signed (%d, %d)', 0, 1, @currentPlayer, @rowIdx, @colIdx)
    with nowait;

if @winner is null
begin
    raiserror(N'Now it''s %s turn', 0, 1, @newPlayer) with nowait;
end;
else
begin
    raiserror(N'Player %s won!', 0, 1, @currentPlayer) with nowait;
end;
go

-- Move 7
declare @gameId uniqueidentifier = (select [GameId] from [#Session]),
    @rowIdx tinyint = 2,
    @colIdx tinyint = 1,
    @winner char(1),
    @currentPlayer char(1),
    @newPlayer char(1);

execute [dbo].[makeMove]
    @gameId = @gameId,
    @rowIdx = @rowIdx,
    @colIdx = @colIdx,
    @currentPlayer = @currentPlayer output,
    @newPlayer = @newPlayer output,
    @winner = @winner output;

raiserror(N'Player %s signed (%d, %d)', 0, 1, @currentPlayer, @rowIdx, @colIdx)
    with nowait;

if @winner is null
begin
    raiserror(N'Now it''s %s turn', 0, 1, @newPlayer) with nowait;
end;
else
begin
    raiserror(N'Player %s won!', 0, 1, @currentPlayer) with nowait;
end;
go
