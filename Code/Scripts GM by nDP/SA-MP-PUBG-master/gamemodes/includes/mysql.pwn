/*
//--------------------------------[MYSQL.PWN]--------------------------------
*/



//--------------------------------[ INITIATE/EXIT ]---------------------------

// g_mysql_Init()
// รายละเอียด: ถูกเรียกใน Gamemode Init
stock g_mysql_Init()
{
    new SQL_HOST[32], SQL_DB[32], SQL_USER[32], SQL_PASS[32], fileString[128], File: fhConnectionInfo = fopen("MySQL.txt", io_read);
	fread(fhConnectionInfo, fileString);
	fclose(fhConnectionInfo);
	sscanf(fileString, "p<|>s[32]s[32]s[32]s[32]", SQL_DB, SQL_HOST, SQL_USER, SQL_PASS);
	mysql_log(NONE); // Has to be NONE for some the server will crash (runs out of memory)
	dbCon = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS, SQL_DB);
	if (mysql_errno(dbCon)) {
		printf("[SQL] Connection to \"%s\" failed! Please check the connection settings...\a", SQL_HOST);
		//SendRconCommand("exit");
		return 1;
	}
	else printf("[SQL] Connection to \"%s\" passed!", SQL_HOST);
    
	return 1;
}

// g_mysql_Exit()
// รายละเอียด: ถูกเรียกใน Gamemode Exit
stock g_mysql_Exit()
{
	mysql_close(dbCon);
	return 1;
}

//--------------------------------[ CALLBACKS ]--------------------------------

