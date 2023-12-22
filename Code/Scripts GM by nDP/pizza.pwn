//OnPlayerEnterCheckpoint
    if(CP[playerid] == 52020)
	{
		DisablePlayerCheckpoint(playerid);
		new randommoney = 10000+random(50000);
		PlayerInfo[killerid][pCash] += randommoney;
		SendClientMessageEx(COLOR_LIGHTBLUE, "* Ban da giao pizza den diem hen, va da nhan duoc tien thuong tu viec giao pizza do.");
		return 1;
	}

new Float:Randompizza[][4] =
{
    {2489.3064,1445.9829,10.9063},
    {2116.7471,960.7538,10.8203},
    {2116.7471,960.7538,10.8203},
    {2363.2200,2377.2461,10.8203}
};

CMD:laybanh(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 21 || PlayerInfo[playerid][pJob2] == 21)
	{
		if(!GetPVarType(playerid, "Pizza"))
		{
		    if(IsPlayerInAnyVehicle(playerid))
		    {
				if(IsPlayerInRangeOfPoint(playerid, 3.0, 2092.5635,-1802.7292,13.5488))
				{
				    if(GetPlayerSkin(playerid) != 155)
				    {
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong mac quan ao Pizza boy khong the lam viec.");
				        return 1;
				    }
				    if(!IsAPizzaCar(GetPlayerVehicleID(playerid)))
					{
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong chay xe Pizza Stack khong the lam viec.");
				        return 1;
				    }
				    new rand = random(sizeof(Randompizza));
                    SetPlayerCheckpoint(playerid, Randompizza[rand][0], Randompizza[rand][1],Randompizza[rand][2],Randompizza[rand][3]);
                    CP[playerid] = 52020;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_WHITE,"Ban khong dung trong diem lay banh.");
					return 1;
				}
			}
			else return SendClientMessageEx(playerid, COLOR_WHITE,"Ban dang cung cap pizza.");
		}
		else return SendClientMessageEx(playerid, COLOR_WHITE,"Ban can phai o tren xe de lay banh.");
	}
	else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong phai la PizzaBoy.");
	return 1;
}
