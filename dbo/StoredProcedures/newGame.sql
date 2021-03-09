
create procedure newGame as
begin

    /*
        @Author: Davide De Pretto
        @Date: 22/11/2019
        @Description: Effettua il reset della board di gioco
    */

    truncate table TicTacToe

    insert into TicTacToe (rowIdx, colIdx)
    values 
        (0, 0), (0, 1), (0, 2),
        (1, 0), (1, 1), (1, 2),
        (2, 0), (2, 1), (2, 2)

    print('Che la sfida abbia inizio!')

end

go

