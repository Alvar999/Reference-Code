/*-----------------------MohanedZzZ Anti-Cheats Filterscript-----------------------

                        -Filterscipt contains: Anti-RapidFire, Anti-Car Warp.

Súng ID 24 - Deagle
Súng ID 32 - Tec9
Súng ID 38 - Minigun
Súng ID 32 - Uzi
Súng ID 25 - Shotgun

=> Súng Deagle - Tec9 - Minigun - Uzi - Shotgun  = Vô hieu.

THE REASON:
I have disabled the following weapons: Uzi - Tec9 - Minigun.
Because they normally shoot fast. For example, uzi shoots 15 bullets in 2 seconds
Since they don't work in Rapidfire too, so this is why they've been disabled.
For the other weapons, they successfully work.
When a player uses Rapidfire on the other weapons except those up ^^^ he/she
will immediatly be (kicked).
Do not forget to change 'Kick' function to your gamemode's.
To see the code of the Rapidfire thing, go to OnPlayerWeaponShot.
Skype MohanedZahran
*/
//----------------------------------------Include(s)----------------------------
#include <a_samp> //a_samp.inc
new shotTime[MAX_PLAYERS];//Time bullets shot in a sec or two
new shot[MAX_PLAYERS];
new pVehicleMods[MAX_PLAYERS];
new pVehicles[MAX_PLAYERS];
//Booleans
new bool:   USE_ANTI_VEHICLE_HACK   = true;

//Settings
#define         MAX_ENTER_VEHICLES  3
//------------------------------------------------------------------------------
public OnFilterScriptInit()
{
        print("\n--------------------------------------");
        print("The Anti-Cheat system has been created by MoHaNeD14");
        print("--------------------------------------\n");
        return 1;
}
public OnFilterScriptExit()
{
        return 1;
}
forward VehicleModReset(playerid);
public VehicleModReset(playerid)
{
        pVehicleMods[playerid] = 0;
        return 1;
}
stock GetAntiVehicleHackStatus()
{
        new status[32];
        if(USE_ANTI_VEHICLE_HACK == true) { status = ""COL_NICEGREEN"ENABLED"COL_WHITE""; }
        else { status = ""COL_NICERED"DISABLED"COL_WHITE""; }
        return status;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
        // Vehicle hack detection
        if(USE_ANTI_VEHICLE_HACK == true)
        {
                if(IsPlayerInAnyVehicle(playerid) || newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
                {
                        pVehicles[playerid]++;
                        SetTimerEx("VehicleEnterReset", 3000, 0, "i", playerid);
                        if(pVehicles[playerid] >= MAX_ENTER_VEHICLES && GetPlayerVirtualWorld(playerid) != 1718)
                        {
                            //SendClientMessage(playerid, -1, "{FFFFFF}[ANTI-CHEAT]: {FF0000}[VEHICLE HACKS] - You have been kicked for vehicle hacks.");
                            //SetTimerEx("PlayerKick", 500, 0, "i", playerid);
                        }
                }
        }
        return 1;
}
public OnPlayerConnect(playerid)
{
                shotTime[playerid] =0;
                shot[playerid]=0;
                return 1;
}
forward OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
        if(GetPlayerWeapon(playerid) == 24 || GetPlayerWeapon(playerid) == 25 || GetPlayerWeapon(playerid) == 28 || GetPlayerWeapon(playerid) == 32 || GetPlayerWeapon(playerid) == 38)
        {
            return 1;
        }
        else
        {
                if((gettime() - shotTime[playerid]) < 1)
                {
                    shot[playerid]+=1;
                }
                else
                {
                    shot[playerid]=0;
                }
                if(shot[playerid] > 10)
                {
                    Kick(playerid);
                }
                shotTime[playerid] = gettime();
        }
        return 1;
}
forward PlayerKick(playerid);
public PlayerKick(playerid)
{
        Kick(playerid);
        return 1;
}
stock Kicked(playerid, time)
{
    SetTimerEx("PlayerKick", time, false, "i", playerid);
}
