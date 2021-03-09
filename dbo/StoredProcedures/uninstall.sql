
CREATE PROCEDURE uninstall AS 
BEGIN
    DROP TABLE TicTacToe
    DROP VIEW Board
    DROP PROCEDURE newGame
    DROP FUNCTION checkCoordinates
    DROP FUNCTION isCellFree
    DROP FUNCTION checkWin
    DROP PROCEDURE makeMove
    DROP PROCEDURE uninstall
END

GO

