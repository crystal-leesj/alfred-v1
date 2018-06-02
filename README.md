# alfred-v1
OSU CS361 group project

## Creating the database
There should already be a database created on your mysql server called 'alfred'.
If not, create one. There are different ways to run a script in mysql. For example:

`mysql> \. alfred_db_creation_script.sql`

The above command assumes you are logged into the mysql server as a user with
permission to modify the database. The script contains the command  

``USE `alfred` ``  

Thus there is no need to execute this command first. Executing the script will
setup the required tables, columns, and constraints.

## Running the program
To run the program, make sure you have a recent version of Node.js installed.
And follow the codes below on your terminal.

`cd alfred-v1`
`npm install`
`npm start`
