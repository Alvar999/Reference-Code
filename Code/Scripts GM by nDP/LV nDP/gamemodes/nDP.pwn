#define SERVER_GM_TEXT "LV:RP Season 1"

#include <a_samp>
#include <a_mysql>
#include <streamer>
#include <yom_buttons>
#include <ZCMD>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <YSI\y_ini>
#include <progress2>
#include <progress>
//#include <keypad>


#if defined SOCKET_ENABLED

#include <socket> // return cmd_callll(playerid, params);

#endif
////////////////////////   BE PHUONG BA TUOI ///////////////////////////////////


#include "./includes/LV/LV-Groups.pwn" // Nguyen Duy Phuong
//#include "./includes/LV/LV.pwn"   // Nguyen Duy Phuong


////////////////////////////////////////////////////////////////////////////////
#include "./includes/Scripts/antifly.pwn"
#include "./includes/Scripts/antislap.pwn"
#include "./includes/Scripts/ah.pwn"
#include "./includes/Scripts/antishot.pwn"
//#include "./includes/skin.pwn"
#include "./includes/Scripts/antigod.pwn"
#include "./includes/Scripts/glocker.pwn"
#include "./includes/Scripts/xinvieclv.pwn"
#include "./includes/Scripts/setkill.pwn"
#include "./includes/Scripts/chinhxedialog.pwn"
#include "./includes/Scripts/ghepxe.pwn"
//#include "./includes/Scripts/nangcapvukhi.pwn"
#include "./includes/Scripts/chungminhnhandan.pwn"
#include "./includes/Scripts/bekhoacong.pwn"
#include "./includes/Scripts/timvieclam.pwn"
#include "./includes/Scripts/phonedialog.pwn"
#include "./includes/Scripts/goto.pwn"
#include "./includes/Scripts/giveallserver.pwn"
#include "./includes/Scripts/congnhan.pwn"
#include "./includes/Scripts/eshopmember.pwn"
#include "./includes/Scripts/doan.pwn"
#include "./includes/Scripts/JobTrucker.pwn"
#include "./includes/Scripts/PizzaJob.pwn"
//#include "./includes/Scripts/Tazer.pwn"
////////////////////////////////////////////////////////////////////////////////
main() {}

public OnGameModeInit()
{
	print("Chuong trinh may chu dang duoc khoi dong, vui long cho doi....");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}
