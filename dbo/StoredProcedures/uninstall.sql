
create procedure uninstall as 
begin
    drop table TicTacToe
    drop view Board
    drop procedure newGame
    drop function checkCoordinates
    drop function isCellFree
    drop function checkWin
    drop procedure makeMove
    drop procedure uninstall
end

go

