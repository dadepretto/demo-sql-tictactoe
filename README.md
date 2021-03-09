# SQL Tic Tac Toe
Here is a funny versions of the classic Tic Tac Toe game, written in T-SQL.
Have fun!

## Usage
You can install this game in SQL Server/Azure SQL Database either by deploying manually all the objects inside the `database/dbo` folder or by building the `database/sql-tictactoe.sqlproj` project and deploying the resulting dacpac.
An example of application usage can be found in the file `example.sql`.

## Uninstall
To uninstall all the components from your database use the `[dbo].[uninstall]` Stored Procedure.
```sql
execute [dbo].[uninstall];
```