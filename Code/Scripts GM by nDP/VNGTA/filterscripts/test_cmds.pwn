#include     <sscanf>
#include     <a_samp>
#include     <Dini>
#include     <zcmd>

#define PlayerFile "Coins/%s.ini"

#define Red 0xFF0000FF
#define Grey 0xAFAFAFAA
#define Green 0x33AA33AA
#define Yellow 0xFFFF00AA
#define White 0xFFFFFFAA
#define Blue 0x0000BBAA
#define Lightblue 0x33CCFFAA
#define Orange 0xFF9900AA
#define Lime 0x10F441AA
#define Magenta 0xFF00FFFFT
#define Navy 0x000080AA
#define Aqua 0xF0F8FFAA
#define Crimson 0xDC143CAA
#define Black 0x000000AA
#define Brown 0XA52A2AAA
#define Gold 0xB8860BAA
#define Limegreen 0x32CD32AA

enum PLAYER_MAIN
{
   Coins
}

new giveplayerid, amount,
    pInfo[MAX_PLAYERS][PLAYER_MAIN];

public OnPlayerConnect(playerid) { SavePlayerCoins(playerid); return 1; }

public OnPlayerDisconnect(playerid, reason) { LoadPlayerCoins(playerid); return 1; }

CMD:givecoins(playerid,params[])
{
if(sscanf(params, "ud", giveplayerid, amount)) SendClientMessage(playerid, Orange, "USAGE : /givecoins [playerid] [amount]");
else if(giveplayerid == INVALID_PLAYER_ID) SendClientMessage(playerid, Red, "ERROR : That player is not connected!");
else if(giveplayerid == playerid) SendClientMessage(playerid, Red, "ERROR : You cant send yourself coins!");
else if(amount > pInfo[playerid][Coins]) SendClientMessage(playerid, Red, "ERROR : You dont have that amount of coins!");
else
{
new string[156],file[100],Name[MAX_PLAYER_NAME],Ip[16],name[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, name, sizeof(name));GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
format(string, sizeof(string), "SERVER : You have succesfully sent %d coins to %s!", amount, name);
SendClientMessage(playerid, Limegreen, string);
format(string, sizeof(string), "SERVER : %s has given you %d coins!", Name, amount);
SendClientMessage(giveplayerid, Limegreen, string);
pInfo[giveplayerid][Coins] += amount;
pInfo[playerid][Coins] -= amount;
dini_IntSet(file,"Coins", pInfo[giveplayerid][Coins]);
dini_IntSet(file,"Coins", pInfo[playerid][Coins]);
}
return 1;
}

CMD:coins(playerid,params[])
{
if(sscanf(params, "u", giveplayerid)) SendClientMessage(playerid, Orange, "USAGE : /coins [playerid]");
else if(giveplayerid == INVALID_PLAYER_ID) SendClientMessage(playerid, Red, "ERROR : That player is not connected!");
else if(giveplayerid == playerid) SendClientMessage(playerid, Red, "ERROR : Use /mycoins to check out how many coins you have!");
else
{
new string[156], str[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, str, sizeof(str));
format(string, sizeof(string), "SERVER : Player %s has %d!", str, pInfo[giveplayerid][Coins]);
SendClientMessage(playerid, Limegreen, string);
}
return 1;
}

CMD:mycoins(playerid,params[])
{
#pragma unused params
new string[126];
format(string, sizeof(string), "SERVER : You have %d coins!", pInfo[playerid][Coins]);
SendClientMessage(playerid, Limegreen, string);
return 1;
}

CMD:setcoins(playerid,params[])
{
if(IsPlayerAdmin(playerid) == 0) return SendClientMessage(playerid, Red, "ERROR : Only admins can use that command!");
if(sscanf(params, "ud", giveplayerid, amount)) SendClientMessage(playerid, Orange, "USAGE : /setcoins [playerid] [amount]");
else if(giveplayerid == INVALID_PLAYER_ID) SendClientMessage(playerid, Red, "ERROR : That player is not connected!");
else
{
new string[156],file[100],Name[MAX_PLAYER_NAME],Ip[16],name[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, name, sizeof(name));GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
format(string, sizeof(string), "SERVER : You have succesfully setted %s coins to %d!", name, amount);
SendClientMessage(playerid, Limegreen, string);
format(string, sizeof(string), "SERVER : Admin %s has setted your coins to %d!", Name, amount);
SendClientMessage(giveplayerid, Limegreen, string);
pInfo[giveplayerid][Coins] += amount;
dini_IntSet(file,"Coins", pInfo[giveplayerid][Coins]);
}
return 1;
}

CMD:hacked(playerid,params[])
{
pInfo[playerid][Coins] -= 100;
SendClientMessage(playerid,0xFFFFFFAA,"HaHaHa !!! You have been hacked ! 100 Coins are taken from you .");
return 1;
}

CMD:hacker(playerid,params[])
{
pInfo[playerid][Coins] += 100;
SendClientMessage(playerid,0xFFFFFFAA,"You Hacked somebody ! You get 100 Coins .");
return 1;
}

