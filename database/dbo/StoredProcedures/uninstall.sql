create procedure [dbo].[uninstall] as 
begin
    drop procedure [dbo].[newGame];
    drop procedure [dbo].[makeMove];
    drop procedure [dbo].[checkWin];
    drop function [dbo].[areCoordinatesValid];
    drop function [dbo].[isCellFree];
    drop function [dbo].[pivotedBoard];
    drop table [dbo].[GameBoard];
    drop table [dbo].[Game];
    drop procedure [dbo].[uninstall];
end
