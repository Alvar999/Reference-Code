//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

#include <YSI\y_hooks>

#define         DIALOG_ESHOP            	(5089)
#define         DIALOG_XAYNHA           	(5090)
#define 		DIALOG_NOITHAT				(5091)
#define 		DIALOG_KHUDAT 				(5092)
#define 		DIALOG_KHUDAT1 				(5093)
#define 		DIALOG_XAYDOOR				(5094)
#define 		DIALOG_XAYDOOR1 			(5095)
#define 		DIALOG_NOITHAT1 			(5096)
#define 		DIALOG_EDOORPICKUP			(5097)

CMD:eshop(playerid,params[]) {
	ShowPlayerDialog(playerid, DIALOG_ESHOP, DIALOG_STYLE_LIST, "DICH VU ESHOP", "Xay Nha\nXay Khu Dat\nXay Door", "Lua chon", "Huy bo");
	return 1;
}


hook OnPlayerConnect(playerid)
{
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch (dialogid){
	case DIALOG_ESHOP:{
	if (response)
	{
		 switch (listitem)
		 {
		 	case 0:
		 	{

			new  Float:toado1, Float:toado2, Float:toado3, khuvuc[MAX_ZONE_NAME];
			GetPlayer3DZone(playerid, khuvuc, sizeof(khuvuc));
			GetPlayerPos(playerid, toado1, toado2, toado3);
		for(new x;x<MAX_HOUSES;x++)
		{
		    if(HouseInfo[x][hOwned] == 0)
		    {
                new String1[128];
				format(String1, sizeof(String1), "Chu nha : %s\n\nSo nha : %d\n\nGia tien : 500 Credits\n\nKhu vuc : %s\n\nVi tri : %f, %f, %f\n\n\n#Luu y : Neu chon sai vi tri se bi xoa house va khong den bu\nXem Interior tai day : [ https://grovestreetngg.forumotion.com/t26-house-interiors-list ]",GetPlayerNameEx(playerid), x, khuvuc, toado1, toado2, toado3);
				ShowPlayerDialog(playerid, DIALOG_XAYNHA ,DIALOG_STYLE_MSGBOX,"XAY NHA", String1, "Xay Nha", "Huy bo");
				SetPVarInt(playerid,"idnha",x);
				break;
			}
		}

			}
			case 1:
			{
				ShowPlayerDialog(playerid, DIALOG_KHUDAT, DIALOG_STYLE_INPUT, "Khu dat Eshop","Nhap ten khu dat ben duoi", "Xac nhan", "Huy");

			}
			case 2:
			{
				ShowPlayerDialog(playerid, DIALOG_XAYDOOR, DIALOG_STYLE_INPUT, "ESHOP DOOR", "Nhap ten door ben duoi", "Xac nhan","Huy");
			}


		 }
	}
}
case DIALOG_XAYNHA:{
	if (response)
	{
		 if(PlayerInfo[playerid][pPhousekey] > 0 || PlayerInfo[playerid][pPhousekey2] > 0) return SendClientMessageEx(playerid, COLOR_RED, "[ESHOP] Ban khong the so huu them nha");
		 if(PlayerInfo[playerid][pCredits] < 500)return  SendClientMessageEx(playerid, COLOR_RED, "[ESHOP] Ban khong co du Credits");
			new Float: Pos[3];
			new idnha = GetPVarInt(playerid, "idnha");
			GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
			GetPlayerPos(playerid, HouseInfo[idnha][hExteriorX], HouseInfo[idnha][hExteriorY], HouseInfo[idnha][hExteriorZ]);
			GetPlayerFacingAngle(playerid, HouseInfo[idnha][hExteriorA]);
			HouseInfo[idnha][hExtIW] = GetPlayerInterior(playerid);
			HouseInfo[idnha][hExtVW] = GetPlayerVirtualWorld(playerid);
			if(PlayerInfo[playerid][pPhousekey] == INVALID_HOUSE_ID) PlayerInfo[playerid][pPhousekey] = idnha;
			else PlayerInfo[playerid][pPhousekey2] = idnha;
			HouseInfo[idnha][hOwned] = 1;
			HouseInfo[idnha][hOwnerID] = GetPlayerSQLId(playerid);
			strcat((HouseInfo[idnha][hOwnerName][0] = 0, HouseInfo[idnha][hOwnerName]), GetPlayerNameEx(playerid), MAX_PLAYER_NAME);
			PlayerInfo[playerid][pCredits] -= 500;
			ReloadHouseText(idnha);
			OnPlayerStatsUpdate(playerid);
			SendClientMessageEx(playerid, COLOR_YELLOW, "[ESHOP] Cam on ban da su dung dich vu Eshop");
			ReloadHousePickup(idnha);

		 ShowPlayerDialog(playerid, DIALOG_NOITHAT, DIALOG_STYLE_LIST, "Hay chon noi that", "Interior 1\nInterior 2\nInterior 3\nInterior 4\nInterior 5\nInterior 6", "Chon", "");

	}
}
	case DIALOG_KHUDAT:
	{
		if (response)
		{
				new  Float:toado1, Float:toado2, Float:toado3, khuvuc[MAX_ZONE_NAME];
				new String1[128];
				GetPlayer3DZone(playerid, khuvuc, sizeof(khuvuc));
				GetPlayerPos(playerid, toado1, toado2, toado3);
				SetPVarString(playerid,"TenKhuDat",inputtext);
			format(String1,sizeof(String1), "Chu so huu : %s\n\nTen khu dat: %s\n\nGia tien: 1000 Credits\n\nKhu vuc: %s\n\nToa do: %f, %f, %f\n\n\n\n#Luu y : Neu xay vi tri khong phu hop se bi xoa va khong den bu",GetPlayerNameEx(playerid), inputtext, khuvuc, toado1, toado2, toado3);
			ShowPlayerDialog(playerid, DIALOG_KHUDAT1, DIALOG_STYLE_MSGBOX, "XAY KHU DAT", String1, "Xay", "Huy");
		}
	}
	case DIALOG_KHUDAT1:
	{
		if (response)
		{
			if (PlayerInfo[playerid][pCredits]<1000)return SendClientMessageEx(playerid, COLOR_RED, "[ESHOP] Ban khong co du 1000 Credits");
			new khudat[20], tenlabel[50];
			GetPVarString(playerid,"TenKhuDat",khudat,sizeof(khudat));
			format(tenlabel,sizeof(tenlabel), "Khu dat: %s\nChu so huu: %s",khudat,GetPlayerNameEx(playerid));
			for (new labelid; labelid<MAX_3DLABELS;labelid++)
			{
			 if(strcmp(TxtLabels[labelid][tlText], "None", true) == 0)
			 {
 				GetPlayerPos(playerid, TxtLabels[labelid][tlPosX], TxtLabels[labelid][tlPosY], TxtLabels[labelid][tlPosZ]);
				TxtLabels[labelid][tlInt] = GetPlayerInterior(playerid);
				TxtLabels[labelid][tlVW] = GetPlayerVirtualWorld(playerid);
				TxtLabels[labelid][tlPickupModel] = 3;
				strcat((TxtLabels[labelid][tlText][0] = 0, TxtLabels[labelid][tlText]), tenlabel, 50);
				PlayerInfo[playerid][pCredits] -= 1000;
				OnPlayerStatsUpdate(playerid);
				CreateTxtLabel(labelid);
				SaveTxtLabel(labelid);
				DeletePVar(playerid,"TenKhuDat");
				break;
			 }

			}

		}
	}
	case DIALOG_XAYDOOR:
	{
		if (response)
		{
			new  Float:toado1, Float:toado2, Float:toado3, khuvuc[MAX_ZONE_NAME];
			GetPlayer3DZone(playerid, khuvuc, sizeof(khuvuc));
			GetPlayerPos(playerid, toado1, toado2, toado3);
			SetPVarString(playerid, "TenDoor", inputtext);
			ShowPlayerDialog(playerid, DIALOG_EDOORPICKUP, DIALOG_STYLE_INPUT, "Vui long nhap ID Pickup Model", "Nhap ID Pickup Model tu 0->25\nCo the xem hinh anh tren forum [forum.testtest.vn]", "Nhap","");
		}
	}
	case DIALOG_EDOORPICKUP:
	{
		if (response)
		{
			new pickupid;
			pickupid = strval(inputtext);
			if (pickupid < 0 && pickupid > 25)
			{
				ShowPlayerDialog(playerid, DIALOG_EDOORPICKUP, DIALOG_STYLE_INPUT, "Vui long nhap ID Pickup Model", "Nhap ID Pickup Model tu 0->25\nCo the xem hinh anh tren forum [forum.testtest.vn]", "Nhap","");
			}
			else
			{
				new  Float:toado1, Float:toado2, Float:toado3, khuvuc[MAX_ZONE_NAME];
				new String1[128];
				new door[128];
				GetPlayer3DZone(playerid, khuvuc, sizeof(khuvuc));
				GetPlayerPos(playerid, toado1, toado2, toado3);
				GetPVarString(playerid, "TenDoor", door,sizeof(door));
				SetPVarInt(playerid, "IDPickup",pickupid);
				format(String1,sizeof(String1),"Chu so huu: %s\n\nTen door: %s\n\nID Pickup Model : %d\n\nGia tien: 1000 Credits\n\nKhu vuc: %s\n\nToa do: %f, %f, %f\n\n\n\n#Luu y : Neu xay vi tri khong phu hop se bi xoa va khong den bu",GetPlayerNameEx(playerid), door, pickupid, khuvuc, toado1, toado2, toado3);
				ShowPlayerDialog(playerid, DIALOG_XAYDOOR1, DIALOG_STYLE_MSGBOX, "XAY DOOR", String1,"XAY","HUY");
			}

		}
		else
		{
			DeletePVar(playerid,"TenDoor");
			DeletePVar(playerid,"IDPickup");
		}
	}
	case DIALOG_XAYDOOR1:
	{
		if (response)
		{
			if (PlayerInfo[playerid][pCredits] < 1000) return SendClientMessageEx(playerid, COLOR_RED, "[ESHOP] Ban khong co du 1000 Credits");
			new door[20], tendoor[128];
			GetPVarString(playerid, "TenDoor", door,sizeof(door));
			format(tendoor,sizeof(tendoor),"%s",door);
			for(new doorid;doorid<MAX_DDOORS;doorid++)
			{
				if(strcmp(DDoorsInfo[doorid][ddDescription], "None", true) == 0)
				{
					PlayerInfo[playerid][pCredits] -= 500;
					OnPlayerStatsUpdate(playerid);
					GetPlayerPos(playerid, DDoorsInfo[doorid][ddExteriorX], DDoorsInfo[doorid][ddExteriorY], DDoorsInfo[doorid][ddExteriorZ]);
					GetPlayerFacingAngle(playerid, DDoorsInfo[doorid][ddExteriorA]);
					DDoorsInfo[doorid][ddExteriorVW] = GetPlayerVirtualWorld(playerid);
					DDoorsInfo[doorid][ddExteriorInt] = GetPlayerInterior(playerid);
					DDoorsInfo[doorid][ddType] = 1;
					DDoorsInfo[doorid][ddVIP] = 0;
					DDoorsInfo[doorid][ddDPC] = 0;
					DDoorsInfo[doorid][ddFamily] = -1;
					DDoorsInfo[doorid][ddFaction] = -1;
					DDoorsInfo[doorid][ddGroupType] = 0;
					DDoorsInfo[doorid][ddAdmin] = 0;
					DDoorsInfo[doorid][ddPickupModel] =  GetPVarInt(playerid, "IDPickup");
					strcat((DDoorsInfo[doorid][ddOwnerName][0] = 0, DDoorsInfo[doorid][ddOwnerName]), GetPlayerNameEx(playerid), 24);
					DDoorsInfo[doorid][ddOwner] = GetPlayerSQLId(playerid);
					strcat((DDoorsInfo[doorid][ddDescription][0] = 0, DDoorsInfo[doorid][ddDescription]), tendoor, 128);
					if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
					DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
					CreateDynamicDoor(doorid);
					SaveDynamicDoor(doorid);
					SetPVarInt(playerid, "IDDoor",doorid);
					ShowPlayerDialog(playerid, DIALOG_NOITHAT1, DIALOG_STYLE_LIST, "Chon noi that cho door", "Interior Door 1\nInterior Door 2\nInterior Door 3", "Chon", "");
					break;
				}
			}

		}
	}
	case DIALOG_NOITHAT:
	{
		if (response)
		{
			switch(listitem)
			{
				case 0:
				{
					new houseid = GetPVarInt(playerid, "idnha");
					HouseInfo[houseid][hInteriorX] = 1260.64;
					HouseInfo[houseid][hInteriorY] = -785.37;
					HouseInfo[houseid][hInteriorZ] = 1091.91;
					HouseInfo[houseid][hIntIW] = 5;
					HouseInfo[houseid][hIntVW] = houseid+6000;
					SaveHouse(houseid);
					DeletePVar(playerid, "idnha");
				}
				case 1:
				{
					new houseid = GetPVarInt(playerid, "idnha");
					HouseInfo[houseid][hInteriorX] = 140.17;
					HouseInfo[houseid][hInteriorY] = 1366.07;
					HouseInfo[houseid][hInteriorZ] = 1083.65;
					HouseInfo[houseid][hIntIW] = 5;
					HouseInfo[houseid][hIntVW] = houseid+6000;
					SaveHouse(houseid);
					DeletePVar(playerid, "idnha");
				}
				case 2:
				{
					new houseid = GetPVarInt(playerid, "idnha");
					HouseInfo[houseid][hInteriorX] = 2324.53;
					HouseInfo[houseid][hInteriorY] = -1149.54;
					HouseInfo[houseid][hInteriorZ] = 1050.71;
					HouseInfo[houseid][hIntIW] = 12;
					HouseInfo[houseid][hIntVW] = houseid+6000;
					SaveHouse(houseid);
					DeletePVar(playerid, "idnha");
				}
				case 3:
				{
					new houseid = GetPVarInt(playerid, "idnha");
					HouseInfo[houseid][hInteriorX] = 225.68;
					HouseInfo[houseid][hInteriorY] = 1021.45;
					HouseInfo[houseid][hInteriorZ] = 1084.02;
					HouseInfo[houseid][hIntIW] = 7;
					HouseInfo[houseid][hIntVW] = houseid+6000;
					SaveHouse(houseid);
					DeletePVar(playerid, "idnha");
				}
				case 4:
				{
					new houseid = GetPVarInt(playerid, "idnha");
					HouseInfo[houseid][hInteriorX] = 234.19;
					HouseInfo[houseid][hInteriorY] = 1063.73;
					HouseInfo[houseid][hInteriorZ] = 1084.21;
					HouseInfo[houseid][hIntIW] = 6;
					HouseInfo[houseid][hIntVW] = houseid+6000;
					SaveHouse(houseid);
					DeletePVar(playerid, "idnha");
				}
				case 5:
				{
					new houseid = GetPVarInt(playerid, "idnha");
					HouseInfo[houseid][hInteriorX] = 226.30;
					HouseInfo[houseid][hInteriorY] = 1114.24;
					HouseInfo[houseid][hInteriorZ] = 1080.99;
					HouseInfo[houseid][hIntIW] = 5;
					HouseInfo[houseid][hIntVW] = houseid+6000;
					SaveHouse(houseid);
					DeletePVar(playerid, "idnha");
				}



			}

		}
	}
	case DIALOG_NOITHAT1:
	{
		if (response)
		{
			switch (listitem)
			{
				case 0:
				{
					new doorid = GetPVarInt(playerid, "IDDoor");
					DDoorsInfo[doorid][ddInteriorX] = 2214.67285;
					DDoorsInfo[doorid][ddInteriorY] = -1150.47839;
					DDoorsInfo[doorid][ddInteriorZ] = 1025.79687;
					DDoorsInfo[doorid][ddInteriorInt] = 15;
					DDoorsInfo[doorid][ddInteriorVW] = doorid+6000;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[ESHOP] Cam on ban da su dung dich vu Eshop");
					SaveDynamicDoor(doorid);
					DeletePVar(playerid, "IDDoor");
					DeletePVar(playerid, "IDPickup");
					DeletePVar(playerid, "TenDoor");

				}
				case 1:
				{
					new doorid = GetPVarInt(playerid, "IDDoor");
					DDoorsInfo[doorid][ddInteriorX] = 965.23339;
					DDoorsInfo[doorid][ddInteriorY] = 2107.70898;
					DDoorsInfo[doorid][ddInteriorZ] = 1011.03027;
					DDoorsInfo[doorid][ddInteriorInt] = 1;
					DDoorsInfo[doorid][ddInteriorVW] = doorid+6000;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[ESHOP] Cam on ban da su dung dich vu Eshop");
					SaveDynamicDoor(doorid);
					DeletePVar(playerid, "IDDoor");
					DeletePVar(playerid, "IDPickup");
					DeletePVar(playerid, "TenDoor");

				}
				case 2:
				{
					new doorid = GetPVarInt(playerid, "IDDoor");
					DDoorsInfo[doorid][ddInteriorX] = 2157.38378;
					DDoorsInfo[doorid][ddInteriorY] = 1596.05334;
					DDoorsInfo[doorid][ddInteriorZ] = 999.96875;
					DDoorsInfo[doorid][ddInteriorInt] = 1;
					DDoorsInfo[doorid][ddInteriorVW] = doorid+6000;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[ESHOP] Cam on ban da su dung dich vu Eshop");
					SaveDynamicDoor(doorid);
					DeletePVar(playerid, "IDDoor");
					DeletePVar(playerid, "IDPickup");
					DeletePVar(playerid, "TenDoor");

				}

			}
		}
	}


}
	return 1;
}

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
