world/New()
	..()
	for(var/x = 1, x <= 5000, x++)
		DB_PORT = x
		world.log << "[DB_PORT]"
		Connect()

// Deprecated! See global.dm for new configuration vars
var/DEF_CUR = 0
var/DB_SERVER = "213.124.161.184" // This is the location of your MySQL server (localhost is USUALLY fine)
var/DB_PORT = 3306 // This is the port your MySQL server is running on (3306 is the default)
var/DB_USER = "testuser" //User name
var/DB_PASS = "12345" //Passworld
var/DB_DB = "feedback" //Database name
var/DB_DBI = "dbi:mysql:[DB_DB]:[DB_SERVER]:[DB_PORT]"
var/_db_con


proc/Connect()
	//warning("Attempting db connection: [DB_DBI],[DB_USER],[DB_PASS],[DEF_CUR]")
	. = _dm_db_connect(_db_con,DB_DBI,DB_USER,DB_PASS,DEF_CUR,null)

	//warning("Result = |[.]|, _db_con = |[_db_con]|")
	if(IsConnected() || .)
		warning("CONNECTION!")
	//warning("Is connected = |[IsConnected()]|")
	//warning("Possible error = |[ErrorMsg()]|")

proc/IsConnected()
	var/success = _dm_db_is_connected(_db_con)
	return success

proc/ErrorMsg() return _dm_db_error_msg(_db_con)

proc/warning(var/message)
	world.log << "## WARNING: [message]"