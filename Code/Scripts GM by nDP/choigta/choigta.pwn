/*	 ___________________________________________
	/_C_H_O_I_G_T_A__T_E_A_M____________________|
	|<\>	Gamemode    |:|	CHOI GTARP       	|
	|<\>	Scripter 	|:| FrKid | Mr DiHoc	|
	| 		Create Time	|:| 13:30 | 06.05.2019	|
	|_D_E_V_S_A_M_P_____|_|_____________________|

*/

#define SERVER_GM_TEXT "CHOIGTA v0.1"

#include <a_samp>
#include <a_mysql>
#include <a_actor>
#include <streamer>
#include <yom_buttons>		
#include <ZCMD>
#include <dini>
#include <easydialog>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <keypad>
#if defined SOCKET_ENABLED
#include <socket>
#endif
#include "./includes/base.pwn"
#include "./includes/choigta.pwn"
main() {}

public OnGameModeInit()
{
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}

