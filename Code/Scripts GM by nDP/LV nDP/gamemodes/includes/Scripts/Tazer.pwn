//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//
// He thong Tazer by nDP


#include <YSI\y_hooks>

#define TAZE_WEAPON 23
#define TAZE_TIMER 5000
//#define TAZE_SPARK 18717
#define TAZE_DESTROY 1250
#define TAZE_LOSEHP 1

new Tazer[MAX_PLAYERS];
//new Spark[MAX_PLAYERS];
new Tazed[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    Tazed[playerid] = 0;
    Tazer[playerid] = 0;
	return 1;
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
    if(Tazer[playerid] == 1 && GetPlayerWeapon(playerid) == TAZE_WEAPON)
    {
        new Float:health,losehp;
        GetPlayerHealth(damagedid,health);
        losehp = TAZE_LOSEHP;
        if(Tazed[damagedid] == 1) return 1;
        new Float:x, Float:y, Float:z;
        GetPlayerPos(damagedid, x, y, z);
        ClearAnimations(damagedid);
        ApplyAnimation(damagedid,"PED","KO_skid_front",4.1,0,1,1,1,0);
        //Spark[damagedid] = CreateObject(TAZE_SPARK, x, y, z-3, 0, 0, 0);
        //SetTimerEx("DestroySpark", TAZE_DESTROY, 0, "i", damagedid);
        SetTimerEx("TazedRemove", TAZE_TIMER, 0, "i", damagedid);
        //TogglePlayerControllable(damagedid, 0);
        Tazed[damagedid] = 1;
        if(losehp) {} else SetPlayerHealth(damagedid, health+amount);
    }
	return 1;
}

//============================================================================//
/*forward DestroySpark(playerid);
hook DestroySpark(playerid)
{
        DestroyObject(Spark[playerid]);
        return 1;
}*/

//
forward TazedRemove(playerid);
hook TazedRemove(playerid)
{
        TogglePlayerControllable(playerid, 1);
        ClearAnimations(playerid);
        Tazed[playerid] = 0;
        return 1;
}

//============================== CMD =========================================//

CMD:sungdienfac(playerid, params[])
{

    new string[256];
    new sendername[MAX_PLAYER_NAME];
    GetPlayerName(playerid, sendername, sizeof(sendername));
    if(HungerPlayerInfo[playerid][hgInEvent] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the lam dieu nay khi dang tham gia su kien Hunger Games!");
    #if defined zombiemode
	if(zombieevent == 1 && GetPVarType(playerid, "pIsZombie")) return SendClientMessageEx(playerid, COLOR_GREY, "Zombies khong the su dung.");
	#endif
    if(IsACop(playerid))
	{
        if(PlayerCuffed[playerid] >= 1)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay bay gio.");
			return 1;
		}
		if(PlayerInfo[playerid][pJailTime] > 0)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay trong tu.");
			return 1;
		}
		if(PlayerCuffedTime[playerid] > 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
			return 1;
		}
		if(GetPVarInt(playerid, "Injured") == 1)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
			return 1;
		}
		if(GetPVarInt(playerid, "IsInArena") >= 0)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay bay gio, ban dang trong arena!");
			return 1;
		}
		if(GetPVarInt( playerid, "EventToken") != 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang tham gia su kien.");
			return 1;
		}
		if(PlayerInfo[playerid][pConnectHours] < 2 || PlayerInfo[playerid][pWRestricted] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the lay sung dien, ban dang bi han che vu khi!");

		if(IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay, ban dang trong xe.");
			return 1;
		}
		//
	    if(Tazer[playerid] == 0)
	    {
		    if(GetPlayerWeapon(playerid) == TAZE_WEAPON) {} else return SendClientMessage(playerid, 0xFFFFFFFF, "{DC0C0C}Tazer: {FFFFFF}You need to attach the tazer to a Silenced Pistol.");
		    Tazer[playerid] = 1;
		    format(string, sizeof(string), "{DC0C0C}Tazer: {FFFFFF}You attached the tazer to your Silenced Pistol, %s.", sendername);
		    SendClientMessage(playerid, 0xFFFFFFFF, string);
		    return 1;
	    }
	    else if(Tazer[playerid] == 1)
	    {
		    Tazer[playerid] = 0;
		    format(string, sizeof(string), "{DC0C0C}Tazer: {FFFFFF}You deattached the tazer from your Silenced Pistol, %s.", sendername);
		    SendClientMessage(playerid, 0xFFFFFFFF, string);
		    return 1;
	    }
	    else
		{
			Tazer[playerid] = 0;
		    return 1;
	    }
    }
    else return SendClientMessageEx(playerid, COLOR_GRAD2, "   Ban khong phai la nhan vien chinh phu!");
	return 1;
}
