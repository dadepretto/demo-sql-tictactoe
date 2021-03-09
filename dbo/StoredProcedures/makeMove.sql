
create procedure makeMove (
    @rowIdx int, 
    @colIdx int,
    @state char(1)
) as
begin

    /*
        @Author: Davide De Pretto
        @Date: 20/11/2019
        @Description: Effettua una mossa sulla board di gioco
    */
    
    declare @isValid tinyint
    execute @isValid = checkCoordinates @rowIdx, @colIdx
    if @isValid = 0
    begin
        raiserror('Coordinate non valide!', 16, 1)
        return
    end
    
    declare @isFree tinyint
    execute @isFree = isCellFree @rowIdx, @colIdx
    if @isFree = 0
    begin
        raiserror('La cella non è libera!', 16, 1)
        return
    end

    update TicTacToe
    set cellState = @state
    where rowIdx = @rowIdx
        and colIdx = @colIdx
    
    select * from Board

    declare @winner char
    execute @winner = checkWin
    if @winner is not null
        select ('Ha vinto ' + @winner) as [State]
    else
    select ('Mossa effettuata!') as [State]
    
end

go

