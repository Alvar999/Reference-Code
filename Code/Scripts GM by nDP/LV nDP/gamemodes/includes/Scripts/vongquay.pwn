//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

#include <YSI\y_hooks>

#define    XACNHANQUAYY             (16878)
#define    MUALUOTQUAYY             (16879)

//pMUALUOTQUAYY,
//pLuotquay,

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(_:clickedid != INVALID_TEXT_DRAW)
    {
        if(clickedid == VONGQUAY[4])
        {
        	TATVONGQUAY(playerid);
        	ShowPlayerDialog(playerid, XACNHANQUAYY, DIALOG_STYLE_LIST, "Ban co muon quay vong quay may man khong ?","Xac nhan\nHuy bo", "Chon", "Huy bo");
        	return 1;
        }
        if(clickedid == VONGQUAY[2])
        {
        	TATVONGQUAY(playerid);
        	ShowPlayerDialog(playerid, MUALUOTQUAYY, DIALOG_STYLE_LIST, "Ban muon muon mua bao nhiu luot ?","1 Luot\nUpdate", "Chon", "Huy bo");
        	return 1;
        }
        if(clickedid == VONGQUAY[3])
        {
        	TATVONGQUAY(playerid);
        	return 1;
        }
     }
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
    if(dialogid == XACNHANQUAYY)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
				if(PlayerInfo[playerid][pLuotquay] >= 1)
				{
                     DANGQUAYY(playerid);
                     return 1;
                }
                else
				{
					SendClientMessage(playerid, COLOR_RED,"Ban khong du luot quay");
				}
				return 1;
			}
			if(listitem == 1)
		    {
				SendClientMessage(playerid, COLOR_RED,"Ban da huy quay");
				return 1;
			}
		}
	}
	if(dialogid == MUALUOTQUAYY)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
				if(PlayerInfo[playerid][pCash] >= 10000)
				{
                     PlayerInfo[playerid][pCash] -= 10000;
                     SendClientMessage(playerid, COLOR_RED,"Ban da mua mot luot quay thanh cong voi gia 10.000$");
                     SendClientMessage(playerid, COLOR_RED,"Hay chac chac chan he thong khong bi loi , vui long /xemluotquay nha.");
                     PlayerInfo[playerid][pLuotquay] += 1;
                     return 1;
                }
                else
				{
					SendClientMessage(playerid, COLOR_RED,"Ban khong co du tien de mua luot quay.");
				}
				return 1;
			}
			if(listitem == 1)
		    {
				SendClientMessage(playerid, COLOR_RED,"He thong van dang tiep tuc duoc Cap nhat.");
				return 1;
			}
		}
	}
	return 1;
}

//========================= Commands =========================================//

CMD:vongquay(playerid, params[])
{
   if (PlayerInfo[playerid][pLuotquay] >= 1)
   {
       TextDrawShowForPlayer(playerid, VONGQUAY[0]);
       TextDrawShowForPlayer(playerid, VONGQUAY[1]);
       TextDrawShowForPlayer(playerid, VONGQUAY[2]);
       TextDrawShowForPlayer(playerid, VONGQUAY[3]);
       TextDrawShowForPlayer(playerid, VONGQUAY[4]);
       TextDrawShowForPlayer(playerid, VONGQUAY[5]);
       SelectTextDraw(playerid,0xFF0000FF);
	   return 1;
   }
   else
   {
       SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co luot quay nao het.");
   }
   return 1;
}

CMD:xemluotquayy(playerid, params[])
{
    new str[2460], name[1280];
    format(str, sizeof(str), "So luot quay cua ban la : %d ",PlayerInfo[playerid][pLuotquay]);
    format(name, sizeof(name), "So luot quay cua : %s",GetPlayerNameEx(playerid));
    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, name, str, "Dong Lai", "");
    return 1;
}


//========================= UPDATE ===========================================//
forward TATVONGQUAY(playerid);
public TATVONGQUAY(playerid)
{
    TextDrawHideForPlayer(playerid,VONGQUAY[0]);
    TextDrawHideForPlayer(playerid,VONGQUAY[1]);
    TextDrawHideForPlayer(playerid,VONGQUAY[2]);
    TextDrawHideForPlayer(playerid,VONGQUAY[3]);
    TextDrawHideForPlayer(playerid,VONGQUAY[4]);
    TextDrawHideForPlayer(playerid,VONGQUAY[5]);
    CancelSelectTextDraw(playerid);
    return 1;
}

forward DANGQUAYY(playerid);
public DANGQUAYY(playerid)
{
	TogglePlayerControllable(playerid, 0);
	SetPVarInt(playerid, "IsFrozen", 1);
    GameTextForPlayer(playerid, "~w~He thong dang quay", 5000, 3);
    SetTimerEx("RDVONGQUAY", 5000, 0, "d", playerid);
    return 1;
}

forward RDVONGQUAY(playerid);
public RDVONGQUAY(playerid)
{
      DeletePVar(playerid, "IsFrozen");
      DeletePVar(playerid, "PlayerCuffed");
      PlayerCuffed[playerid] = 0;
      PlayerTied[playerid] = 0;
	  TogglePlayerControllable(playerid, 1);
      if(PlayerInfo[playerid][pLuotquay] >= 3000)
	  {
			SendClientMessage(playerid, COLOR_YELLOW, "");
			return 1;

	  }
	  else
	  {
	      switch(random(30))
	      {
		      case 1 .. 10:
			  {
			    SendClientMessage(playerid, COLOR_YELLOW, "Chuc mung , ban da chung mot cai lz gi do!.");
			  }
			  case 11 .. 20:
			  {
			    SendClientMessage(playerid, COLOR_YELLOW, "Chuc ban may man lan sau.");
			  }
			  case 21 .. 30:
			  {
			    SendClientMessage(playerid, COLOR_YELLOW, "Chuc mung , ban da chung gio'.");
		      }
	      }
	  }
      return 1;
}

//========================= TEXT DRAW ========================================//
/*new Text:VONGQUAY[6];

VONGQUAY[0] = TextDrawCreate(78.666679, 48.807388, "mdl-3056:vongquay");
TextDrawLetterSize(VONGQUAY[0], 0.000000, 0.000000);
TextDrawTextSize(VONGQUAY[0], 494.000000, 346.000000);
TextDrawAlignment(VONGQUAY[0], 1);
TextDrawColor(VONGQUAY[0], -1);
TextDrawSetShadow(VONGQUAY[0], 0);
TextDrawSetOutline(VONGQUAY[0], 0);
TextDrawBackgroundColor(VONGQUAY[0], 255);
TextDrawFont(VONGQUAY[0], 4);
TextDrawSetProportional(VONGQUAY[0], 0);
TextDrawSetShadow(VONGQUAY[0], 0);

VONGQUAY[1] = TextDrawCreate(50.000011, 110.614852, "mdl-3056:sadd");
TextDrawLetterSize(VONGQUAY[1], 0.000000, 0.000000);
TextDrawTextSize(VONGQUAY[1], 258.000000, 216.000000);
TextDrawAlignment(VONGQUAY[1], 1);
TextDrawColor(VONGQUAY[1], -1);
TextDrawSetShadow(VONGQUAY[1], 0);
TextDrawSetOutline(VONGQUAY[1], 0);
TextDrawBackgroundColor(VONGQUAY[1], 255);
TextDrawFont(VONGQUAY[1], 4);
TextDrawSetProportional(VONGQUAY[1], 0);
TextDrawSetShadow(VONGQUAY[1], 0);

VONGQUAY[2] = TextDrawCreate(82.666671, 325.903717, "mdl-3058:mualuotquay");
TextDrawLetterSize(VONGQUAY[2], 0.000000, 0.000000);
TextDrawTextSize(VONGQUAY[2], 73.000000, 31.000000);
TextDrawAlignment(VONGQUAY[2], 1);
TextDrawColor(VONGQUAY[2], -1);
TextDrawSetShadow(VONGQUAY[2], 0);
TextDrawSetOutline(VONGQUAY[2], 0);
TextDrawBackgroundColor(VONGQUAY[2], 255);
TextDrawFont(VONGQUAY[2], 4);
TextDrawSetProportional(VONGQUAY[2], 0);
TextDrawSetShadow(VONGQUAY[2], 0);

VONGQUAY[3] = TextDrawCreate(553.000183, 48.392604, "mdl-3058:THOAT");
TextDrawLetterSize(VONGQUAY[3], 0.000000, 0.000000);
TextDrawTextSize(VONGQUAY[3], 19.000000, 17.000000);
TextDrawAlignment(VONGQUAY[3], 1);
TextDrawColor(VONGQUAY[3], -1);
TextDrawSetShadow(VONGQUAY[3], 0);
TextDrawSetOutline(VONGQUAY[3], 0);
TextDrawBackgroundColor(VONGQUAY[3], 255);
TextDrawFont(VONGQUAY[3], 4);
TextDrawSetProportional(VONGQUAY[3], 0);
TextDrawSetShadow(VONGQUAY[3], 0);

VONGQUAY[4] = TextDrawCreate(196.999908, 324.659362, "mdl-3058:quay");
TextDrawLetterSize(VONGQUAY[4], 0.000000, 0.000000);
TextDrawTextSize(VONGQUAY[4], 73.000000, 32.000000);
TextDrawAlignment(VONGQUAY[4], 1);
TextDrawColor(VONGQUAY[4], -1);
TextDrawSetShadow(VONGQUAY[4], 0);
TextDrawSetOutline(VONGQUAY[4], 0);
TextDrawBackgroundColor(VONGQUAY[4], 255);
TextDrawFont(VONGQUAY[4], 4);
TextDrawSetProportional(VONGQUAY[4], 0);
TextDrawSetShadow(VONGQUAY[4], 0);

VONGQUAY[5] = TextDrawCreate(88.000015, 64.311103, "vong_quay_may_man");
TextDrawLetterSize(VONGQUAY[5], 0.444333, 3.591110);
TextDrawAlignment(VONGQUAY[5], 1);
TextDrawColor(VONGQUAY[5], 255);
TextDrawSetShadow(VONGQUAY[5], 0);
TextDrawSetOutline(VONGQUAY[5], 1);
TextDrawBackgroundColor(VONGQUAY[5], -1);
TextDrawFont(VONGQUAY[5], 2);
TextDrawSetProportional(VONGQUAY[5], 1);
TextDrawSetShadow(VONGQUAY[5], 0);*/
//============================================================================//
