
#include "ysi\y_hooks"

#define MAX_LEVELGUN 6

stock GetLevelGun(level)
{
	new name[82];
	switch(level)
	{
		case 0: name = "{33ccff}Zin{ffffff}";
		case 1: name = "{00ff99}Rare{ffffff}";
		case 2: name = "{ff66ff}Epic{ffffff}";
		case 3: name = "{ffcc66}Unipue{ffffff}";
		case 4: name = "{66ff33}Legendary{ffffff}";
		case 5: name = "{FF3300}Mystic{ffffff}";
		case 6: name = "{9900FF}Trum{ffffff}";
	}
	return name;
}

SendDamage(playerid, damagedid, Float:amount, weaponid)
{
	if(GetPVarInt(damagedid, "IsInArena") >= 0) return 1;
   	if(GetPVarInt(damagedid, "EventToken") != 0) return 1;

	new Float:TotalDamage, Float:Health, Float:Armor;
   	new PlayerVar;
   	if(weaponid == 24)
   	{
   		PlayerVar = PlayerInfo[playerid][pDeagle];
   		if(PlayerVar == 0) TotalDamage = 42;
		if(PlayerVar == 1) TotalDamage = 44;
		if(PlayerVar == 2) TotalDamage = 46;
		if(PlayerVar == 3) TotalDamage = 48;
		if(PlayerVar == 4) TotalDamage = 50;
		if(PlayerVar == 5) TotalDamage = 52;
		if(PlayerVar == 6) TotalDamage = 55;
		//TotalDamage = amount + PlayerVar;
   	}
  	else if(weaponid == 30)
   	{
   		PlayerVar = PlayerInfo[playerid][pAK];
   		if(PlayerVar == 0) TotalDamage = 6;
		if(PlayerVar == 1) TotalDamage = 8;
		if(PlayerVar == 2) TotalDamage = 10;
		if(PlayerVar == 3) TotalDamage = 12;
		if(PlayerVar == 4) TotalDamage = 14;
		if(PlayerVar == 5) TotalDamage = 16;
		if(PlayerVar == 6) TotalDamage = 19;
   		//TotalDamage = amount + PlayerVar;
   	}
  	else if(weaponid == 31)
   	{
   		PlayerVar = PlayerInfo[playerid][pM4];
   		if(PlayerVar == 0) TotalDamage = 6;
		if(PlayerVar == 1) TotalDamage = 9;
		if(PlayerVar == 2) TotalDamage = 12;
		if(PlayerVar == 3) TotalDamage = 15;
		if(PlayerVar == 4) TotalDamage = 18;
		if(PlayerVar == 5) TotalDamage = 21;
		if(PlayerVar == 6) TotalDamage = 24;
   		//TotalDamage = amount + PlayerVar;
   	}
  	else if(weaponid == 34)
   	{
   		PlayerVar = PlayerInfo[playerid][pSniper];
   		if(PlayerVar == 0) TotalDamage = 52;
		if(PlayerVar == 1) TotalDamage = 53;
		if(PlayerVar == 2) TotalDamage = 54;
		if(PlayerVar == 3) TotalDamage = 55;
		if(PlayerVar == 4) TotalDamage = 56;
		if(PlayerVar == 5) TotalDamage = 57;
		if(PlayerVar == 6) TotalDamage = 60;
   		//TotalDamage = amount + PlayerVar;
   	}
  	else if(weaponid == 29)
   	{
   		PlayerVar = PlayerInfo[playerid][pMP5];
   		if(PlayerVar == 0) TotalDamage = 5;
		if(PlayerVar == 1) TotalDamage = 6.5;
		if(PlayerVar == 2) TotalDamage = 8;
		if(PlayerVar == 3) TotalDamage = 9.5;
		if(PlayerVar == 4) TotalDamage = 11;
		if(PlayerVar == 5) TotalDamage = 11;
		if(PlayerVar == 6) TotalDamage = 12.5;
   		//TotalDamage = amount + PlayerVar;
   	}
   	else if(weaponid == 27)
   	{
   		PlayerVar = PlayerInfo[playerid][pSpas12];
   		if(PlayerVar == 0) TotalDamage = 27;
		if(PlayerVar == 1) TotalDamage = 29;
		if(PlayerVar == 2) TotalDamage = 31;
		if(PlayerVar == 3) TotalDamage = 33;
		if(PlayerVar == 4) TotalDamage = 35;
		if(PlayerVar == 5) TotalDamage = 37;
		if(PlayerVar == 6) TotalDamage = 40;
   		//TotalDamage = amount + PlayerVar;
   	}
   	else if(weaponid == 25)
   	{
   		PlayerVar = PlayerInfo[playerid][pShotgun];
   		if(PlayerVar == 0) TotalDamage = 22;
		if(PlayerVar == 1) TotalDamage = 24;
		if(PlayerVar == 2) TotalDamage = 26;
		if(PlayerVar == 3) TotalDamage = 28;
		if(PlayerVar == 4) TotalDamage = 30;
		if(PlayerVar == 5) TotalDamage = 32;
		if(PlayerVar == 6) TotalDamage = 35;
   		//TotalDamage = amount + PlayerVar;
   	}
   	else if(weaponid == 32)
   	{
   		PlayerVar = PlayerInfo[playerid][pTec9];
   		if(PlayerVar == 0) TotalDamage = 2.6;
		if(PlayerVar == 1) TotalDamage = 4.6;
		if(PlayerVar == 2) TotalDamage = 6.6;
		if(PlayerVar == 3) TotalDamage = 8.6;
		if(PlayerVar == 4) TotalDamage = 10.6;
		if(PlayerVar == 5) TotalDamage = 12.6;
		if(PlayerVar == 6) TotalDamage = 15;
   		//TotalDamage = amount + PlayerVar;
   	}
   	else if(weaponid == 23)
   	{
   		PlayerVar = PlayerInfo[playerid][pS9mm];
   		if(PlayerVar == 0) TotalDamage = 13.2;
		if(PlayerVar == 1) TotalDamage = 15.2;
		if(PlayerVar == 2) TotalDamage = 17.2;
		if(PlayerVar == 3) TotalDamage = 19.2;
		if(PlayerVar == 4) TotalDamage = 21.2;
		if(PlayerVar == 5) TotalDamage = 23.2;
		if(PlayerVar == 6) TotalDamage = 26;
   		//TotalDamage = amount + PlayerVar;
   	}
   	else if(weaponid == 22)
   	{
   		PlayerVar = PlayerInfo[playerid][p9mm];
   		if(PlayerVar == 0) TotalDamage = 8.25;
		if(PlayerVar == 1) TotalDamage = 10.25;
		if(PlayerVar == 2) TotalDamage = 12.25;
		if(PlayerVar == 3) TotalDamage = 14.25;
		if(PlayerVar == 4) TotalDamage = 16.25;
		if(PlayerVar == 5) TotalDamage = 18.25;
		if(PlayerVar == 6) TotalDamage = 21;
   		//TotalDamage = amount + PlayerVar;
   	}
   	else TotalDamage = amount;
   	GetPlayerHealth(damagedid, Health);
   	GetPlayerArmour(damagedid, Armor);
   	if(Health > TotalDamage && Armor < 1)
	{
		SetPlayerHealth(damagedid, Health - TotalDamage);
	}
	if(Armor > TotalDamage)
	{
		SetPlayerArmour(damagedid, Armor - TotalDamage);
	}
	else
	{
	 	SetPlayerArmour(damagedid, 0);
	 	SetPlayerHealth(damagedid, (Health - TotalDamage) + Armor);
	}
	SendHistory(playerid, damagedid , TotalDamage , weaponid , PlayerVar);
	return 1;
}

SendHistory(playerid, playerid1 , Float:amount , weapon , Levelgun)
{
	new string[155], string1[155], Namex[MAX_PLAYER_NAME];
	GetWeaponName(weapon, Namex, MAX_PLAYER_NAME);
	format(string, 155, "[{ff0033}+%.02f{ffffff}] [{FF6600}%s{FFFFFF}] [{99FF00}%s %s] ", amount ,GetPlayerNameEx(playerid1), Namex, GetLevelGun(Levelgun));
	format(string1, 155, "[{ff0000}-%.02f{ffffff}] [{FFCC33}%s{FFFFFF}] [{339966}%s %s] ", amount ,GetPlayerNameEx(playerid), Namex, GetLevelGun(Levelgun));
	SendClientMessage(playerid, -1, string);
	SendClientMessage(playerid1, -1, string1);
	PlayerPlaySound(playerid, 17804, 0, 0, 0);
}

CMD:nangcapsunggg(playerid)
{
	if(!IsAblePedAnimation(playerid)) return 1;
   	PlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
	ShowPlayerDialog(playerid, DIALOG_NANGCAPSUNG, DIALOG_STYLE_LIST, "Nang cap sung", "Deagle\nM4a1\nAK-47\nSniper\nMP5\nSpas12\nShotgun\nTec-9\nSilenced 9mm\n9mm", "Chon", "Thoat");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[500];
	if(dialogid == DIALOG_NANGCAPSUNG && response)
	{
		new UpdateWeapons;
		if(listitem == 0)
		{
			if(PlayerInfo[playerid][pDeagle] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pDeagle] + 1) * 40000000;
			format(string, sizeof string, "\n{ffffff}Sung : Deagle\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : Deagle %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pDeagle]+1));
			SetPVarInt(playerid, "GunID?", 24);
		}
		if(listitem == 1)
		{
			if(PlayerInfo[playerid][pM4] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pM4] + 1) * 60000000; // sam
			format(string, sizeof string, "\n{ffffff}Sung : M4A1\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : M4A1 %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pM4]+1));
			SetPVarInt(playerid, "GunID?", 31);
		}
		if(listitem == 2)
		{
			if(PlayerInfo[playerid][pAK] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pAK] + 1) * 60000000;
			format(string, sizeof string, "\n{ffffff}Sung : AKM\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : AKM %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pAK]+1));
			SetPVarInt(playerid, "GunID?", 30);
		}
		if(listitem == 3)
		{
			if(PlayerInfo[playerid][pSniper] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pSniper] + 1) * 100000000;
			format(string, sizeof string, "\n{ffffff}Sung : Sniper\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : Sniper %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pSniper]+1));
			SetPVarInt(playerid, "GunID?", 34);
		}
		if(listitem == 4)
		{
			if(PlayerInfo[playerid][pMP5] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pMP5] + 1) * 30000000;
			format(string, sizeof string, "\n{ffffff}Sung : MP5\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : MP5 %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pMP5]+1));
			SetPVarInt(playerid, "GunID?", 29);
		}
		if(listitem == 5)
		{
			if(PlayerInfo[playerid][pSpas12] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pSpas12] + 1) * 60000000;
			format(string, sizeof string, "\n{ffffff}Sung : Spas-12\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : Spas12 %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pSpas12]+1));
			SetPVarInt(playerid, "GunID?", 27);
		}
		if(listitem == 6)
		{
			if(PlayerInfo[playerid][pShotgun] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pShotgun] + 1) * 20000000;
			format(string, sizeof string, "\n{ffffff}Sung : Shotgun\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : Shotgun %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pShotgun]+1));
			SetPVarInt(playerid, "GunID?", 25);
		}
		//
		if(listitem == 7) // pS9mm
		{
			if(PlayerInfo[playerid][pTec9] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pTec9] + 1) * 20000000;
			format(string, sizeof string, "\n{ffffff}Sung : Tec-9\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : Tec-9 %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pTec9]+1));
			SetPVarInt(playerid, "GunID?", 32);
		}
		if(listitem == 8) // pS9mm
		{
			if(PlayerInfo[playerid][pS9mm] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][pS9mm] + 1) * 20000000;
			format(string, sizeof string, "\n{ffffff}Sung : Silenced 9mm\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : Silenced 9mm %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][pS9mm]+1));
			SetPVarInt(playerid, "GunID?", 23);
		}
		if(listitem == 9) // pS9mm
		{
			if(PlayerInfo[playerid][p9mm] == MAX_LEVELGUN) return SendClientMessage(playerid, -1, "[!] : Sung cua ban da max cap do");
			UpdateWeapons = (PlayerInfo[playerid][p9mm] + 1) * 20000000;
			format(string, sizeof string, "\n{ffffff}Sung : 9mm\n\nGia tien : {66ff33}%d ${66ff33}\n\nCap tiep theo : 9mm %s\n", UpdateWeapons , GetLevelGun(PlayerInfo[playerid][p9mm]+1));
			SetPVarInt(playerid, "GunID?", 22);
		}
		SetPVarInt(playerid, "PriceUp?", UpdateWeapons);
		ShowPlayerDialog(playerid, DIALOG_NANGCAPSUNG1, DIALOG_STYLE_MSGBOX, "Nang cap sung", string, "Nang", "Huy");
	}
	if(dialogid == DIALOG_NANGCAPSUNG1)
	{
		if(response)
		{
			new gunid = GetPVarInt(playerid, "GunID?") , price = GetPVarInt(playerid, "PriceUp?");
			if(price > PlayerInfo[playerid][pCash]) return SendClientMessage(playerid, -1, "* Ban khong du $ de nang cap vu khi");
			if(gunid == 24)
			{
				PlayerInfo[playerid][pDeagle]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : Deagle %s > Deagle %s", GetLevelGun(PlayerInfo[playerid][pDeagle]-1), GetLevelGun(PlayerInfo[playerid][pDeagle]));
			}
			if(gunid == 30)
			{
				PlayerInfo[playerid][pAK]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : AKM %s > AKM %s", GetLevelGun(PlayerInfo[playerid][pAK]-1), GetLevelGun(PlayerInfo[playerid][pAK]));
			}
			if(gunid == 31)
			{
				PlayerInfo[playerid][pM4]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : M4A1 %s > M4A1 %s", GetLevelGun(PlayerInfo[playerid][pM4]-1), GetLevelGun(PlayerInfo[playerid][pM4]));
			}
			if(gunid == 34)
			{
				PlayerInfo[playerid][pSniper]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : Sniper %s > Sniper %s", GetLevelGun(PlayerInfo[playerid][pSniper]-1), GetLevelGun(PlayerInfo[playerid][pSniper]));
			}
			if(gunid == 29)
			{
				PlayerInfo[playerid][pMP5]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : MP5 %s > MP5 %s", GetLevelGun(PlayerInfo[playerid][pMP5]-1), GetLevelGun(PlayerInfo[playerid][pMP5]));
			}
			if(gunid == 27)
			{
				PlayerInfo[playerid][pSpas12]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : SPAS-12 %s > SPAS-12 %s", GetLevelGun(PlayerInfo[playerid][pSpas12]-1), GetLevelGun(PlayerInfo[playerid][pSpas12]));
			}
			if(gunid == 25)
			{
				PlayerInfo[playerid][pShotgun]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : SHOTGUN %s > SHOTGUN %s", GetLevelGun(PlayerInfo[playerid][pShotgun]-1), GetLevelGun(PlayerInfo[playerid][pShotgun]));
			} // pS9mm
			if(gunid == 32)
			{
				PlayerInfo[playerid][pTec9]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : Tec-9 %s > Tec-9 %s", GetLevelGun(PlayerInfo[playerid][pTec9]-1), GetLevelGun(PlayerInfo[playerid][pTec9]));
			}
			if(gunid == 23)
			{
				PlayerInfo[playerid][pS9mm]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : Silenced 9mm %s > Silenced 9mm %s", GetLevelGun(PlayerInfo[playerid][pS9mm]-1), GetLevelGun(PlayerInfo[playerid][pS9mm]));
			}
			if(gunid == 22)
			{
				PlayerInfo[playerid][p9mm]++;
				PlayerInfo[playerid][pCash] -= price;
				format(string, sizeof string, "[NANG CAP SUNG] : 9mm %s >  9mm %s", GetLevelGun(PlayerInfo[playerid][p9mm]-1), GetLevelGun(PlayerInfo[playerid][p9mm]));
			}
			SendClientMessage(playerid, -1, string);
		}
		else
		{
			DeletePVar(playerid, "GunID?");
			DeletePVar(playerid, "PriceUp?");
		}
	}
	return 1;
}

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	SendDamage(playerid, damagedid, amount, weaponid);
	return 1;
}
IsAblePedAnimation(playerid)
{
    if(GetPVarInt(playerid, "PlayerCuffed") != 0 || GetPVarInt(playerid, "Injured") == 1 || GetPVarInt(playerid, "IsFrozen") == 1)
	{
   		SendClientMessage(playerid, COLOR_GRAD2, "ban khong the lam dieu do vao thoi diem nay!");
   		return 0;
	}
    if(IsPlayerInAnyVehicle(playerid) == 1)
    {
		SendClientMessage(playerid, COLOR_GRAD2, "Doi hoi ban phai o ben ngoai 1 chiec xe.");
		return 0;
	}
	return 1;
}
PlayAnim(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}

//============================================================================//

//public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
//{
//}
