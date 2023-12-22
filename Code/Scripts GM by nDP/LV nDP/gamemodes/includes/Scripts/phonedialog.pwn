
#include <YSI\y_hooks>

#define         DACCT32                     (23110)
#define         DACCT33                     (23111)

CMD:goi(playerid, params[])
{
	if(PlayerInfo[playerid][pPnumber] == 0)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
		return 1;
	}
	if(PhoneOnline[playerid] > 0)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
		return 1;
	}
	if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
	}
	//
   	ShowPlayerDialog(playerid, DACCT32, DIALOG_STYLE_MSGBOX, "HE THONG DIEN THOAI", "Hay bam sao {FF0000}CHON{FFFFFF} de bam so dien thoai muon goi", "Chon", "Khong");
   	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    //payphone
	if(dialogid == DACCT32)
	{
		if(response)
    	{
   			ShowPlayerDialog(playerid, DACCT33, DIALOG_STYLE_INPUT, "SO DIEN THOAI","Xin vui long nhap mot {ff0000}so dien thoai{ffffff} ma ban muon goi", "Call", "Cancel");
   		}
	}
	if(dialogid == DACCT33)
    {
		new string[128];
		if (response)
		{
		   if (PlayerInfo[playerid][pJailTime] > 0)
	        {
		        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung Dien Thoai khi dang O? tu`.");
	            return 1;
	        }
	        if(PlayerTied[playerid] != 0 || PlayerCuffed[playerid] != 0)
	        {
		        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung trong khi dien thoai cua ban dang bi han che.");
		        return 1;
	        }
         	if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
         		return SendClientMessage(playerid, COLOR_GRAD2, "Ban ko the lam dieu do vao luc nay!");
        	}
        	format(string, sizeof(string), "* %s lay ra mot dien thoai.", GetPlayerNameEx(playerid));
        	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

        	if(strval(inputtext) == PlayerInfo[playerid][pPnumber])
        	{
         		SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai dang ban...");
        		return 1;
        	}
        	if(Mobile[playerid] != INVALID_PLAYER_ID)
        	{
        		SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
        		return 1;
        	}
        	foreach(new i: Player)
        	{
        		if(PlayerInfo[i][pPnumber] == strval(inputtext) && strval(inputtext) != 0)
        		{
        			new giveplayerid = i;
        			Mobile[playerid] = giveplayerid; //caller connecting
        			if(IsPlayerConnected(giveplayerid))
        			{
	            		if(giveplayerid != INVALID_PLAYER_ID)
		        		{
	        				if(PhoneOnline[giveplayerid] > 0)
	        				{
	         					SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do da tat nguon.");
	        					Mobile[playerid] = INVALID_PLAYER_ID;
		        				return 1;
	        				}
	         				if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
	        				{
	        					SendClientMessageEx(playerid, COLOR_GRAD2, "Ban nghe thay tieng may ban...");
	        					Mobile[playerid] = INVALID_PLAYER_ID;
	        					return 1;
	        				}
	        				if(Spectating[giveplayerid]!=0)
	        				{
	        					SendClientMessageEx(playerid, COLOR_GRAD2, "Ban dang nghe nhac chuong...");
	        					Mobile[playerid] = INVALID_PLAYER_ID;
		        				return 1;
		        			}
		        			if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
		        			{
	  	        				format(string, sizeof(string), "Dien thoai cua ban dang do chuong - go /p de tra loi. [Cuoc Goi ID: %s]", GetPlayerNameEx(playerid));
		        				SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
		        				RingTone[giveplayerid] = 10;
		        				format(string, sizeof(string), "* dien thoai cua %s do chuong.", GetPlayerNameEx(i));
		        				SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Ban co the dung T de noi chuyen dt. go /hangup de tat may.");
		        				ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		        				new Float:rX, Float:rY, Float:rZ;
		        				GetPlayerPos(giveplayerid, rX, rY, rZ);
			        			CellTime[playerid] = 1;
			        			SetPlayerAttachedObject(playerid, 9, 330, 6);
			        			return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		        			}
        				}
        			}
        		}
        	}
        	SendClientMessageEx(playerid, COLOR_GRAD2, "Cuoc goi cua ban Khong hoan thanh, vui long kiem tra lai so.");
        	return 1;
        }
    }
	return 1;
}

