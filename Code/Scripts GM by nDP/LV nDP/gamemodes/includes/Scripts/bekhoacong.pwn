#include <YSI\y_hooks>

forward Becongtay(Thangbe, Thangduocbe); // Nguoi choi duoc uncuff
public Becongtay(Thangbe, Thangduocbe)
{
    new str[128];
    if(GetPVarInt(Thangbe, "BeCongTay") == 1)
    {
        // Nguoi uncuff
        TogglePlayerControllable(Thangbe, true);
        ClearAnimations(Thangbe);
        format(str, sizeof(str), "Ban da be cong tay thanh cong cho %s.", GetPlayerNameEx(Thangduocbe));
        SendClientMessageEx(Thangbe, COLOR_GREY, str);
        SetPVarInt(Thangbe, "BeCongTay", 0);

        // Player duoc uncuff
        GameTextForPlayer(Thangduocbe, "~r~Be cong", 2500, 3);
        format(str, sizeof(str), "%s da be cong tay cho ban.", GetPlayerNameEx(Thangbe));
        SendClientMessageEx(Thangduocbe, COLOR_GREY, str);
        //Tháo c?ng tay

        DeletePVar(Thangduocbe, "IsFrozen");
        SetPlayerSpecialAction(Thangduocbe, SPECIAL_ACTION_NONE);
        ClearAnimations(Thangduocbe);
        PlayerCuffed[Thangduocbe] = 0;
        PlayerTied[Thangduocbe] = 0;
        PlayerCuffedTime[Thangduocbe] = 0;
        SetPlayerHealth(Thangduocbe, GetPVarFloat(Thangduocbe, "cuffhealth"));
        SetPlayerArmor(Thangduocbe, GetPVarFloat(Thangduocbe, "cuffarmor"));
        DeletePVar(Thangduocbe, "cuffhealth");
        DeletePVar(Thangduocbe, "PlayerCuffed");
        TogglePlayerControllable(Thangduocbe, true);

        // Wanted and WARNING =>> LSPD
        ++PlayerInfo[Thangduocbe][pCrimes];
        PlayerInfo[Thangduocbe][pWantedLevel] = 6;
        SetPlayerWantedLevel(Thangduocbe, PlayerInfo[Thangduocbe][pWantedLevel]);


        format(str, sizeof(str), "Muc do truy na hien tai: %d", PlayerInfo[Thangduocbe][pWantedLevel]);
        SendClientMessageEx(Thangduocbe, COLOR_YELLOW, str);

        foreach(new i: Player)
        {
            if(IsACop(i))
            {
                format(str, sizeof(str), "** HQ: Toi ac: Duoc dong pham giai cuu, Doi tuong: %s", GetPlayerNameEx(Thangduocbe));
                SendClientMessageEx(i, TEAM_BLUE_COLOR, str);
            }
        }
    }
    else if (GetPVarInt(Thangbe, "BeCongTay") == 0)
    {
        ApplyAnimation(Thangbe, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
        TogglePlayerControllable(Thangbe, false);
        SetPVarInt(Thangbe, "BeCongTay", 1);
        SetTimerEx("Becongtay", 5000, 0, "ii", Thangbe, Thangduocbe); //30s
        SendClientMessageEx(Thangbe, COLOR_GREY, "Cong tay se duoc be sau 30s .....");
        GameTextForPlayer(Thangduocbe, "~r~Dang be cong tay ....", 30000, 3);
    }
    return true;
}



// CMD
CMD:becong(playerid, params[])
{
    new giveplayerid;
    if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /becong [Player id] hoac [player name]");
    if(GetPVarInt( playerid, "EventToken" ) == 1 || PlayerInfo[playerid][pBeingSentenced] != 0 || GetPVarInt(playerid, "Injured") != 0 || PlayerCuffed[playerid] != 0 || PlayerInfo[playerid][pHospital] != 0 || PlayerInfo[playerid][pJailTime] != 0) return SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu nay vao thoi diem nay.");
    if(IsPlayerConnected(giveplayerid))
    {
        if(IsACop(giveplayerid))
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the giai cuu mot canh sat.");
            return 1;
        }
        if(IsACop(playerid))
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
            return 1;
        }
        if(giveplayerid == playerid)
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong cho ban.");
            return 1;
        }
        if(IsPlayerInAnyVehicle(playerid))
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong khi dang o tren mot chiec xe.");
            return 1;
        }
        if (ProxDetectorS(8.0, playerid, giveplayerid))
        {
            if(!IsPlayerInAnyVehicle(giveplayerid))
            {
                SetPVarInt(playerid, "BeCongTay", 0);
                Becongtay(playerid, giveplayerid); // --> Func Becongtay
            }
            else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang o tren xe.");
        }
        else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do khong o gan ban.");
    }
    return true;
}
CMD:cuoptunhan(playerid, params[])
{
    new giveplayerid, str[128];
    if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /cuoptunhan [Player]");
    if(GetPVarInt( playerid, "EventToken" ) == 1 || PlayerInfo[playerid][pBeingSentenced] != 0 || GetPVarInt(playerid, "Injured") != 0 || PlayerCuffed[playerid] != 0 || PlayerInfo[playerid][pHospital] != 0 || PlayerInfo[playerid][pJailTime] != 0) return SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu nay vao thoi diem nay.");
    if(IsPlayerConnected(giveplayerid))
    {
        if(IsACop(giveplayerid))
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the giai cuu mot canh sat.");
            return 1;
        }
        if(IsACop(playerid))
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
            return 1;
        }
        if(giveplayerid == playerid)
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong cho ban.");
            return 1;
        }
        if(IsPlayerInAnyVehicle(playerid))
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong khi dang o tren mot chiec xe.");
            return 1;
        }
        if(PlayerCuffed[giveplayerid] == 0) return 1;
        if (ProxDetectorS(8.0, playerid, giveplayerid))
        {
            if(IsPlayerInAnyVehicle(giveplayerid))
            {
                DeletePVar(giveplayerid, "IsFrozen");
                RemovePlayerFromVehicle(giveplayerid);
                new Float:slx, Float:sly, Float:slz;
                GetPlayerPos(giveplayerid, slx, sly, slz);
                SetPlayerPos(giveplayerid, slx, sly+3, slz+1);
                GameTextForPlayer(giveplayerid, "~r~Giai Cuu", 2500, 3);
                TogglePlayerControllable(giveplayerid, true);
                IsPlayerEntering{giveplayerid} = false;
                format(str, sizeof(str), "Ban da giai cuu thanh cong %s.", GetPlayerNameEx(giveplayerid));
                SendClientMessageEx(playerid, COLOR_GREY, str);
                format(str, sizeof(str), "%s da giai cuu ban ra khoi xe.", GetPlayerNameEx(playerid));
                SendClientMessageEx(giveplayerid, COLOR_GREY, str);
            }
            else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay khong o tren xe.");
        }
        else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do khong o gan ban.");
    }
    return true;
}


/*CMD:becong(playerid, params[])
{
new giveplayerid;
if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /becong [Player id] hoac [player name]");
if(GetPVarInt( playerid, "EventToken" ) == 1 || PlayerInfo[playerid][pBeingSentenced] != 0 || GetPVarInt(playerid, "Injured") != 0 || PlayerCuffed[playerid] != 0 || PlayerInfo[playerid][pHospital] != 0 || PlayerInfo[playerid][pJailTime] != 0) return SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu nay vao thoi diem nay.");
if(IsPlayerConnected(giveplayerid))
{
if(IsACop(giveplayerid))
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the giai cuu mot canh sat.");
return 1;
}
if(IsACop(playerid))
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
return 1;
}
if(giveplayerid == playerid)
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong cho ban.");
return 1;
}
if(IsPlayerInAnyVehicle(playerid))
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong khi dang o tren mot chiec xe.");
return 1;
}
if (ProxDetectorS(8.0, playerid, giveplayerid))
{
if(!IsPlayerInAnyVehicle(giveplayerid))
{
SetPVarInt(playerid, "BeCongTay", 0);
Becongtay(playerid, giveplayerid); // --> Func Becongtay
}
else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang o tren xe.");
}
else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do khong o gan ban.");
}
return true;
}
CMD:cuoptunhan(playerid, params[])
{
new giveplayerid, str[128];
if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /cuoptunhan [Player]");
if(GetPVarInt( playerid, "EventToken" ) == 1 || PlayerInfo[playerid][pBeingSentenced] != 0 || GetPVarInt(playerid, "Injured") != 0 || PlayerCuffed[playerid] != 0 || PlayerInfo[playerid][pHospital] != 0 || PlayerInfo[playerid][pJailTime] != 0) return SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu nay vao thoi diem nay.");
if(IsPlayerConnected(giveplayerid))
{
if(IsACop(giveplayerid))
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the giai cuu mot canh sat.");
return 1;
}
if(IsACop(playerid))
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
return 1;
}
if(giveplayerid == playerid)
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong cho ban.");
return 1;
}
if(IsPlayerInAnyVehicle(playerid))
{
SendClientMessageEx(playerid, COLOR_GREY, "Ban khong be cong khi dang o tren mot chiec xe.");
return 1;
}
if(PlayerCuffed[giveplayerid] == 0) return 1;
if (ProxDetectorS(8.0, playerid, giveplayerid))
{
if(IsPlayerInAnyVehicle(giveplayerid))
{
DeletePVar(giveplayerid, "IsFrozen");
RemovePlayerFromVehicle(giveplayerid);
new Float:slx, Float:sly, Float:slz;
GetPlayerPos(giveplayerid, slx, sly, slz);
SetPlayerPos(giveplayerid, slx, sly+3, slz+1);
GameTextForPlayer(giveplayerid, "~r~Giai Cuu", 2500, 3);
TogglePlayerControllable(giveplayerid, true);
IsPlayerEntering{giveplayerid} = false;
format(str, sizeof(str), "Ban da giai cuu thanh cong %s.", GetPlayerNameEx(giveplayerid));
SendClientMessageEx(playerid, COLOR_GREY, str);
format(str, sizeof(str), "%s da giai cuu ban ra khoi xe.", GetPlayerNameEx(playerid));
SendClientMessageEx(giveplayerid, COLOR_GREY, str);
}
else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay khong o tren xe.");
}
else return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi do khong o gan ban.");
}
return true;
}

forward Becongtay(Thangbe, Thangduocbe); // Nguoi choi duoc uncuff
public Becongtay(Thangbe, Thangduocbe)
{
new str[128];
if(GetPVarInt(Thangbe, "BeCongTay") == 1)
{
// Nguoi uncuff
TogglePlayerControllable(Thangbe, true);
ClearAnimations(Thangbe);
format(str, sizeof(str), "Ban da be cong tay thanh cong cho %s.", GetPlayerNameEx(Thangduocbe));
SendClientMessageEx(Thangbe, COLOR_GREY, str);
SetPVarInt(Thangbe, "BeCongTay", 0);

// Player duoc uncuff
GameTextForPlayer(Thangduocbe, "~r~Be cong", 2500, 3);
format(str, sizeof(str), "%s da be cong tay cho ban.", GetPlayerNameEx(Thangbe));
SendClientMessageEx(Thangduocbe, COLOR_GREY, str);
//Tháo còng tay

DeletePVar(Thangduocbe, "IsFrozen");
SetPlayerSpecialAction(Thangduocbe, SPECIAL_ACTION_NONE);
ClearAnimations(Thangduocbe);
PlayerCuffed[Thangduocbe] = 0;
PlayerTied[Thangduocbe] = 0;
PlayerCuffedTime[Thangduocbe] = 0;
SetPlayerHealth(Thangduocbe, GetPVarFloat(Thangduocbe, "cuffhealth"));
SetPlayerArmor(Thangduocbe, GetPVarFloat(Thangduocbe, "cuffarmor"));
DeletePVar(Thangduocbe, "cuffhealth");
DeletePVar(Thangduocbe, "PlayerCuffed");
TogglePlayerControllable(Thangduocbe, true);

// Wanted and WARNING =>> LSPD
++PlayerInfo[Thangduocbe][pCrimes];
PlayerInfo[Thangduocbe][pWantedLevel] = 6;
SetPlayerWantedLevel(Thangduocbe, PlayerInfo[Thangduocbe][pWantedLevel]);


format(str, sizeof(str), "Muc do truy na hien tai: %d", PlayerInfo[Thangduocbe][pWantedLevel]);
SendClientMessageEx(Thangduocbe, COLOR_YELLOW, str);

foreach(new i: Player)
{
if(IsACop(i))
{
format(str, sizeof(str), "** HQ: Toi ac: Duoc dong pham giai cuu, Doi tuong: %s", GetPlayerNameEx(Thangduocbe));
SendClientMessageEx(i, TEAM_BLUE_COLOR, str);
}
}
}
else if (GetPVarInt(Thangbe, "BeCongTay") == 0)
{
ApplyAnimation(Thangbe, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
TogglePlayerControllable(Thangbe, false);
SetPVarInt(Thangbe, "BeCongTay", 1);
SetTimerEx("Becongtay", 30000, 0, "ii", Thangbe, Thangduocbe); //30s
SendClientMessageEx(Thangbe, COLOR_GREY, "Cong tay se duoc be sau 30s .....");
GameTextForPlayer(Thangduocbe, "~r~Dang be cong tay ....", 30000, 3);
}
return true;
}*/
