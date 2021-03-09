create procedure [dbo].[uninstall] as 
begin
    drop table [dbo].[TicTacToe];
    drop view [dbo].[Board];
    drop procedure [dbo].[newGame];
    drop function [dbo].[checkCoordinates];
    drop function [dbo].[isCellFree];
    drop function [dbo].[checkWin];
    drop procedure [dbo].[makeMove];
    drop procedure [dbo].[uninstall];
end
