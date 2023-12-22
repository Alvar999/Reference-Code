//-----------------------Firas's Anti-Cheats Filterscript-----------------------
//Filterscipt contains: Anti-weapon hack, Anti-car spam cheat, Anti-High ping (Max ping: 1000,you may change it), Anti-Spawning a jetpack
//----------------------------------------Include(s)----------------------------
#include <a_samp> //a_samp.inc
//------------------------------Forwards (two forwards)-------------------------
forward AntiHack();
forward HasIllegalWeapon(playerid);
//------------------------------------------------------------------------------
#define MAX_PING 1000 //Max ping is 1000, you may change it
//------------------------------------------------------------------------------
public OnFilterScriptInit()
{
        print("\n--------------------------------------");
        print("Anti-cheats filterscript by iFiras. 2013");
        print("--------------------------------------\n");
        return 1;
}
public OnFilterScriptExit()
{
        return 1;
}
public OnGameModeInit()
{
        SetTimer("AntiHack",1000,true);
        return 1;
}
public OnGameModeExit()
{
        return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
        if(newstate == PLAYER_STATE_DRIVER)
        {
                if((GetTickCount()-GetPVarInt(playerid, "CarTime")) < 1000) // Enters vehicle as driver faster than 1 once
            {
                        SetPVarInt(playerid, "CarSpam", GetPVarInt(playerid, "CarSpam")+1);
                        if(GetPVarInt(playerid, "CarSpam") >= 5) //Allows 5 seconds leeway to compensate for glitching, then kicks
                {
                        new pname[24];
                        new string[128];
                        GetPlayerName(playerid,pname,24);
                        format(string,sizeof(string),"* %s(%d) da bi kick vi troll car.",pname,playerid);
                        SendClientMessageToAll(-1,string);
                        printf(string);
                        Kick(playerid);
                }
                }
                SetPVarInt(playerid, "CarTime", GetTickCount());
        }
        return 1;
}
public AntiHack()
{
        for(new i=0; i<MAX_PLAYERS; i++)
        {
                if(IsPlayerConnected(i))
                {
                        new pname[24];
                        new string[128];
                        GetPlayerName(i,pname,sizeof(pname));
                        new pSpecialAction = GetPlayerSpecialAction(i);
                        if (pSpecialAction == SPECIAL_ACTION_USEJETPACK) //Anti-jetpack-hack
                        {
                                //format(string,sizeof(string),"* %s(%d) da bi ban vi hack jetpack.",pname,i);
                                //SendClientMessageToAll(-1,string);
                                //BanEx(i,"Spawning a jetpack");
                                return 1;
                        }
                        if(HasIllegalWeapon(i)) //If player spawned an illegal weapon = BAN
                        {
                                //format(string,sizeof(string),"* %s(%d) da bi ban vi hack weapon.",pname,i);
                                //SendClientMessageToAll(-1,string);
                                //BanEx(i,"Spawning an illegal weapon");
                                return 1;
                        }
                        //Anti high ping
                        if(GetPlayerPing(i) >= MAX_PING)
                        {
                                //format(string,sizeof(string),"* %s(%d) da bi kick vi ping cao [%d/%d].",pname,i,GetPlayerPing(i),MAX_PING);
                                //SendClientMessageToAll(-1,string);
                                //Kick(i);
                                return 1;
                        }
                }
        }
        return 1;
}
public HasIllegalWeapon(playerid)
{
        if(GetPlayerWeapon(playerid) == 16 || GetPlayerWeapon(playerid) == 17 || GetPlayerWeapon(playerid) == 35 ||
        GetPlayerWeapon(playerid) == 36 || GetPlayerWeapon(playerid) == 37 || GetPlayerWeapon(playerid) == 38 ||
        GetPlayerWeapon(playerid) == 39 || GetPlayerWeapon(playerid) == 40 || GetPlayerWeapon(playerid) == 18)
        {
            return 1;
        }
        return 0;
}
