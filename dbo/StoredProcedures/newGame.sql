
CREATE PROCEDURE newGame AS
BEGIN

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Effettua il reset della board di gioco
    */

    TRUNCATE TABLE TicTacToe

    INSERT INTO TicTacToe (rowIdx, colIdx)
    VALUES 
        (0, 0), (0, 1), (0, 2),
        (1, 0), (1, 1), (1, 2),
        (2, 0), (2, 1), (2, 2)

    PRINT('Che la sfida abbia inizio!')

END

GO

