//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

#include <YSI\y_hooks>

/*//task ServerHeartbeatTwo[1000]() {
//congnhan
    foreach(new i: Player)
	if(TGCheTaoCN[i] > 0)
	{
		if(--TGCheTaoCN[i] <= 0)
		{
			SetPlayerCheckpoint(i, 2120.3015,-1439.6949,1037.7734, 1.5);
			TGCheTaoCN[i] = -2;
			GameTextForPlayer(i, "~y~Da che tao xong", 1000, 6);
		}
		new str[50];
		format(str,sizeof(str), "~r~Thoi gian cho con lai:~n~~y~%d giay", TGCheTaoCN[i]);
		GameTextForPlayer(i, str, 1000, 6);
	}
	UpdateCarRadars();

	if (CharmReloadTimer == 0 && ++CharmMainTimer == 1800)
	{
		RemoveCharmPoint();
	}

	if (CharmMainTimer >= 1800)
	{
		if (++CharmReloadTimer == 5400)
		{
			SelectCharmPoint();
			CharmReloadTimer = 0;
			CharmMainTimer = 0;
		}
	}
}*/


hook OnPlayerConnect(playerid)
{
    //congnhan
	CreateDynamicPickup(1239, 23, 2107.8906,-1438.0334,1031.4219); // Lay nguyen lieu
	CreateDynamicPickup(1239, 23, 2120.3015,-1439.6949,1037.7734); // Khu vuc che tao vat pham
	CreateDynamicPickup(1239, 23, 2097.6223,-1448.6163,1031.4219); // Dong goi thung hang
	CreateDynamicPickup(1239, 23, 2079.9531,-1448.6655,1031.4219); // Nhan thung hang
	CreateDynamicPickup(1239, 23, 2086.6545,-1460.5515,1025.0703); // Chat thung hang
	
	//congnhan
	CreateDynamic3DTextLabel("De lay nguyen lieu \nSu dung /laynguyenlieu de lay nguyen lieu.",COLOR_YELLOW,2107.8906,-1438.0334,1031.4219+0.6, 5.0);// Lay nguyen lieu
	CreateDynamic3DTextLabel("Khu vuc de che tao vat pham.",COLOR_YELLOW,2120.3015,-1439.6949,1037.7734+0.6, 5.0);// Khu vuc che tao vat pham
	CreateDynamic3DTextLabel("De dong goi thung hang \nSu dung /donggoi de dong goi hang.",COLOR_YELLOW,2097.6223,-1448.6163,1031.4219+0.6, 5.0);// Dong goi thung hang
	CreateDynamic3DTextLabel("De nhan thung hang \nSu dung /nhanhang de nhan thung hang.",COLOR_YELLOW,2079.9531,-1448.6655,1031.4210+0.6, 5.0);// Nhan thung hang
	CreateDynamic3DTextLabel("De giao hang \nSu dung /chathang de giao hang.",COLOR_YELLOW,2086.6545,-1460.5515,1025.0703+0.6, 5.0);// Chat thung hang
	CreateDynamic3DTextLabel("Công Viêc Công Nhân \nSu dung /xinviec de lua chon cong viec.",COLOR_YELLOW,2076.5063,-1460.5712,1031.4219+0.6, 5.0);// Chat thung hang
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    //congnhan
	TGCheTaoCN[playerid] = -1;
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
    //congnhan
	if(IsPlayerInRangeOfPoint(playerid, 1.5, 2120.3015,-1439.6949,1037.7734))
    {
		if(TGCheTaoCN[playerid] == -1)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Dang bat dau che tao vat pham xin hay doi trong 7 giay.");
			TGCheTaoCN[playerid] = 7;
			SetPlayerSpecialAction(playerid, 0);
			ClearAnimations(playerid);
			RemovePlayerAttachedObject(playerid, 9);
			DisablePlayerCheckpoint(playerid);
		}
		else if(TGCheTaoCN[playerid] == -2)
		{
			DisablePlayerCheckpoint(playerid);
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
			SetPlayerSpecialAction(playerid, 25);
			SetPlayerAttachedObject(playerid, 9, 1448, 1, 0.137000, 0.422999, -0.016999, 99.000030, -81.700111, -167.299850, 0.390999, 0.575000, 0.860999, 0, 0);
			SendClientMessage(playerid, COLOR_WHITE, "Hay mang hang len khay chuyen de dong goi.");
			TGCheTaoCN[playerid] = -1;
			SetPlayerCheckpoint(playerid, 2097.6223,-1448.6163,1031.4219, 1.5);
		}
    }
    
    if(IsPlayerInRangeOfPoint(playerid, 1.5, 2097.6223,-1448.6163,1031.4219))
	{
		SetPlayerSpecialAction(playerid, 0);
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid, 9);
		HangCN[playerid] = CreateObject(1448, 2097.52807,-1449.71618,1030.63134,0,0,0);
		DisablePlayerCheckpoint(playerid);
		SetPVarInt(playerid, "CNProgress", 2);
	}
	return 1;
}

hook OnObjectMoved(objectid)
{
    /*if(objectid != gFerrisWheel) return 0;

    SetTimer("RotateWheel",3*1000,0);*/
    //congnhan
    for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
	{
		if(objectid == HangCN[playerid])
		{
			DestroyObject(HangCN[playerid]);
			HangCN[playerid] = CreateObject(1220, 2080.03686,-1449.71618,1030.93164,0,0,0);
			GameTextForPlayer(playerid, "~y~Hang da duoc dong goi,ban co the lay hang", 2000, 6);
			SetPlayerCheckpoint(playerid, 2079.9531,-1448.6655,1031.4219, 1.5);
			SetPVarInt(playerid, "CNProgress", 4);
		}
	}
    return 1;
}

//============================================================================//
//congnhan
CMD:bolamhang(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 33 && PlayerInfo[playerid][pJob2] != 33)
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai cong nhan.");
	    return 1;
	}
	SetPlayerSpecialAction(playerid, 0);
	ClearAnimations(playerid);
	RemovePlayerAttachedObject(playerid, 9);
	DeletePVar(playerid, "CNProgress");
	TGCheTaoCN[playerid] = -1;
	SendClientMessageEx(playerid, COLOR_GREY, "Bo lam hang thanh cong.");
	return 1;
}

CMD:laynguyenlieu(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 33 && PlayerInfo[playerid][pJob2] != 33)
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai cong nhan.");
	    return 1;
	}
	if(GetPVarInt(playerid, "CNProgress") == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban dang cam nguyen lieu tren tay.");
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2107.8906,-1438.0334,1031.4219)) return SendClientMessageEx(playerid , COLOR_GREY, "Khong dung o noi lay nguyen lieu.");
	SetPVarInt(playerid, "CNProgress", 1);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 0, 1);
	SetPlayerAttachedObject(playerid, 9, 1462, 1, 0.069999, 0.293999, -0.299999, -7.399992, 6.700002, 83.900032, 0.363999, 0.177000, 0.281999, 0, 0);
	SendClientMessageEx(playerid, COLOR_WHITE, "Hay di len cau thang de che tao vat pham.");
	SetPlayerCheckpoint(playerid, 2120.3015,-1439.6949,1037.7734, 1.5);
	TGCheTaoCN[playerid] = -1;
	return 1;
}

CMD:donggoi(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 33 && PlayerInfo[playerid][pJob2] != 33)
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai cong nhan.");
	    return 1;
	}
	if(GetPVarInt(playerid, "CNProgress") != 2) return SendClientMessageEx(playerid, COLOR_GREY, "Khong co vat pham duoc dat tren may.");
	if(!IsPlayerInRangeOfPoint(playerid, 4.0, 2097.6223,-1448.6163,1031.4219)) return SendClientMessageEx(playerid, COLOR_GREY, "Khong dung o noi dong goi.");
	SetPVarInt(playerid, "CNProgress", 3);
	ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.0, 1, 1, 1, 0, 3000,1);
	MoveObject(HangCN[playerid], 2080.03686,-1449.71618,1030.63134, 0.8);
	return 1;
}

CMD:nhanhang(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 33 && PlayerInfo[playerid][pJob2] != 33)
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai cong nhan.");
	    return 1;
	}
	if(GetPVarInt(playerid, "CNProgress") != 4) return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua co vat pham nao duoc dong goi.");
	if(!IsPlayerInRangeOfPoint(playerid, 1.5, 2079.9531,-1448.6655,1031.4219)) return SendClientMessageEx(playerid, COLOR_GREY, "Khong dung o noi nhan hang.");
	SetPVarInt(playerid, "CNProgress", 5);
	DisablePlayerCheckpoint(playerid);
	DestroyObject(HangCN[playerid]);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 1, 1, 1, 3000, 1);
	HangCN[playerid] = SetPlayerAttachedObject(playerid, 9, 1220, 1, 0.3, 0.470760, 0.000000, 0.000000, 90.217391, 0.000000, 0.8, 0.8, 0.8);
	return 1;
}

CMD:chathang(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 33 && PlayerInfo[playerid][pJob2] != 33)
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai cong nhan.");
	    return 1;
	}
	if(GetPVarInt(playerid, "CNProgress") != 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co thung hang de ban.");
	if(!IsPlayerInRangeOfPoint(playerid, 4, 2086.6545,-1460.5515,1025.0703)) return SendClientMessageEx(playerid, COLOR_GREY, "Khong dung o noi giao hang.");
	SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da nhan duoc 500.000$ vi da lam viec rat tot.");
	GivePlayerCash(playerid, 500000);
	PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE * 3;
	DeletePVar(playerid, "CNProgress");
	SetPlayerSpecialAction(playerid, 0);
	RemovePlayerAttachedObject(playerid, 9);
	ClearAnimations(playerid);
	return 1;
}

CMD:setcongnhan(playerid, params[])
{
   PlayerInfo[playerid][pJob] = 33;
   return 1;
}
